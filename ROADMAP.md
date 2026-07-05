# Roadmap

## Completed

- [x] JavaScript implementation (Discord.js v14)
- [x] TypeScript implementation (Discord.js v14 + TypeScript)
- [x] Go implementation (DiscordGo)
- [x] Rust implementation (Serenity)
- [x] Python implementation (discord.py v2)
- [x] C# implementation (Discord.Net v3)
- [x] Java implementation (JDA v5)
- [x] Kotlin implementation (Kord)
- [x] C++ implementation (DPP)
- [x] Dart implementation (Nyxx)
- [x] Ruby implementation (Discordrb)
- [x] Lua implementation (Discordia)
- [x] PHP implementation (DiscordPHP)
- [x] JavaScript SQL / Sequelize edition
- [x] TypeScript SQL / Sequelize edition
- [x] Go SQL / GORM edition
- [x] Rust SQL / Diesel edition
- [x] Python SQL / SQLAlchemy edition
- [x] C# SQL / EF Core edition
- [x] Java SQL / Hibernate edition
- [x] Kotlin SQL / Exposed edition
- [x] C++ SQL / sqlpp11 edition
- [x] Dart SQL / drift edition
- [x] Ruby SQL / Sequel edition
- [x] Lua SQL / LuaSQL edition
- [x] PHP SQL / Eloquent edition

### Stability Fixes Applied (v0.9.0) — July 2026

- [x] JS Core & JS Sequelize — Fixed `pathToFileURL` missing import (ReferenceError), `config.js` placeholder values unreadable from env, malformed webhook thumbnail URLs, empty catch blocks, cooldown memory leaks, fire-and-forget webhooks, missing graceful shutdown
- [x] Python Core — Fixed missing `motor` dependency, `prefix` attribute lookup crash, ping command showing epoch instead of latency, missing `tree.sync()` (slash commands never appeared), thread-per-command cooldown replaced with asyncio, duplicate `on_error` listeners, DNS global override removed
- [x] Go Core — Fixed config.go single-line formatting (would not compile), wasteful REST API ping call, bot starting before slash command registration, ineffective anti-crash panic handler
- [x] Dart Core — Fixed bot exiting immediately after startup (`Duration.zero` bug), added latency to ping command, cooldown memory leak fix
- [x] TS Sequelize — Fixed eager `getSequelize()` call at module load, non-null assertions on DB config, removed unused `puppeteer` (300MB), same pattern fixes as JS core
- [x] **TS Core (second audit pass)** — Fixed malformed webhook thumbnail URLs (`https:cdn...` → `https://cdn...`), removed global DNS override (`dns.setServers`), replaced hardcoded `flags: 64` with `MessageFlags.Ephemeral`, fixed empty prefix args crash (`args.shift()` → `args.shift()?.toLowerCase()`), added graceful shutdown (`SIGINT`/`SIGTERM`), replaced empty catch blocks in all 6 webhook files with `console.error`, converted Events.ts and Models.ts to use `pathToFileURL` for ESM consistency, replaced per-user `setTimeout` cooldown with periodic cleanup, removed unused `puppeteer` dependency, aligned version to 0.9.0, added `.gitignore`
- [x] Rust Core — Fixed deprecated discriminator usage (Discord API v10), unclosed HTTP response body in ping command, hardcoded `mongo_status: false`
- [x] C# Core — Fixed `SetOnInsert` invalid syntax (runtime crash), added missing `Points` field to User model
- [x] Java Core — Fixed `pom.xml` main class mismatch, added MongoDB client cleanup
- [x] Kotlin Core — Fixed webhook env var name mismatch between config and `.env.example`, slash commands registered before gateway connected, added latency to ping command
- [x] Kotlin Sequelize — Added missing SQLite/MySQL JDBC drivers, added shutdown hook for DB cleanup
- [x] C++ Core — Removed SSL verification disable (security), cooldown memory leak fix, signal handler async-signal-safety fix
- [x] C++ Sequelize — Added multi-dialect support (was SQLite-only), FetchContent fallback for dependencies
- [x] Lua Core — Added `pcall` error handling around bot run, marked MongoDB stub clearly
- [x] Lua Sequelize — Fixed SQL injection vulnerability (parameterized queries instead of string concat), added LIMIT to all()
- [x] PHP Core — Switched from `$_ENV` to `getenv()` (reliable), added message content intent
- [x] PHP Sequelize — Fixed fragile DB storage path
- [x] Ruby Core — Fixed `OWNER_IDS` naming, changed `intents: [:all]` to minimal intents, fixed anti-crash
- [x] Ruby Sequelize — Fixed port parsing returning 0, added helpful error messages

## v1.0.0 Release Checklist

**v1.0.0** will be released once all of the following items are complete:

### Testing (ALL 27 repos)

- [ ] Unit tests for command handler loading
- [ ] Unit tests for event handler loading
- [ ] Unit tests for cooldown system
- [ ] Unit tests for config validation
- [ ] Unit tests for error formatting
- [ ] Integration tests for slash command execution
- [ ] Integration tests for prefix command execution
- [ ] Integration tests for cooldown enforcement
- [ ] Integration tests for webhook error reporting
- [ ] Integration tests for anti-crash protection
- [ ] Database tests for MongoDB CRUD (core editions)
- [ ] Database tests for SQL CRUD (database editions)
- [ ] Database tests for connection pooling
- [ ] Database tests for migration support
- [ ] Database tests for transaction support
- [ ] Error handling tests for invalid configurations
- [ ] Error handling tests for network failures
- [ ] Error handling tests for Discord API errors
- [ ] Error handling tests for missing permissions
- [ ] Compatibility tests for latest Discord API version
- [ ] Performance tests for command throughput
- [ ] Performance tests for cooldown overhead
- [ ] Performance tests for webhook latency
- [ ] Continuous Integration (GitHub Actions / CI) for every repo

### Features

- [ ] Full feature parity between all 13 MongoDB editions
- [ ] Full feature parity between all 13 SQL editions
- [ ] Full feature parity between MongoDB and SQL editions within each language
- [ ] Interactive CLI starter wizard (ala `create-discord-handler`)
- [ ] Slash command argument validation helpers
- [ ] Guild-specific command registration for development testing

### Infrastructure

- [ ] Docker images for every implementation
- [ ] GitHub Actions CI passing on every repo
- [ ] `.github` issue/PR templates for every repo (mirror hub)
- [ ] `CODEOWNERS` for every repo
- [ ] Release workflow with automated changelog generation

### Documentation

- [ ] Complete API reference for every public function/class/method in every language
- [ ] JSDoc/TSDoc/Javadoc/etc. on all exports
- [ ] Inline code comments for non-obvious logic (NOT redundant comments)
- [ ] Migration guide from v0.9.x to v1.0.0
- [ ] Deployment guide (Docker, PM2, systemd, etc.)
- [ ] Tutorials: basic bot, database bot, webhook setup, sharding
- [ ] Troubleshooting guide
- [ ] Performance tuning guide

### Code Quality

- [ ] Zero lint warnings in every repo
- [ ] Zero TypeScript strict mode errors
- [ ] Zero Go vet warnings
- [ ] Zero Clippy warnings (Rust)
- [ ] Zero Pylint warnings
- [ ] Zero PHPStan level max warnings
- [ ] Consistent coding style enforced by formatter configs (`.editorconfig`, `.prettierrc`, `rustfmt.toml`, etc.)
- [ ] All `TODO` / `FIXME` / `HACK` comments resolved or tracked as issues

### Cross-Cutting Issue Progress

| Issue | Status |
| ----- | ------ |
| Remove hardcoded DNS resolver override | ✅ JS, TS, Py, Go, Dart, Rs, Cs, Java, Kt, Cpp, Lua, Php, Rb |
| Add graceful shutdown (SIGINT/SIGTERM handlers) | ✅ JS, TS, Py, Go, Dart, Rs, Cs, Java, Kt, Cpp, Lua, Php, Rb |
| Fix empty catch blocks in webhook utilities | ✅ JS, TS, Py, Go, Dart, Rs, Cs, Java, Kt, Cpp, Lua, Php, Rb |
| Fix fire-and-forget webhook promises (must be awaited) | ✅ JS, TS, Py, Go, Dart, Rs, Cs, Java, Kt, Cpp, Lua, Php, Rb |
| Fix cooldown memory leak (unbounded map growth) | ✅ JS, TS, Py, Go, Dart, Rs, Cs, Java, Kt, Cpp, Lua, Php, Rb |
- [ ] C++ Sequelize: generate proper sqlpp11 schema from model definition
- [ ] Rust Diesel: add migration support (`diesel migration generate/run`)
- [ ] Lua Sequelize: implement real connection pooling (not just raw connections)
- [ ] Python core: fix `send_message` for cooldown response (check `is_done()` first)

## Planned Features

### Short Term

- [ ] Zig implementation
- [ ] Nim implementation
- [ ] Swift implementation
- [ ] Standardized testing suite for all languages
- [ ] GitHub Actions CI for each implementation

### Medium Term

- [ ] Interactive CLI starter wizard (`npx create-discord-handler` equivalent for each language)
- [ ] Docker images for each implementation
- [ ] Helm charts for Kubernetes deployment
- [ ] Performance benchmarks across all languages
- [ ] Plugin system for extending functionality

### Long Term

- [ ] Web dashboard for bot management
- [ ] REST API wrapper implementations alongside gateway implementations
- [ ] Community-driven language contributions
- [ ] Integration with additional databases (RethinkDB, Redis, etc.)
