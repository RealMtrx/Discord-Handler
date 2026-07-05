# Best Practices

## Architecture

- Keep each command in its own file for testability and maintainability.
- Use the provided directory structure — it scales well from one command to one hundred.
- Separate business logic from Discord-specific code. Your command handler should call utility functions, not contain HTTP requests inline.

## Error Handling

- Always wrap command execution in try/catch blocks.
- Send user-facing errors as ephemeral responses so only the user sees them.
- Log errors with enough context to debug (command name, user ID, guild ID, arguments).

## Performance

- Use lazy loading: only load commands and events as needed.
- Cache frequently accessed data (guild configuration, user preferences) rather than querying MongoDB on every command.
- Avoid blocking operations in event handlers. Use async/await or coroutines.
- Set reasonable cooldowns — 3 seconds for most commands, longer for resource-intensive operations.

## Security

- Never hardcode tokens or secrets. Use environment variables or a `.env` file.
- Validate user permissions before executing privileged commands.
- Sanitize user input before using it in database queries or responses.
- Use Discord's ephemeral flag for sensitive responses.
- Rotate tokens if they are ever exposed.

## Configuration

- Provide sensible defaults for every configuration option.
- Document each configuration value and its purpose.
- Use a single `.env` file for local development and environment variables for production.

## Command Design

- Slash commands should be the primary interface. Prefix commands are provided for backward compatibility.
- Use descriptive names and descriptions for all slash command options.
- Provide clear feedback for every command — success, error, or cooldown status.
- Keep responses concise. Use embeds for complex information.

## Database

- Use connection pooling to avoid creating new connections for every operation.
- Handle connection failures gracefully — log the error and continue without DB features.
- Index frequently queried fields in MongoDB collections.
- Use upserts for user data to avoid separate create/update logic.

## Deployment

- Use a process manager (PM2, systemd, Docker) to keep the bot running.
- Set up health checks and automatic restarts.
- Monitor the error webhook channel for issues.
- Use a staging environment for testing changes before production.

## Code Quality

- Use the linting and formatting tools appropriate for your language.
- Write descriptive commit messages that explain why a change was made.
- Keep pull requests focused on a single concern.
- Review your own code before requesting reviews from others.
