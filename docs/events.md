# Events

Discord Handler uses an event-driven architecture. Events are handled in `src/Events/`.

## Available Events

| Event          | Trigger                          | File                      |
| -------------- | -------------------------------- | ------------------------- |
| `ready`        | Bot connects to Discord          | `ready.*`                 |
| `messageCreate`| A message is sent                | `messageCreate.*`         |
| `interactionCreate` | A slash command or component is used | `interactionCreate.*` |
| `guildCreate`  | Bot joins a server               | `guildCreate.*`           |
| `guildDelete`  | Bot leaves or is removed         | `guildDelete.*`           |

## Adding a New Event

1. Create a new file in `src/Events/` with the event name.
2. Implement the handler function.
3. Register the event in `main.*` or the bot entry point.

**JavaScript example — adding a typing indicator:**

```javascript
// src/Events/typingStart.js
module.exports = {
  name: 'typingStart',
  once: false,
  async execute(typing) {
    console.log(`${typing.user.tag} started typing in ${typing.channel.name}`);
  }
};
```

## Event Handler Pattern

Each event file exports a handler function that receives the event data and optionally the client instance.

### Rust

```rust
async fn message_create(&self, ctx: Context, msg: Message) {
  if msg.author.bot { return; }
  // Handle prefix commands
}
```

### C#

```csharp
client.MessageReceived += async (message) => {
  if (message.Author.IsBot) return;
  // Handle message
};
```

## Event Flow

```
Discord Gateway → Client → Event Dispatcher
                              ├── ready        → presence, command registration, report
                              ├── guildCreate  → log, webhook
                              ├── guildDelete  → log, webhook
                              ├── interactionCreate → slash command dispatch
                              └── messageCreate     → prefix command dispatch
```
