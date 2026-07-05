# Creating a Discord Bot

## Step 1: Create a Discord Application

1. Go to the [Discord Developer Portal](https://discord.com/developers/applications).
2. Click **New Application** and give it a name.
3. Navigate to the **Bot** section on the left sidebar.
4. Click **Reset Token** and copy the token. Store it securely — you will never see it again.

## Step 2: Configure Bot Permissions

In the **Bot** section:

- Enable **Message Content Intent** under Privileged Gateway Intents (required for prefix commands).
- Enable **Server Members Intent** if your bot needs member data.

## Step 3: Invite the Bot to a Server

1. Go to the **OAuth2 > URL Generator** section.
2. Under **Scopes**, select `bot` and `applications.commands`.
3. Under **Bot Permissions**, select the permissions your bot needs:
   - `Send Messages`
   - `Read Message History`
   - `Use Slash Commands`
   - `Embed Links` (if you send embeds)
   - `Attach Files` (if needed)
4. Copy the generated URL and open it in your browser.
5. Select a server and authorize the bot.

## Step 4: Set Up Your Environment

Create a `.env` file in the project root with your bot configuration:

```env
TOKEN=your_bot_token_here
PREFIX=!
BOT_NAME=Your Bot Name
MONGO_URI=mongodb://localhost:27017/discord-handler
ERROR_WEBHOOK=https://discord.com/api/webhooks/your_webhook_url
GUILD_LOG_WEBHOOK=https://discord.com/api/webhooks/your_webhook_url
```

## Step 5: Run the Bot

Follow the installation instructions for your chosen language in the [Installation Guide](installation.md).

## Required Intents

| Intent                | Purpose                       | Required |
| --------------------- | ----------------------------- | -------- |
| Guilds                | Server and channel data       | Yes      |
| Guild Messages        | Reading prefix commands       | Yes      |
| Message Content       | Reading message content       | Yes      |
| Guild Members         | Member join/leave events      | Optional |
| Guild Presences       | Online status tracking        | Optional |
| Message Reactions     | Reaction-based features       | Optional |

## Bot Token Security

- Never commit your `.env` file or expose your token in code.
- Use environment variables in production.
- Rotate your token if it is ever compromised.
