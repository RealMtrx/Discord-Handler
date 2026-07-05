# Permissions

Permissions control what users and bots can do in Discord servers.

## Permission Levels

Discord Handler supports three permission levels:

| Level   | Check                             | Use Case              |
| ------- | --------------------------------- | --------------------- |
| User    | User has required permission      | Role-based commands   |
| Owner   | User ID matches owner ID          | Sensitive operations  |
| Bot     | Bot has required permission       | Pre-execution check   |

## Checking Permissions

### JavaScript

```javascript
import { PermissionsBitField } from 'discord.js';

// Check if user has administrator
if (!interaction.member.permissions.has(PermissionsBitField.Flags.Administrator)) {
  return interaction.reply({ content: 'You need Administrator permission.', ephemeral: true });
}

// Check if bot can send messages in channel
if (!interaction.guild.members.me.permissionsIn(interaction.channel).has(PermissionsBitField.Flags.SendMessages)) {
  return interaction.reply({ content: 'I cannot send messages here.', ephemeral: true });
}
```

### Python

```python
if not interaction.user.guild_permissions.administrator:
    await interaction.response.send_message('You need Administrator permission.', ephemeral=True)
    return
```

### C#

```csharp
if (command.User is not SocketGuildUser guildUser || !guildUser.GuildPermissions.Administrator)
{
    await command.RespondAsync("You need Administrator permission.", ephemeral: true);
    return;
}
```

## Owner-Only Commands

Owner-only commands are restricted to the bot owner(s). These are configured in your `.env` file.

```javascript
const ownerIds = process.env.OWNER_IDS.split(',');

if (!ownerIds.includes(interaction.user.id)) {
  return interaction.reply({ content: 'Only the bot owner can use this command.', ephemeral: true });
}
```

## Required Bot Permissions

When inviting the bot, request these permissions:

| Permission         | Reason                               |
| ------------------ | ------------------------------------ |
| Send Messages      | Responding to commands               |
| Read Message History | Reading context                   |
| Use Slash Commands | Processing slash commands            |
| Embed Links        | Sending rich embed responses         |
| Attach Files       | Sending files (logs, images)         |

## Discord Permission Flags

| Flag                    | Value        |
| ----------------------- | ------------ |
| CREATE_INSTANT_INVITE   | 0x0000000001 |
| KICK_MEMBERS            | 0x0000000002 |
| BAN_MEMBERS             | 0x0000000004 |
| ADMINISTRATOR           | 0x0000000008 |
| MANAGE_CHANNELS         | 0x0000000010 |
| MANAGE_GUILD            | 0x0000000020 |
| SEND_MESSAGES           | 0x0000000800 |
| MANAGE_MESSAGES         | 0x0000002000 |
| EMBED_LINKS             | 0x0000004000 |
| ATTACH_FILES            | 0x0000008000 |
| READ_MESSAGE_HISTORY    | 0x0001000000 |
| MANAGE_ROLES            | 0x1000000000 |
| MANAGE_WEBHOOKS         | 0x2000000000 |
