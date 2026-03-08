# Quick Start Guide

## Installation

### 1. Install Duso
First, make sure Duso is installed:

**macOS/Linux with Homebrew:**
```bash
brew tap duso-org/homebrew-duso
brew install duso
duso -version
```

**Direct Download:**
- Visit [Duso Releases](https://github.com/duso-org/duso/releases)
- Download the appropriate binary for your OS
- Extract and run `duso -install`

### 2. Install the Zed Extension

**Option A: From Zed Extensions (when published)**
1. Open Zed
2. Press `Cmd+Shift+P` (macOS) or `Ctrl+Shift+P` (Linux/Windows)
3. Type "Extensions"
4. Search for "duso"
5. Click Install

**Option B: From Source (Development)**
```bash
cd ~/.zed/extensions
git clone https://github.com/duso-org/zed-duso.git
```

Then reload Zed: `Cmd+Shift+P` → search "Reload Zed"

## First Steps

### 1. Create a Duso File
```bash
mkdir my-duso-project
cd my-duso-project
touch hello.du
```

### 2. Write Your First Script
Open `hello.du` in Zed and type:

```duso
// Your first Duso script
print("Hello, Duso!")

name = "World"
print("Hello, " + name + "!")
```

You should see syntax highlighting immediately!

### 3. Run Your Script
Open a terminal and run:
```bash
duso hello.du
```

Output:
```
Hello, Duso!
Hello, World!
```

## Using Code Snippets

Snippets make it quick to write common patterns. Type the snippet trigger and press `Tab`:

### Function Snippet
```
Type: fn
Tab: function declaration template appears
```

Before:
```
fn|
```

After:
```
function ${1:name}(${2:args})
  ${3}
end
```

### Control Flow Snippets

```duso
// Type: if [Tab]
if condition then
  // code
end

// Type: forin [Tab]
for item in items do
  // code
end

// Type: try [Tab]
try
  // code
catch error
  // error handling
end

// Type: parallel [Tab]
parallel(
  function() end,
  function() end
)
```

## Language Features Demo

See `example.du` in this repository for a comprehensive demo of:
- Variables and types
- Control flow (if, for, while)
- Functions
- Error handling (try/catch)
- Built-in functions
- Array operations
- String templates
- Parallel execution
- Module imports

Run it:
```bash
duso example.du
```

## Learning Duso

### In-Editor
- **Hover over functions** to see documentation (via LSP)
- **Auto-complete** as you type (provided by LSP)

### In Terminal
```bash
# Browse documentation
duso -read

# View specific documentation
duso -doc print
duso -doc parallel
duso -doc fetch

# Start interactive REPL
duso -repl
```

### Web Documentation
```bash
# Start doc server
duso -docserver
# Opens browser at http://localhost:8080
```

## Common Tasks

### Reading Files
```duso
content = load("data.txt")
print(content)
```

### Writing Files
```duso
save("output.txt", "Hello, File!")
```

### Working with JSON
```duso
json_text = load("config.json")
config = parse_json(json_text)
print(config.setting)
```

### Making HTTP Requests
```duso
response = fetch("https://api.example.com/data")
print("Status:", response.status)
print("Body:", response.body)
```

### Using Parallel Execution
```duso
results = parallel(
  function()
    return fetch("https://api.example.com/data1")
  end,
  function()
    return fetch("https://api.example.com/data2")
  end
)
print("Results:", results)
```

### Working with Claude AI
```duso
claude = require("claude")

// Simple prompt
response = claude.prompt("Explain Duso in one sentence")
print(response)

// Multi-turn conversation
chat = claude.conversation(system = "You are a helpful assistant")
response1 = chat.prompt("What is Duso?")
response2 = chat.prompt("How do I run it?")
```

## Troubleshooting

### Syntax Highlighting Not Working
- ✅ Is the file a `.du` file?
- ✅ Is the Duso extension enabled in Zed?
- ✅ Try reloading Zed

### LSP Not Responding
- ✅ Is Duso installed? Run: `duso -version`
- ✅ Test LSP directly: `duso -lsp` (should start, Ctrl+C to stop)
- ✅ Check Zed logs: View → Toggle Developer Console

### Script Won't Run
- ✅ Check syntax in Zed (red squiggles indicate errors)
- ✅ Test in REPL: `duso -repl`
- ✅ Run with debug info: `duso -debug your_script.du`

### "Command not found: duso"
- ✅ Is Duso installed? Run: `which duso`
- ✅ Try full path: `/usr/local/bin/duso your_script.du`
- ✅ Reinstall Duso from [releases](https://github.com/duso-org/duso/releases)

## Next Steps

1. **Read the examples**: `duso -read examples/`
2. **Check the reference**: `duso -doc`
3. **Build a project**: Create a multi-file script project
4. **Use Claude integration**: Automate tasks with AI
5. **Join the community**: Contribute or share your projects

## Resources

- **Duso Website**: https://duso.rocks
- **GitHub**: https://github.com/duso-org/duso
- **Documentation**: `duso -read` (built-in)
- **Examples**: `duso -read examples/`

Happy scripting! 🚀
