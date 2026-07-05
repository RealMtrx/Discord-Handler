using Discord;
using Discord.WebSocket;
using Discord.Net;
using System;
using System.Threading.Tasks;
using System.Linq;
using Newtonsoft.Json;

class Program
{
  private static DiscordSocketClient _client;
  private static string _prefix = "!";

  public static async Task Main(string[] args)
  {
    DotNetEnv.Env.Load();
    var token = Environment.GetEnvironmentVariable("TOKEN");
    _prefix = Environment.GetEnvironmentVariable("PREFIX") ?? "!";

    var config = new DiscordSocketConfig
    {
      GatewayIntents = GatewayIntents.AllUnprivileged | GatewayIntents.MessageContent
    };

    _client = new DiscordSocketClient(config);

    _client.Ready += OnReady;
    _client.SlashCommandExecuted += OnSlashCommand;
    _client.MessageReceived += OnMessage;

    await _client.LoginAsync(TokenType.Bot, token);
    await _client.StartAsync();

    await Task.Delay(-1);
  }

  private static async Task OnReady()
  {
    Console.WriteLine($"Logged in as {_client.CurrentUser.Username}");

    var command = new SlashCommandBuilder()
      .WithName("ping")
      .WithDescription("Replies with Pong!");

    try
    {
      await _client.CreateGlobalApplicationCommandAsync(command.Build());
      Console.WriteLine("Slash command registered");
    }
    catch (HttpException ex)
    {
      Console.WriteLine($"Failed to register command: {ex.Message}");
    }
  }

  private static async Task OnSlashCommand(SocketSlashCommand command)
  {
    if (command.Data.Name == "ping")
    {
      await command.RespondAsync("Pong!");
    }
  }

  private static async Task OnMessage(SocketMessage message)
  {
    if (message.Author.IsBot) return;
    if (!message.Content.StartsWith(_prefix)) return;

    var args = message.Content[_prefix.Length..].Split(' ', StringSplitOptions.RemoveEmptyEntries);
    if (args.Length == 0) return;

    switch (args[0].ToLower())
    {
      case "ping":
        await message.Channel.SendMessageAsync("Pong!");
        break;
    }
  }
}
