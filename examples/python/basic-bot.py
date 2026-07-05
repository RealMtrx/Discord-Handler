import discord
from discord import app_commands
import os
from dotenv import load_dotenv

load_dotenv()
TOKEN = os.getenv('TOKEN')
PREFIX = os.getenv('PREFIX', '!')


class Bot(discord.Client):
    def __init__(self):
        intents = discord.Intents.default()
        intents.message_content = True
        super().__init__(intents=intents)
        self.tree = app_commands.CommandTree(self)

    async def on_ready(self):
        await self.tree.sync()
        print(f'Logged in as {self.user}')

    async def on_message(self, message):
        if message.author.bot:
            return
        if not message.content.startswith(PREFIX):
            return

        args = message.content[len(PREFIX):].split()
        if not args:
            return

        cmd = args[0].lower()
        if cmd == 'ping':
            await message.reply('Pong!')


bot = Bot()


@bot.tree.command(name='ping', description='Replies with Pong!')
async def ping(interaction: discord.Interaction):
    await interaction.response.send_message('Pong!')


bot.run(TOKEN)
