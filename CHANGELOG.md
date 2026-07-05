# Changelog

All notable changes to the Discord Handler project will be documented in this file.

## [0.9.0] - 2026-07-05

### Added

- Full implementation for 13 languages: JavaScript, TypeScript, Go, Rust, Python, C#, Java, Kotlin, C++, Dart, Ruby, Lua, PHP
- Consistent modular architecture across all implementations
- Slash and prefix command systems
- MongoDB integration layer (full in 11 languages, stub in C++ and Lua)
- Anti-crash protection with webhook error reporting
- Per-command cooldown system
- Unicode emoji flat export system
- Webhook utilities for logging
- Startup reporting with color-coded terminal banner
- Central hub repository with documentation, examples, and guides
- SQL / Sequelize database editions for all 13 languages (Sequelize, GORM, Diesel, SQLAlchemy, EF Core, Hibernate, Exposed, sqlpp11, drift, Sequel, LuaSQL, Eloquent)
- Multi-database support: SQLite (default), PostgreSQL, and MySQL/MariaDB via configuration

### Fixed

- **JS Core & JS Sequelize**: Missing `pathToFileURL` import in `Commands.js` (ReferenceError), `config.js` always returning `#` placeholders instead of reading env vars, malformed webhook thumbnail URLs (`https:cdn...` → `https://cdn...`), empty catch blocks in all 6 webhook utilities, cooldown memory leak (unbounded Collection growth), fire-and-forget webhook promises (unhandled rejections), missing graceful shutdown handlers (`SIGINT`/`SIGTERM`), hardcoded ephemeral flag `64` instead of `MessageFlags.Ephemeral`, crash on empty prefix command args, removed unused `puppeteer` dependency (300MB)
- **Python Core**: Missing `motor` dependency (bot crashed on startup), `prefix` attribute lookup using wrong name (`bot.prefix` → `bot.command_prefix`), ping command displaying epoch timestamp instead of latency, missing `bot.tree.sync()` call (slash commands never appeared), `threading.Timer` per command causing thread exhaustion (replaced with async), duplicate `on_error` listeners, separate `CooldownManager` instances for slash and prefix (cooldowns bypassable), DNS global override breaking corporate networks, `owner_ids` defaulting to `["#", "#"]`
- **Go Core**: `config.go` on a single line with missing newlines (would not compile), wasteful REST API HTTP call in ping command (response body never closed), bot starting before slash command registration (race condition), anti-crash `defer recover()` only covering its own function scope
- **Dart Core**: Bot exiting immediately after startup (`Future.delayed(Duration.zero)` instead of `Duration.infinite`), ping command with no latency measurement, cooldown memory leak, missing `.env` load error handling
- **TypeScript Sequelize**: `getSequelize()` called eagerly at module load before database connect, non-null assertions on DB config fields, removed unused `puppeteer` (300MB), same fire-and-forget and empty catch patterns as JS core
- **Rust Core**: Deprecated discriminator usage (Discord API v10), unclosed HTTP response body in ping command, hardcoded `mongo_status: false` ignoring actual connection state
- **C# Core**: `SetOnInsert(u => u, user)` invalid syntax (runtime crash), missing `Points` field in User model
- **Java Core**: `pom.xml` main class mismatch (`discordhandler.Main` vs default package), MongoDB client never closed
- **Kotlin Core**: Webhook env var names config mismatch (`SLASH_COMMAND_WEBHOOK` vs `.env.example` `SLASH_WEBHOOK`), slash commands registered before gateway connected, ping command had no latency
- **Kotlin Sequelize**: Missing SQLite/MySQL JDBC drivers (Postgres only), no shutdown hook for DB cleanup
- **C++ Core**: SSL verification disabled for webhooks (`CURLOPT_SSL_VERIFYPEER, 0L` — security vulnerability), cooldown map growing unboundedly, signal handlers calling non-async-signal-safe functions
- **C++ Sequelize**: Hardcoded SQLite-only connection (no multi-dialect support), no FetchContent fallback for dependencies
- **Lua Core**: `client:run()` without error handling, MongoDB stub not clearly marked
- **Lua Sequelize**: SQL injection vulnerability (string concatenation with `db:escape()` instead of parameterized queries), no LIMIT on `all()` query
- **PHP Core**: `$_ENV` unreliable vs `getenv()`, missing message content intent for prefix commands
- **PHP Sequelize**: Fragile DB storage path relative to vendor directory
- **Ruby Core**: `OWNER_ID` (singular) inconsistent with other repos, `intents: [:all]` violating Discord API policy for verified bots, anti-crash never catching anything
- **Ruby Sequelize**: Port parsing returning 0 when env var missing, token fetch with no helpful error message
- **TS Core (second audit pass)**: Malformed webhook thumbnail URLs (`https:cdn...` → `https://cdn...`), global DNS override removed (`dns.setServers`), hardcoded `flags: 64` replaced with `MessageFlags.Ephemeral`, empty prefix args crash fixed, graceful shutdown added (`SIGINT`/`SIGTERM`), empty catch blocks replaced in all 6 webhook files, Events.ts and Models.ts converted to `pathToFileURL` for ESM consistency, cooldown cleanup switched from per-user `setTimeout` to periodic interval, unused `puppeteer` dependency removed, version aligned to 0.9.0, `.gitignore` added

### Changed

- All repos: unified version to `0.9.0`
- All repos: `.env.example` files updated with consistent env var naming
- All webhook files across all repos: empty catch blocks replaced with `console.error` / logging
- All event files across all repos: webhook calls now properly awaited
- All ping commands: removed wasteful duplicate REST API calls, added proper latency measurement
