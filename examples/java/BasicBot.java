import net.dv8tion.jda.api.JDABuilder;
import net.dv8tion.jda.api.entities.Activity;
import net.dv8tion.jda.api.events.interaction.command.SlashCommandInteractionEvent;
import net.dv8tion.jda.api.events.message.MessageReceivedEvent;
import net.dv8tion.jda.api.hooks.ListenerAdapter;
import net.dv8tion.jda.api.requests.GatewayIntent;
import io.github.cdimascio.dotenv.Dotenv;

public class BasicBot extends ListenerAdapter {
  private static String prefix;

  public static void main(String[] args) throws Exception {
    Dotenv dotenv = Dotenv.load();
    String token = dotenv.get("TOKEN");
    prefix = dotenv.get("PREFIX", "!");

    JDABuilder builder = JDABuilder.createDefault(token)
      .enableIntents(GatewayIntent.MESSAGE_CONTENT)
      .setActivity(Activity.playing("with Discord Handler"))
      .addEventBus(new BasicBot());

    builder.build();
  }

  @Override
  public void onReady(net.dv8tion.jda.api.events.session.ReadyEvent event) {
    System.out.println("Logged in as " + event.getJDA().getSelfUser().getTag());
    event.getJDA().upsertCommand("ping", "Replies with Pong!").queue();
  }

  @Override
  public void onSlashCommandInteraction(SlashCommandInteractionEvent event) {
    if (event.getName().equals("ping")) {
      event.reply("Pong!").queue();
    }
  }

  @Override
  public void onMessageReceived(MessageReceivedEvent event) {
    if (event.getAuthor().isBot()) return;

    String content = event.getMessage().getContentRaw();
    if (!content.startsWith(prefix)) return;

    String[] args = content.substring(prefix.length()).split("\\s+");
    if (args.length == 0) return;

    if (args[0].equalsIgnoreCase("ping")) {
      event.getChannel().sendMessage("Pong!").queue();
    }
  }
}
