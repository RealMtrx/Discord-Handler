#include <dpp/dpp.h>
#include <iostream>
#include <fstream>
#include <string>
#include <map>

std::map<std::string, std::string> loadEnv() {
  std::map<std::string, std::string> env;
  std::ifstream file(".env");
  std::string line;
  while (std::getline(file, line)) {
    auto pos = line.find('=');
    if (pos != std::string::npos) {
      env[line.substr(0, pos)] = line.substr(pos + 1);
    }
  }
  return env;
}

int main() {
  auto env = loadEnv();
  std::string token = env["TOKEN"];
  std::string prefix = env["PREFIX"].empty() ? "!" : env["PREFIX"];

  dpp::cluster bot(token);

  bot.on_ready([&bot, &prefix](const dpp::ready_t& event) {
    if (dpp::run_once<0>()) {
      std::cout << "Logged in as " << bot.me.username << std::endl;

      dpp::slashcommand pingcmd("ping", "Replies with Pong!", bot.me.id);
      bot.global_command_create(pingcmd);
      std::cout << "Slash command registered" << std::endl;
    }
  });

  bot.on_slashcommand([](const dpp::slashcommand_t& event) {
    if (event.command.get_command_name() == "ping") {
      event.reply("Pong!");
    }
  });

  bot.on_message_create([&bot, &prefix](const dpp::message_create_t& event) {
    if (event.msg.author.is_bot()) return;
    std::string content = event.msg.content;

    if (content.find(prefix) != 0) return;
    std::string cmd = content.substr(prefix.length());

    if (cmd.rfind("ping", 0) == 0) {
      bot.message_create(event.msg.channel_id, "Pong!");
    }
  });

  bot.start(dpp::st_wait);
  return 0;
}
