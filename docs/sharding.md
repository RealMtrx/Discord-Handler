# Sharding

Sharding splits your bot across multiple processes to handle large numbers of guilds. Discord requires bots in over 2,500 guilds to shard.

## When to Shard

- Your bot is in 2,500+ guilds (Discord requirement)
- You need horizontal scaling across multiple CPU cores
- You want to reduce memory usage per process

## How Sharding Works

Each shard connects to Discord's gateway independently. Shards are identified by an index (0-based) and a total count.

```
Bot Process
├── Shard 0 (guilds 0-999)
├── Shard 1 (guilds 1000-1999)
├── Shard 2 (guilds 2000-2999)
└── ...
```

## Discord.js Example

```javascript
const { ShardingManager } = require('discord.js');

const manager = new ShardingManager('./src/index.js', {
  totalShards: 'auto',         // Automatically determine shard count
  token: process.env.TOKEN,
});

manager.on('shardCreate', shard => {
  console.log(`Launched shard ${shard.id}`);
});

manager.spawn();
```

## Discord.py Example

```python
from discord.ext import commands

bot = commands.AutoShardedBot(
    command_prefix='!',
    intents=intents,
    shard_count=10,  # Or omit for auto
)

bot.run(token)
```

## Communication Between Shards

Shards cannot directly communicate. Use a shared database or a message broker:

- **Redis** — Pub/sub for real-time messaging
- **MongoDB** — Shared persistent state
- **RabbitMQ** — Reliable message queuing

## Best Practices

- Let your library handle shard count automatically when possible
- Store all persistent state in a shared database, not in memory
- Schedule recurring tasks on a single shard or use an external scheduler
- Monitor each shard's health independently
- Use shard-aware caching for frequently accessed data
