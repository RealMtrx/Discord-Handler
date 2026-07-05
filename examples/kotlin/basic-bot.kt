import dev.kord.core.Kord
import dev.kord.core.event.InteractionCreateEvent
import dev.kord.core.event.MessageCreateEvent
import dev.kord.core.event.ReadyEvent
import dev.kord.core.on
import dev.kord.core.behavior.interaction.respondEphemeral
import dev.kord.common.entity.SlashCommand
import io.github.cdimascio.dotenv.dotenv

suspend fun main() {
  val dotenv = dotenv()
  val token = dotenv["TOKEN"]
  val prefix = dotenv["PREFIX"] ?: "!"

  val kord = Kord(token)

  kord.on<ReadyEvent> {
    println("Logged in as ${kord.self.username}")

    kord.createGlobalChatInputCommand(
      "ping",
      "Replies with Pong!"
    )
    println("Slash command registered")
  }

  kord.on<InteractionCreateEvent> {
    if (interaction.commandName == "ping") {
      interaction.respond { content = "Pong!" }
    }
  }

  kord.on<MessageCreateEvent> {
    if (message.author?.isBot == true) return@on
    val content = message.content
    if (!content.startsWith(prefix)) return@on

    val args = content.removePrefix(prefix).split("\\s+".toRegex())
    if (args.isEmpty()) return@on

    if (args[0] == "ping") {
      message.channel.createMessage("Pong!")
    }
  }

  kord.login()
}
