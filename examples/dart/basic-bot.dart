import 'dart:io';
import 'package:nyxx/nyxx.dart';
import 'package:dotenv/dotenv.dart';

void main() async {
  final env = DotEnv()..load();
  final token = env['TOKEN']!;
  final prefix = env['PREFIX'] ?? '!';

  final client = await Nyxx.connectGateway(
    token,
    GatewayIntents.allUnprivileged | GatewayIntents.messageContent,
  );

  client.onReady.listen((event) async {
    print('Logged in as ${client.self.username}');

    try {
      await client.http.endpoints.createGlobalSlashCommand(
        client.self.id,
        SlashCommandBuilder('ping', 'Replies with Pong!', []),
      );
      print('Slash command registered');
    } catch (e) {
      print('Failed to register command: $e');
    }
  });

  client.onInteractionCreate.listen((event) async {
    final interaction = event.interaction;
    if (interaction is ISlashCommandInteraction) {
      if (interaction.commandName == 'ping') {
        await interaction.respond(MessageBuilder(content: 'Pong!'));
      }
    }
  });

  client.onMessageCreate.listen((event) async {
    final message = event.message;
    if (message.author.isBot) return;

    final content = message.content;
    if (!content.startsWith(prefix)) return;

    final args = content.substring(prefix.length).split(' ');
    if (args.isEmpty) return;

    if (args.first == 'ping') {
      await message.channel.sendMessage(MessageBuilder(content: 'Pong!'));
    }
  });

  await Future.delayed(Duration.zero);
}
