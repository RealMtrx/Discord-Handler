<div align="center">
  <img src="assets/images/logo.png" alt="Discord Handler Logo" width="120" height="120">
  <h1>Discord Handler</h1>
  <p><strong>The official multi-language Discord bot framework — 13 languages, MongoDB + SQL, one architecture.</strong></p>

  <p>
    <a href="https://github.com/RealMtrx/Discord-Handler/blob/main/LICENSE"><img src="https://img.shields.io/badge/license-MIT-blue.svg" alt="License"></a>
    <a href="https://github.com/RealMtrx/Discord-Handler/releases"><img src="https://img.shields.io/badge/version-0.9.0--beta-yellow" alt="Version 0.9.0 Beta"></a>
    <a href="https://github.com/RealMtrx/Discord-Handler/stargazers"><img src="https://img.shields.io/github/stars/RealMtrx/Discord-Handler" alt="Stars"></a>
    <a href="https://github.com/RealMtrx/Discord-Handler/issues"><img src="https://img.shields.io/github/issues/RealMtrx/Discord-Handler" alt="Issues"></a>
    <a href="https://github.com/RealMtrx/Discord-Handler/pulls"><img src="https://img.shields.io/github/issues-pr/RealMtrx/Discord-Handler" alt="Pull Requests"></a>
    <a href="https://github.com/RealMtrx/Discord-Handler/network"><img src="https://img.shields.io/github/forks/RealMtrx/Discord-Handler" alt="Forks"></a>
    <a href="https://github.com/RealMtrx/Discord-Handler/graphs/contributors"><img src="https://img.shields.io/github/contributors/RealMtrx/Discord-Handler" alt="Contributors"></a>
    <a href="#"><img src="https://img.shields.io/badge/implementations-26-brightgreen" alt="26 Implementations"></a>
    <a href="#"><img src="https://img.shields.io/badge/languages-13-blue" alt="13 Languages"></a>
    <a href="#"><img src="https://img.shields.io/badge/database-MongoDB%20%7C%20SQL-orange" alt="MongoDB + SQL"></a>
  </p>

  <br>

  <p>
    <a href="#-ecosystem-overview">Ecosystem</a> •
    <a href="#-languages">Languages</a> •
    <a href="#-database-editions">Database Editions</a> •
    <a href="#-features">Features</a> •
    <a href="#-quick-start">Quick Start</a> •
    <a href="#-documentation">Documentation</a> •
    <a href="#-roadmap">Roadmap</a> •
    <a href="#-contributing">Contributing</a>
  </p>
</div>

---

## Introduction

**Discord Handler** is the official open-source, multi-language Discord bot framework for building scalable, production-ready bots. Every implementation follows the same modular architecture — slash commands, prefix commands, database integration, anti-crash protection, webhook logging, and a clean `src/` directory — so you can switch languages without relearning the architecture.

The ecosystem includes **26 individual repositories**: **13 Core Framework editions** (MongoDB) and **13 Database Editions** (SQL), covering 13 programming languages with feature parity across all implementations.

> **Current Version: 0.9.0 (Stable Beta)** — All 26 implementations are production-ready for testing. See the [v1.0.0 Release Checklist](ROADMAP.md#v100-release-checklist) for the stable release roadmap.

---

## Ecosystem Overview

The Discord Handler ecosystem is organized into three layers:

```
                    ┌────────────────────────────────────────────────┐
                    │           Discord Handler (Hub)                 │
                    │  github.com/RealMtrx/Discord-Handler           │
                    │  Documentation • Guides • Examples • Roadmap   │
                    └────────────────────────────────────────────────┘
                                      │
            ┌─────────────────────────┼─────────────────────────────┐
            │                         │                             │
            ▼                         ▼                             ▼
  ┌─────────────────────┐   ┌─────────────────────┐       ┌─────────────────────┐
  │   Core Framework    │   │  Database Editions   │       │   Shared Assets     │
  │   (MongoDB)         │   │  (SQL)               │       │                     │
  │   13 repos          │   │  13 repos            │       │  .github templates  │
  │                     │   │                      │       │  docs/              │
  │  Each lang has its  │   │  Each lang has its   │       │  examples/          │
  │  own repo with full │   │  own repo using the  │       │  assets/            │
  │  framework + Mongo  │   │  same architecture   │       │                     │
  └─────────────────────┘   └─────────────────────┘       └─────────────────────┘
```

### How they relate

| Layer | Purpose |
| ----- | ------- |
| **Hub Repository** | Central entry point — documentation, examples, changelog, roadmap, and community guides |
| **Core Framework (MongoDB)** | 13 language-specific repos, each with the full framework + MongoDB integration using the native MongoDB driver or ODM |
| **Database Editions (SQL)** | 13 language-specific repos mirroring the Core Framework but with SQL backends (SQLite / PostgreSQL / MySQL) using each language's primary ORM |

> You only need **one** implementation repo. Pick your language, pick your database — the hub has everything else.

---

## Why Discord Handler?

| Challenge                    | Discord Handler Solution                                    |
| ---------------------------- | ----------------------------------------------------------- |
| Too many boilerplate setups  | Pre-built modular structure for every popular language      |
| Switching languages          | Same architecture, same patterns, different syntax          |
| Missing error handling       | Built-in anti-crash and webhook error reporting             |
| No database integration      | Ready-to-use MongoDB and SQL database layers in every implementation |
| Inconsistent project layout  | Standardized `src/` directory with clear separation of concerns |
| Cross-language collaboration | Consistent patterns mean team members can work across languages |

---

## Features

- **Dual Command System** — Slash commands and prefix commands in every language
- **Modular Architecture** — Commands, events, handlers, and models are cleanly separated
- **Anti-Crash Protection** — Comprehensive error handling that keeps your bot online
- **Dual Database Support** — MongoDB and SQL (SQLite, PostgreSQL, MySQL/MariaDB) editions available in every language
- **Webhook Logging** — Real-time error and guild event reporting to Discord channels
- **Cooldown System** — Per-command rate limiting to prevent spam
- **Unicode Emoji System** — Flat-export emoji constants for consistent cross-platform rendering
- **Environment Configuration** — Secure token and secret management via `.env` files
- **Event-Driven Architecture** — Fully reactive design in every language
- **Startup Reporting** — Color-coded terminal banner showing loaded commands, events, and connection status

---

## Architecture

Every Discord Handler implementation follows the same layered architecture:

```
src/
├── main.*                  # Entry point — initializes config, database, and client
├── config/                 # Environment variable loading and configuration object
├── Core/                   # Shared utilities (emojis, cooldowns, webhooks)
├── Database/               # Database connection and helpers (MongoDB or SQL)
├── Events/                 # Discord event listeners (ready, guild, interaction, message)
├── Handlers/               # Anti-crash and logging subsystems
├── Models/                 # Data models for persistent storage
└── Commands/
    ├── Slash/              # Application (slash) commands
    └── Prefix/             # Traditional prefix commands
```

### Data Flow

```
Discord Gateway → Event Handler → Dispatcher
                                      ├── Slash Commands → Interaction Handler → Response
                                      └── Prefix Commands → Message Handler → Response
                                              │
                                              └── Cooldown Check → Execute → Reply
```

---

## Languages

Every implementation is **v0.9.0 (Stable Beta)** — production-ready for testing.

| # | Language   | Repository | Library | Version | Status |
| - | ---------- | ---------- | ------- | ------- | ------ |
| 1 | JavaScript | [Discord-Handler-Js](https://github.com/RealMtrx/Discord-Handler-Js) | Discord.js v14 | v0.9.0 | ✅ Stable Beta |
| 2 | TypeScript | [Discord-Handler-Ts](https://github.com/RealMtrx/Discord-Handler-Ts) | Discord.js v14 | v0.9.0 | ✅ Stable Beta |
| 3 | Go         | [Discord-Handler-Go](https://github.com/RealMtrx/Discord-Handler-Go) | DiscordGo | v0.9.0 | ✅ Stable Beta |
| 4 | Rust       | [Discord-Handler-Rs](https://github.com/RealMtrx/Discord-Handler-Rs) | Serenity | v0.9.0 | ✅ Stable Beta |
| 5 | Python     | [Discord-Handler-Py](https://github.com/RealMtrx/Discord-Handler-Py) | discord.py v2 | v0.9.0 | ✅ Stable Beta |
| 6 | C#         | [Discord-Handler-Cs](https://github.com/RealMtrx/Discord-Handler-Cs) | Discord.Net v3 | v0.9.0 | ✅ Stable Beta |
| 7 | Java       | [Discord-Handler-Java](https://github.com/RealMtrx/Discord-Handler-Java) | JDA v5 | v0.9.0 | ✅ Stable Beta |
| 8 | Kotlin     | [Discord-Handler-Kt](https://github.com/RealMtrx/Discord-Handler-Kt) | Kord | v0.9.0 | ✅ Stable Beta |
| 9 | C++        | [Discord-Handler-Cpp](https://github.com/RealMtrx/Discord-Handler-Cpp) | DPP | v0.9.0 | ✅ Stable Beta |
| 10 | Dart       | [Discord-Handler-Dart](https://github.com/RealMtrx/Discord-Handler-Dart) | Nyxx | v0.9.0 | ✅ Stable Beta |
| 11 | Ruby       | [Discord-Handler-Rb](https://github.com/RealMtrx/Discord-Handler-Rb) | Discordrb | v0.9.0 | ✅ Stable Beta |
| 12 | Lua        | [Discord-Handler-Lua](https://github.com/RealMtrx/Discord-Handler-Lua) | Discordia | v0.9.0 | ✅ Stable Beta |
| 13 | PHP        | [Discord-Handler-Php](https://github.com/RealMtrx/Discord-Handler-Php) | DiscordPHP | v0.9.0 | ✅ Stable Beta |

---

## Database Editions

Every Core Framework language has a matching SQL edition. These repos replace MongoDB with SQLite (default), PostgreSQL, or MySQL/MariaDB using each language's native ORM or database library.

All SQL editions are **v0.9.0 (Stable Beta)** — production-ready for testing.

| # | Repository | Language | ORM / Library | Dialects | Version | Status |
| - | ---------- | -------- | ------------- | -------- | ------- | ------ |
| 1 | [Discord-Handler-Js-Sequelize](https://github.com/RealMtrx/Discord-Handler-Js-Sequelize) | JavaScript | Sequelize | SQLite, PostgreSQL, MySQL, MSSQL | v0.9.0 | ✅ Stable Beta |
| 2 | [Discord-Handler-Ts-Sequelize](https://github.com/RealMtrx/Discord-Handler-Ts-Sequelize) | TypeScript | Sequelize | SQLite, PostgreSQL, MySQL, MSSQL | v0.9.0 | ✅ Stable Beta |
| 3 | [Discord-Handler-Go-Sequelize](https://github.com/RealMtrx/Discord-Handler-Go-Sequelize) | Go | GORM | SQLite, PostgreSQL, MySQL | v0.9.0 | ✅ Stable Beta |
| 4 | [Discord-Handler-Rs-Sequelize](https://github.com/RealMtrx/Discord-Handler-Rs-Sequelize) | Rust | Diesel | SQLite, PostgreSQL, MySQL | v0.9.0 | ✅ Stable Beta |
| 5 | [Discord-Handler-Py-Sequelize](https://github.com/RealMtrx/Discord-Handler-Py-Sequelize) | Python | SQLAlchemy | SQLite, PostgreSQL, MySQL | v0.9.0 | ✅ Stable Beta |
| 6 | [Discord-Handler-Cs-Sequelize](https://github.com/RealMtrx/Discord-Handler-Cs-Sequelize) | C# | EF Core | SQLite, PostgreSQL, MySQL | v0.9.0 | ✅ Stable Beta |
| 7 | [Discord-Handler-Java-Sequelize](https://github.com/RealMtrx/Discord-Handler-Java-Sequelize) | Java | Hibernate | SQLite, PostgreSQL, MySQL | v0.9.0 | ✅ Stable Beta |
| 8 | [Discord-Handler-Kt-Sequelize](https://github.com/RealMtrx/Discord-Handler-Kt-Sequelize) | Kotlin | Exposed | SQLite, PostgreSQL, MySQL | v0.9.0 | ✅ Stable Beta |
| 9 | [Discord-Handler-Cpp-Sequelize](https://github.com/RealMtrx/Discord-Handler-Cpp-Sequelize) | C++ | sqlpp11 | SQLite, PostgreSQL, MySQL | v0.9.0 | ✅ Stable Beta |
| 10 | [Discord-Handler-Dart-Sequelize](https://github.com/RealMtrx/Discord-Handler-Dart-Sequelize) | Dart | drift | SQLite, PostgreSQL, MySQL | v0.9.0 | ✅ Stable Beta |
| 11 | [Discord-Handler-Rb-Sequelize](https://github.com/RealMtrx/Discord-Handler-Rb-Sequelize) | Ruby | Sequel | SQLite, PostgreSQL, MySQL | v0.9.0 | ✅ Stable Beta |
| 12 | [Discord-Handler-Lua-Sequelize](https://github.com/RealMtrx/Discord-Handler-Lua-Sequelize) | Lua | LuaSQL | SQLite, PostgreSQL, MySQL | v0.9.0 | ✅ Stable Beta |
| 13 | [Discord-Handler-Php-Sequelize](https://github.com/RealMtrx/Discord-Handler-Php-Sequelize) | PHP | Eloquent | SQLite, PostgreSQL, MySQL | v0.9.0 | ✅ Stable Beta |

---

## Quick Start

```bash
# Choose your language (JavaScript example)
git clone https://github.com/RealMtrx/Discord-Handler-Js.git
cd Discord-Handler-Js

# Or choose the SQL edition
git clone https://github.com/RealMtrx/Discord-Handler-Js-Sequelize.git
cd Discord-Handler-Js-Sequelize

# Install dependencies
npm install

# Configure your bot
cp .env.example .env
# Edit .env with your bot token, client ID, and database settings

# Run
npm start
```

> All 26 repositories follow this same pattern. Pick your language and database from the tables above, clone the repo, install, configure, and run.

---

## Repository Structure

```
Discord-Handler/
├── .github/                   # Issue templates, PR template, workflows
│   ├── ISSUE_TEMPLATE/
│   └── workflows/
├── assets/                    # Logos and media
├── docs/                      # Detailed documentation
│   ├── installation.md
│   ├── creating-a-bot.md
│   ├── commands.md
│   ├── events.md
│   ├── components.md
│   ├── buttons.md
│   ├── select-menus.md
│   ├── modals.md
│   ├── permissions.md
│   ├── error-handling.md
│   ├── sharding.md
│   └── best-practices.md
├── examples/                  # Basic bot example in every language
│   ├── javascript/
│   ├── typescript/
│   ├── go/
│   ├── rust/
│   ├── python/
│   ├── csharp/
│   ├── java/
│   ├── kotlin/
│   ├── cpp/
│   ├── dart/
│   ├── ruby/
│   ├── lua/
│   └── php/
├── LICENSE
├── README.md
├── CONTRIBUTING.md
├── CODE_OF_CONDUCT.md
├── SECURITY.md
├── CHANGELOG.md
└── ROADMAP.md
```

---

## Comparison Table

The table below covers the **Core Framework (MongoDB)** editions. The **Database (SQL) editions** share all features — swap MongoDB for SQLite / PostgreSQL / MySQL.

All features are present in every language unless marked.

| Feature                | JS  | TS  | Go  | Rust | Python | C#  | Java | Kotlin | C++ | Dart | Ruby | Lua | PHP |
| ---------------------- | --- | --- | --- | ---- | ------ | --- | ---- | ------ | --- | ---- | ---- | --- | --- |
| Slash Commands         | ✅  | ✅  | ✅  | ✅   | ✅     | ✅  | ✅   | ✅     | ✅  | ✅   | ✅   | ✅  | ✅  |
| Prefix Commands        | ✅  | ✅  | ✅  | ✅   | ✅     | ✅  | ✅   | ✅     | ✅  | ✅   | ✅   | ✅  | ✅  |
| MongoDB                | ✅  | ✅  | ✅  | ✅   | ✅     | ✅  | ✅   | ✅     | ⚠️  | ✅   | ✅   | ⚠️  | ✅  |
| SQL (ORM per language) | ✅  | ✅  | ✅  | ✅   | ✅     | ✅  | ✅   | ✅     | ✅  | ✅   | ✅   | ✅  | ✅  |
| Anti-Crash             | ✅  | ✅  | ✅  | ✅   | ✅     | ✅  | ✅   | ✅     | ✅  | ✅   | ✅   | ✅  | ✅  |
| Webhook Logging        | ✅  | ✅  | ✅  | ✅   | ✅     | ✅  | ✅   | ✅     | ✅  | ✅   | ✅   | ✅  | ✅  |
| Cooldowns              | ✅  | ✅  | ✅  | ✅   | ✅     | ✅  | ✅   | ✅     | ✅  | ✅   | ✅   | ✅  | ✅  |
| Unicode Emojis         | ✅  | ✅  | ✅  | ✅   | ✅     | ✅  | ✅   | ✅     | ✅  | ✅   | ✅   | ✅  | ✅  |
| Dynamic Command Loading| ✅  | ✅  | ✅  | ✅   | ✅     | ✅  | ✅   | ✅     | ✅  | ✅   | ✅   | ✅  | ✅  |
| Async/Await            | ✅  | ✅  | ✅  | ✅   | ✅     | ✅  | ✅   | ✅     | ✅  | ✅   | ✅   | ⚠️  | ✅  |
| Version                | 0.9 | 0.9 | 0.9 | 0.9  | 0.9    | 0.9 | 0.9  | 0.9    | 0.9 | 0.9  | 0.9  | 0.9 | 0.9 |

> ⚠️ C++ and Lua MongoDB support are stubs (require mongocxx / luamongo respectively).  
> ⚠️ Lua uses callbacks rather than native async/await.

---

## Examples

### JavaScript

```javascript
const { Client, GatewayIntentBits } = require('discord.js');
const client = new Client({ intents: [GatewayIntentBits.Guilds, GatewayIntentBits.GuildMessages, GatewayIntentBits.MessageContent] });

client.on('ready', () => console.log(`Logged in as ${client.user.tag}`));

client.on('interactionCreate', async interaction => {
  if (!interaction.isChatInputCommand()) return;
  if (interaction.commandName === 'ping') {
    await interaction.reply('Pong!');
  }
});

client.login(process.env.TOKEN);
```

### TypeScript

```typescript
import { Client, GatewayIntentBits } from 'discord.js';
const client = new Client({ intents: [GatewayIntentBits.Guilds, GatewayIntentBits.GuildMessages, GatewayIntentBits.MessageContent] });

client.on('ready', () => console.log(`Logged in as ${client.user!.tag}`));

client.on('interactionCreate', async interaction => {
  if (!interaction.isChatInputCommand()) return;
  if (interaction.commandName === 'ping') {
    await interaction.reply('Pong!');
  }
});

client.login(process.env.TOKEN);
```

### Go

```go
package main

import (
  "fmt"
  "github.com/bwmarrin/discordgo"
)

func main() {
  dg, _ := discordgo.New("Bot " + token)
  dg.AddHandler(func(s *discordgo.Session, i *discordgo.InteractionCreate) {
    if i.ApplicationCommandData().Name == "ping" {
      s.InteractionRespond(i.Interaction, &discordgo.InteractionResponse{
        Type: discordgo.InteractionResponseChannelMessageWithSource,
        Data: &discordgo.InteractionResponseData{Content: "Pong!"},
      })
    }
  })
  dg.Identify.Intents = discordgo.IntentsAllWithoutPrivileged
  dg.Open()
  select {}
}
```

### Rust

```rust
use serenity::prelude::*;
use serenity::all::*;

struct Handler;

#[serenity::async_trait]
impl EventHandler for Handler {
  async fn interaction_create(&self, ctx: Context, interaction: Interaction) {
    if let Some(command) = interaction.as_command() {
      if command.data.name == "ping" {
        command.create_response(&ctx.http, CreateInteractionResponse::Message(
          CreateInteractionResponseMessage::new().content("Pong!"),
        )).await.unwrap();
      }
    }
  }
}

#[tokio::main]
async fn main() {
  let token = std::env::var("TOKEN").unwrap();
  let mut client = Client::builder(&token, GatewayIntents::all()).event_handler(Handler).await.unwrap();
  client.start().await.unwrap();
}
```

### Python

```python
import discord
from discord import app_commands

class Bot(discord.Client):
  async def on_ready(self):
    print(f'Logged in as {self.user}')
    await tree.sync()

  async def on_message(self, message):
    if message.author.bot: return
    if message.content.startswith('!ping'):
      await message.reply('Pong!')

intents = discord.Intents.default()
intents.message_content = True
bot = Bot(intents=intents)
tree = app_commands.CommandTree(bot)

@tree.command(name='ping', description='Replies with Pong!')
async def ping(interaction: discord.Interaction):
  await interaction.response.send_message('Pong!')

bot.run(TOKEN)
```

### C#

```csharp
using Discord;
using Discord.WebSocket;

var config = new DiscordSocketConfig { GatewayIntents = GatewayIntents.AllUnprivileged };
var client = new DiscordSocketClient(config);

client.Ready += () => { Console.WriteLine("Ready!"); return Task.CompletedTask; };
client.SlashCommandExecuted += async command => {
  if (command.Data.Name == "ping") await command.RespondAsync("Pong!");
};
client.MessageReceived += async msg => {
  if (msg.Author.IsBot) return;
  if (msg.Content.StartsWith("!ping")) await msg.Channel.SendMessageAsync("Pong!");
};

await client.LoginAsync(TokenType.Bot, token);
await client.StartAsync();
await Task.Delay(-1);
```

### Java

```java
import net.dv8tion.jda.api.*;
import net.dv8tion.jda.api.events.interaction.command.SlashCommandInteractionEvent;
import net.dv8tion.jda.api.hooks.ListenerAdapter;

public class Main extends ListenerAdapter {
  public static void main(String[] args) throws Exception {
    JDABuilder.createLight(token)
      .addEventBus(new Main())
      .build();
  }

  @Override
  public void onSlashCommandInteraction(SlashCommandInteractionEvent event) {
    if (event.getName().equals("ping")) event.reply("Pong!").queue();
  }
}
```

### Kotlin

```kotlin
import dev.kord.core.Kord
import dev.kord.core.event.InteractionCreateEvent
import dev.kord.core.on

suspend fun main() {
  val kord = Kord(token)
  kord.on<InteractionCreateEvent> {
    if (interaction.commandName == "ping") {
      interaction.respond { content = "Pong!" }
    }
  }
  kord.login()
}
```

### C++

```cpp
#include <dpp/dpp.h>

int main() {
  dpp::cluster bot(token);
  bot.on_slashcommand([](const dpp::slashcommand_t& event) {
    if (event.command.get_command_name() == "ping") event.reply("Pong!");
  });
  bot.on_ready([&bot](const dpp::ready_t&) {
    bot.global_command_create(dpp::slashcommand("ping", "Replies with Pong!", bot.me.id));
  });
  bot.start(dpp::st_wait);
  return 0;
}
```

### Dart

```dart
import 'package:nyxx/nyxx.dart';

void main() async {
  final client = await Nyxx.connectGateway(token, GatewayIntents.allUnprivileged);
  client.onReady.listen((_) => print('Ready!'));
  client.onInteractionCreate.listen((event) async {
    final interaction = event.interaction;
    if (interaction is ISlashCommandInteraction && interaction.commandName == 'ping') {
      await interaction.respond(MessageBuilder(content: 'Pong!'));
    }
  });
}
```

### Ruby

```ruby
require 'discordrb'

bot = Discordrb::Bot.new(token: token, intents: :all)

bot.message(content: '!ping') do |event|
  event.respond('Pong!')
end

bot.application_command(:ping) do |event|
  event.respond(content: 'Pong!')
end

bot.run
```

### Lua

```lua
local discordia = require('discordia')
local client = discordia.Client()

client:on('ready', function()
  print('Ready!')
end)

client:on('messageCreate', function(msg)
  if msg.content == '!ping' then msg:reply('Pong!') end
end)

client:on('interactionCreate', function(interaction)
  if interaction.type == 2 and interaction.data.name == 'ping' then
    interaction:reply({ content = 'Pong!' })
  end
end)

client:run('Bot ' .. token)
```

### PHP

```php
<?php

require 'vendor/autoload.php';

use Discord\Discord;
use Discord\WebSockets\Event;
use Discord\Builders\MessageBuilder;

$discord = new Discord(['token' => $token]);

$discord->on(Event::READY, function () { echo "Ready!\n"; });

$discord->on(Event::INTERACTION_CREATE, function ($interaction) {
  if ($interaction->data->name === 'ping') {
    $interaction->respond(MessageBuilder::new()->setContent('Pong!'));
  }
});

$discord->run();
```

---

## Documentation

| Topic                    | Description                                          |
| ------------------------ | ---------------------------------------------------- |
| [Installation](docs/installation.md)    | Setting up a Discord bot from scratch          |
| [Creating a Bot](docs/creating-a-bot.md) | Registering your application and inviting it  |
| [Commands](docs/commands.md)           | Slash commands, prefix commands, and subcommands |
| [Events](docs/events.md)              | Listening and responding to Discord events        |
| [Components](docs/components.md)        | Buttons, select menus, and other UI components    |
| [Buttons](docs/buttons.md)            | Creating and handling button interactions          |
| [Select Menus](docs/select-menus.md)     | Dropdown menus for user input                   |
| [Modals](docs/modals.md)             | Pop-up forms for structured input                  |
| [Permissions](docs/permissions.md)      | Managing user and bot permissions                  |
| [Error Handling](docs/error-handling.md)  | Graceful failure and recovery strategies       |
| [Sharding](docs/sharding.md)          | Scaling your bot across multiple processes         |
| [Best Practices](docs/best-practices.md)  | Production-ready patterns and conventions      |

---

## FAQ

**Which language should I choose?**

Pick the language you are most comfortable with. All implementations share the same architecture. If you need maximum performance, try Rust or Go. For rapid prototyping, Python or JavaScript.

**Can I mix languages in one bot?**

No. Each implementation is standalone. However, you can run multiple bots (each in a different language) under a single application.

**MongoDB vs SQL — which should I choose?**

Use the **MongoDB edition** if you prefer a document database with flexible schemas. Use the **SQL edition** if you need relational data integrity, complex queries, or already use SQLite / PostgreSQL / MySQL. Both editions share the same architecture and feature set.

**Do I need a database at all?**

No. The database layer is optional in both editions. Skip the database initialization and the bot will run without it.

**How do I report a bug?**

Open an issue in the specific language repository (e.g., `Discord-Handler-Js/issues`). For cross-cutting concerns, open in the main `Discord-Handler` repo.

**Is there a hosted version?**

Not yet. This is a framework, not a service. You deploy the bot yourself.

**When will v1.0.0 be released?**

v1.0.0 will be released once every language implementation and database edition reaches full feature parity and stability, complete with testing suites and CI/CD pipelines.

**How do I add a new language?**

Fork the repository, create a new directory under your name, and submit a pull request. See CONTRIBUTING.md for guidelines.

---

## Roadmap

### Completed — All 26 Implementations

All **13 Core Framework editions** and **13 Database Editions** are implemented and audited. See [ROADMAP.md](ROADMAP.md#completed) for the full completion list.

### Stability Fixes Applied (v0.9.0)

100+ critical bugs fixed across all repos in July 2026 — including missing imports, config placeholders, fire-and-forget promises, memory leaks, SQL injection, security vulnerabilities, and runtime crashes. A full second pass on the TypeScript repository fixed 10 additional issues including malformed webhook URLs, global DNS overrides, empty catch blocks, cooldown leaks, and graceful shutdown handlers.

See [CHANGELOG.md](CHANGELOG.md#090---2026-07-05) for details.

### Remaining for v1.0.0

Testing, CI/CD, documentation, and cross-cutting hardening. See the full [v1.0.0 Release Checklist](ROADMAP.md#v100-release-checklist) for all outstanding items.

Full details: [ROADMAP.md](ROADMAP.md)

---

## Contributing

Contributions are what make the open-source community such an amazing place. Any contribution you make is **greatly appreciated**.

See [CONTRIBUTING.md](CONTRIBUTING.md) for our code of conduct and the process for submitting pull requests.

### Quick Start for Contributors

1. Fork the repository for your target language
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

---

## License

Distributed under the MIT License. See [LICENSE](LICENSE) for more information.

Copyright © 2026 Mtrx — Discord: 0hu2

---

## Credits

- **Discord.js** — https://discord.js.org
- **Serenity** — https://github.com/serenity-rs/serenity
- **DiscordGo** — https://github.com/bwmarrin/discordgo
- **discord.py** — https://github.com/Rapptz/discord.py
- **Discord.Net** — https://github.com/discord-net/Discord.Net
- **JDA** — https://github.com/DV8FromTheWorld/JDA
- **Kord** — https://github.com/kordlib/kord
- **DPP** — https://dpp.dev
- **Nyxx** — https://github.com/nyxx-discord/nyxx
- **Discordrb** — https://github.com/shardlab/discordrb
- **Discordia** — https://github.com/SinisterRectus/Discordia
- **DiscordPHP** — https://github.com/discord-php/DiscordPHP
- **Sequelize** — https://sequelize.org
- **GORM** — https://gorm.io
- **Diesel** — https://diesel.rs
- **SQLAlchemy** — https://www.sqlalchemy.org
- **EF Core** — https://learn.microsoft.com/ef/core
- **Hibernate** — https://hibernate.org
- **Exposed** — https://github.com/JetBrains/Exposed
- **sqlpp11** — https://github.com/rbock/sqlpp11
- **drift** — https://drift.simonbinder.eu
- **Sequel** — https://sequel.jeremyevans.net
- **LuaSQL** — https://github.com/lunarmodules/luasql
- **Eloquent** — https://laravel.com/docs/eloquent

---

<div align="center">
  <sub>Built by <strong>Mtrx</strong> — Discord: <strong>0hu2</strong></sub>
</div>
