# Commands

Discord Handler supports two types of commands: slash commands and prefix commands.

## Slash Commands

Slash commands are natively integrated into Discord's UI. Users type `/` to see available commands.

### Structure

```
src/Commands/Slash/
└── [Category]/
    └── [command].*     # Command implementation
```

### Creating a Slash Command

Create a new file in the appropriate category directory. The command registers itself automatically via the ready event.

**JavaScript:**

```javascript
import { SlashCommandBuilder } from 'discord.js';

export default {
  data: new SlashCommandBuilder()
    .setName('ping')
    .setDescription('Replies with Pong!'),
  async execute(interaction) {
    await interaction.reply('Pong!');
  }
};
```

**Python:**

```python
from discord import app_commands

@app_commands.command(name='ping', description='Replies with Pong!')
async def ping(interaction):
    await interaction.response.send_message('Pong!')
```

### Subcommands

Subcommands are created by nesting `.addSubcommand()` on the builder:

```javascript
new SlashCommandBuilder()
  .setName('config')
  .setDescription('Configuration commands')
  .addSubcommand(sub => sub
    .setName('view')
    .setDescription('View configuration'))
  .addSubcommand(sub => sub
    .setName('set')
    .setDescription('Set configuration value')
    .addStringOption(opt => opt
      .setName('key')
      .setDescription('Configuration key')
      .setRequired(true)));
```

## Prefix Commands

Prefix commands are triggered by typing a prefix followed by the command name (e.g., `!ping`).

### Structure

```
src/Commands/Prefix/
└── [Category]/
    └── [command].*     # Command implementation
```

### Creating a Prefix Command

**JavaScript:**

```javascript
export default {
  name: 'ping',
  description: 'Replies with Pong!',
  async execute(client, message, args) {
    await message.reply('Pong!');
  }
};
```

**Go:**

```go
package prefix

var Ping = &Command{
  Name:    "ping",
  Execute: func(s *discordgo.Session, m *discordgo.MessageCreate, args []string) {
    s.ChannelMessageSend(m.ChannelID, "Pong!")
  },
}
```

## Cooldowns

Every implementation includes a built-in cooldown system. Cooldowns are tracked per-user per-command.

```javascript
// Check cooldown before executing
const remaining = commandUtils.cooldown(message.author.id, 'ping', 3);
if (remaining) {
  return message.reply(`Please wait ${remaining}s before using this command.`);
}
```

## Command Categories

Commands are organized into categories (directories under `Slash/` or `Prefix/`):

```
Commands/
├── Slash/
│   ├── Public/
│   │   ├── ping.js
│   │   └── help.js
│   └── Admin/
│       ├── ban.js
│       └── kick.js
└── Prefix/
    ├── Public/
    └── Admin/
```

Categories are automatically discovered and loaded.
