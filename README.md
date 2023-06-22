# Discord Bot Logger

The Discord Bot Logger is a simple bot built using the discord.py library that logs whenever a member joins a voice channel. It provides a timestamped log entry for each voice channel entry.

## Features

- Logs the timestamp and the name of the member when they join a voice channel.
- Provides a simple and easy-to-understand implementation.

## Prerequisites

- Python 3.x
- discord.py library (version 1.7.3 or later)

## Installation

1. Clone the repository or download the source code files.
2. Install the required dependencies by running the following command:

   ```shell
   pip install discord.py
   ```

## Usage

1. Make sure the bot is invited to your Discord server using the following link: [Invite Link](https://discord.com/oauth2/authorize?client_id=YOUR_BOT_CLIENT_ID&permissions=314432&scope=bot) (Replace `YOUR_BOT_CLIENT_ID` with your bot's client ID).
2. Run the bot by executing the following command in the terminal:

   ```shell
   python bot.py
   ```

You should see the message "Logged in as BOT_USERNAME" in the console, indicating that the bot has successfully logged in.

3. When a member joins a voice channel, the bot will print a log entry in the following format:

```shell
TIMESTAMP: MEMBER_NAME joined VOICE_CHANNEL_NAME
```

Example:

```
2023-06-22 13:45:30: JohnDoe joined General Voice Channel

```
