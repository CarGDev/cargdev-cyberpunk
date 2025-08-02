# Contributing to CargDev-Cyberpunk.nvim

Thank you for your interest in contributing to CargDev-Cyberpunk.nvim! This document provides guidelines for contributing to the project.

## Getting Started

### Prerequisites

- Neovim 0.8.0 or higher
- Git
- A GitHub account

### Fork and Clone

1. Fork the repository on GitHub
2. Clone your fork locally:
   ```bash
   git clone https://github.com/YOUR_USERNAME/cargdev-cyberpunk.nvim.git
   cd cargdev-cyberpunk.nvim
   ```

## Development Setup

### Local Development

1. Create a new branch for your changes:
   ```bash
   git checkout -b feature/your-feature-name
   ```

2. Make your changes to the codebase

3. Test your changes:
   ```bash
   # Test the color scheme in Neovim
   nvim --headless -c "lua dofile('test/test_colors.lua')"
   ```

### Testing Your Changes

1. Open Neovim with your local version:
   ```bash
   nvim -u NONE -c "set runtimepath+=/path/to/your/cargdev-cyberpunk.nvim"
   ```

2. Test with different file types:
   ```bash
   nvim examples/sample.ts
   ```

3. Verify the colors are applied correctly

## Making Changes

### Code Style Guidelines

- Follow Lua best practices
- Use consistent indentation (2 spaces)
- Keep functions focused and concise
- Add comments for complex logic
- Maintain the cyberpunk aesthetic in color choices

### File Structure

```
lua/cargdev-cyberpunk/
├── init.lua          # Main plugin entry point
├── colors.lua        # Color palette definitions
└── plugin.lua        # Plugin configuration
```

### Color Guidelines

When adding new colors or modifying existing ones:

- Maintain high contrast for readability
- Use vibrant, neon colors that fit the cyberpunk theme
- Test colors in different lighting conditions
- Ensure accessibility standards are met

## Submitting Your Changes

### Commit Guidelines

1. Make atomic commits (one logical change per commit)
2. Use clear, descriptive commit messages
3. Follow conventional commit format:
   ```
   type(scope): description
   
   [optional body]
   [optional footer]
   ```

   Examples:
   - `feat(colors): add new neon purple for decorators`
   - `fix(highlights): correct function highlighting in TypeScript`
   - `docs(readme): update installation instructions`

### Pull Request Process

1. **One Change Per PR**: Each pull request should contain only one logical change or feature

2. **Update Documentation**: If your change affects user experience, update the README.md

3. **Test Thoroughly**: Ensure your changes work across different file types and Neovim configurations

4. **Create Pull Request**:
   - Go to your fork on GitHub
   - Click "New Pull Request"
   - Select the `master` branch as the base
   - Provide a clear title and description

### Pull Request Template

```markdown
## Description
Brief description of the changes made.

## Type of Change
- [ ] Bug fix
- [ ] New feature
- [ ] Documentation update
- [ ] Code refactoring

## Testing
- [ ] Tested with TypeScript files
- [ ] Tested with other file types
- [ ] Verified colors are applied correctly
- [ ] No breaking changes introduced

## Screenshots (if applicable)
Add screenshots showing the visual changes.

## Checklist
- [ ] My code follows the project's style guidelines
- [ ] I have tested my changes thoroughly
- [ ] I have updated documentation if needed
- [ ] My changes generate no new warnings
- [ ] I have added tests if applicable
```

## Review Process

1. **Code Review**: All PRs will be reviewed by maintainers
2. **Testing**: Changes will be tested in different environments
3. **Feedback**: You may be asked to make adjustments
4. **Merge**: Once approved, your PR will be merged to master

## Getting Help

If you need help or have questions:

1. Check existing issues and discussions
2. Create a new issue with detailed information
3. Join the project discussions

## Code of Conduct

- Be respectful and inclusive
- Focus on constructive feedback
- Help others learn and grow
- Follow the project's coding standards

## License

By contributing to this project, you agree that your contributions will be licensed under the MIT License.

---

Thank you for contributing to CargDev-Cyberpunk.nvim! Your help makes the project better for everyone. 