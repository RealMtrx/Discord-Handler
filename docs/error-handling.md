# Error Handling

Every Discord Handler implementation includes a comprehensive anti-crash system that prevents the bot from crashing due to unhandled errors.

## Anti-Crash Architecture

The anti-crash system operates at multiple levels:

1. **Global exception handlers** — catch unhandled rejections and exceptions
2. **Command-level try/catch** — isolate errors per command
3. **Webhook reporting** — send error details to a Discord channel
4. **Graceful degradation** — bot continues running after non-fatal errors

## Principles

- Never crash the process on a recoverable error
- Log errors with full stack traces
- Report errors to a Discord webhook for real-time monitoring
- Keep the bot running and available

## JavaScript

```javascript
// AntiCrash.js
process.on('unhandledRejection', (reason, promise) => {
  console.error('[AntiCrash] Unhandled Rejection:', reason);
  sendWebhook(config.errorWebhook, `**Unhandled Rejection**\n\`\`\`\n${reason}\n\`\`\``);
});

process.on('uncaughtException', (error) => {
  console.error('[AntiCrash] Uncaught Exception:', error);
  sendWebhook(config.errorWebhook, `**Uncaught Exception**\n\`\`\`\n${error.stack}\n\`\`\``);
});
```

## Python

```python
import sys
import traceback

async def on_error(event, *args, **kwargs):
    error = traceback.format_exc()
    print(f'[AntiCrash] Error in {event}: {error}')
    await send_webhook(config.error_webhook, f'**Error in {event}**\n```\n{error}\n```')

bot.on_error = on_error
```

## Rust

```rust
use tracing_subscriber;

fn main() {
    tracing_subscriber::fmt::init();

    std::panic::set_hook(Box::new(|panic_info| {
        let location = panic_info.location().map(|l| l.to_string()).unwrap_or_default();
        eprintln!("[AntiCrash] Panic at {}: {:?}", location, panic_info.payload());
    }));

    // Bot runs here
}
```

## Webhook Error Reporting

Errors are sent to a Discord webhook for real-time monitoring:

```javascript
async function sendWebhook(url, content) {
  if (!url) return;
  await fetch(url, {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify({ content }),
  });
}
```

## Best Practices

- Always wrap command execution in try/catch blocks
- Log errors with timestamps and context
- Send error reports to a dedicated Discord channel
- Use ephemeral responses for user-facing error messages
- Never expose stack traces to end users
- Monitor error webhook channel regularly
