# Contributing to Discord Handler

First off, thank you for considering contributing! Every contribution helps make this project better.

## Code of Conduct

By participating, you are expected to uphold our [Code of Conduct](CODE_OF_CONDUCT.md).

## How to Contribute

### Reporting Bugs

1. Check if the bug has already been reported in the [Issues](https://github.com/RealMtrx/Discord-Handler/issues).
2. If not, open a new issue using the [Bug Report Template](.github/ISSUE_TEMPLATE/bug_report.md).
3. Include as much detail as possible: steps to reproduce, expected behavior, actual behavior, and environment.

### Suggesting Features

1. Open a new issue using the [Feature Request Template](.github/ISSUE_TEMPLATE/feature_request.md).
2. Describe the feature in detail and explain why it would be valuable.

### Adding a New Language

1. Fork this repository.
2. Create a new directory `examples/<language>/` with a basic bot example.
3. Update the language table in `README.md`.
4. Create a new repository under `RealMtrx/Discord-Handler-<Lang>` with the full implementation.
5. Submit a pull request to this repository linking the new repository.

## Development Workflow

1. Fork the repository for the language you want to contribute to.
2. Create a feature branch (`git checkout -b feature/amazing-feature`).
3. Make your changes, following the existing code style and architecture.
4. Test your changes thoroughly.
5. Commit your changes with a clear, descriptive message.
6. Push to your fork (`git push origin feature/amazing-feature`).
7. Open a Pull Request against the `main` branch.

## Style Guidelines

- Follow the existing architecture pattern in the relevant language.
- Use consistent naming conventions (camelCase, PascalCase, snake_case) as appropriate for the language.
- Keep functions and methods focused on a single responsibility.
- Document public APIs with comments or docstrings.
- Do not add external dependencies unless absolutely necessary.
- Use Unicode emojis (real characters, not custom Discord IDs).

## Pull Request Checklist

- [ ] Code follows the existing architecture
- [ ] No new external dependencies without justification
- [ ] All existing features continue to work
- [ ] README and docs updated if applicable
- [ ] Commit messages are clear and descriptive

## Questions?

Open a [Discussion](https://github.com/RealMtrx/Discord-Handler/discussions) or ask in the relevant issue thread.
