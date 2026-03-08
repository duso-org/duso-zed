# Development Guide

## Building the Extension

### Prerequisites
- Rust 1.70+ with `wasm32-wasip1` target
- Zed (for testing)
- Duso installed and in PATH

### Setup
```bash
# Install the wasm target
rustup target add wasm32-wasip1

# Build the extension
cargo build --target wasm32-wasip1
```

### Installing for Development
1. Link the extension to Zed's extensions directory:
```bash
ln -s $(pwd) ~/.zed/extensions/zed-duso
```

2. Reload Zed (Cmd+Shift+P → search for "Reload Zed")

3. Open a `.du` file to test

### Testing
- Create test files in `languages/duso/` with `.du` extension
- Verify syntax highlighting works
- Test LSP features: hover, autocomplete, diagnostics
- Test snippets by typing snippet triggers

## Architecture

### Files Structure
```
.
├── Cargo.toml                 # Rust project manifest
├── extension.toml             # Zed extension configuration
├── src/
│   └── lib.rs                # Extension code (LSP launcher)
├── languages/duso/
│   ├── config.toml           # Language definition
│   ├── highlights.scm        # Syntax highlighting rules
│   ├── brackets.scm          # Bracket matching
│   ├── indents.scm           # Indentation rules
│   ├── outline.scm           # Code structure
│   └── snippets.json         # Code snippets
└── README.md                 # User documentation
```

### Key Components

#### 1. Extension Code (src/lib.rs)
- Implements `DusoExtension` struct
- Provides `language_server_command()` to launch `duso -lsp`
- Registered with `zed::register_extension!()`

#### 2. Language Configuration (languages/duso/config.toml)
- Defines language metadata (name, file extensions)
- Sets comment delimiters for smart commenting
- Configures indentation (tab size, hard tabs)

#### 3. Tree-Sitter Queries (*.scm files)
- **highlights.scm**: Syntax highlighting with scope names
- **brackets.scm**: Bracket pair matching
- **indents.scm**: Auto-indentation rules
- **outline.scm**: Code structure for outline view

#### 4. Extension Config (extension.toml)
- Extension metadata and version
- Language server configuration
- Tree-sitter grammar reference
- Language registration

### LSP Integration

The extension launches Duso's built-in LSP server:
```rust
zed::Command {
    command: "duso".into(),
    args: vec!["-lsp".into()],
    env: Default::default(),
}
```

This means:
- **No custom LSP server needed** - Duso provides it
- **Full LSP features** automatically available: diagnostics, completion, hover, etc.
- **Zero configuration** - Just needs `duso` in PATH

## Tree-Sitter Grammar

### Current Status
The extension currently references the Lua tree-sitter grammar (`tree-sitter-lua`) as a temporary solution. This works reasonably well since Duso and Lua share similar syntax:
- `function...end` blocks
- Similar control flow (`if/then/else/end`, `while/do/end`, `for/do/end`)
- Similar string and comment syntax

### Future Improvement: Custom Grammar
For production use, we should create a dedicated Duso tree-sitter grammar:

1. **Create tree-sitter-duso repository**
   ```bash
   cargo create tree-sitter-duso
   ```

2. **Define grammar.js** with Duso-specific patterns

3. **Update extension.toml**
   ```toml
   [grammars.duso]
   repository = "https://github.com/duso-org/tree-sitter-duso"
   rev = "<commit-sha>"
   ```

4. **Update highlights.scm** for the new grammar's node names

See [Tree-sitter documentation](https://tree-sitter.github.io/tree-sitter/creating-parsers) for creating grammars.

### Manual Grammar Testing
You can test the current grammar's parsing with:
```bash
# Install tree-sitter CLI
cargo install tree-sitter-cli

# Test parsing with Lua grammar
tree-sitter parse test.du
```

## Debugging

### LSP Server Issues
Check if `duso -lsp` works:
```bash
duso -lsp
# Should start without errors, showing protocol handshake
# Press Ctrl+C to stop
```

### Zed Extension Logs
1. Open Zed developer console: **View → Toggle Developer Console**
2. Look for errors related to "duso" language server
3. Check extension activation and LSP startup

### Grammar Issues
If syntax highlighting looks wrong:
1. The issue is likely in highlights.scm (query) or the grammar
2. Compare with Lua syntax highlighting (since we use Lua grammar)
3. For future: implement proper Duso tree-sitter grammar

## Publishing to Zed Registry

When ready for release:

1. **Update version** in `Cargo.toml` and `extension.toml`
2. **Create git tag**
   ```bash
   git tag v0.1.0
   git push origin v0.1.0
   ```
3. **Submit to Zed Registry**
   - Follow [Zed Extension Registry](https://github.com/zed-industries/extensions) instructions
   - Create PR with your extension

## Contributing

To contribute:
1. Fork and clone this repository
2. Make changes to src/ or languages/
3. Test locally (see "Testing" section above)
4. Submit a pull request

Please maintain:
- Clear commit messages
- Documentation for new features
- Testing of language features
