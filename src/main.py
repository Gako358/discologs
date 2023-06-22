import discord
import datetime
from discord.ext import commands

bot = commands.Bot(command_prefix='!')

@bot.event
async def on_ready():
    print(f'Logged in as {bot.user.name}')

@bot.event
async def on_voice_state_update(member, before, after):
    if before.channel is None and after.channel is not None:
        current_time = datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')
        print(f'{current_time}: {member.name} joined {after.channel.name}')

bot.run('token')
