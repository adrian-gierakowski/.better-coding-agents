# Gemini CLI Support

This directory contains assets to use the Gemini CLI as a "Coding Agent" specialized for specific libraries.

## Effect Expert

The `gemini-effect.sh` script launches the Gemini CLI with a specific system prompt and context configured for the Effect.ts library.

### Prerequisites

1.  **Gemini CLI**: You must have the official Gemini CLI installed.
    ```bash
    npm install -g @google/gemini-cli
    ```
2.  **Authentication**: You must be authenticated.
    ```bash
    gemini login
    # OR set GEMINI_API_KEY / GOOGLE_API_KEY
    ```
3.  **Repository Setup**: Clone this repository. The repository includes the Effect source code in `resources/effect` (ensure you clone with submodules or the full tree if it's a monorepo, though standard clone should work).
    ```bash
    git clone https://github.com/your-username/your-repo.git ~/.better-coding-agents
    ```
    *Note: The script works regardless of where you clone it, but `~/.better-coding-agents` is the recommended location.*

### Usage

You can run the script directly from the repository:

```bash
./GEMINI_ASSETS/gemini-effect.sh
```

Or create an alias in your shell configuration (`.bashrc` / `.zshrc`):

```bash
alias effect-expert='path/to/repo/GEMINI_ASSETS/gemini-effect.sh'
```

Then use it like the normal `gemini` command:

```bash
effect-expert
# OR
effect-expert -p "How does Effect.retry work?"
```

### How it works

The script sets the `GEMINI_SYSTEM_MD` environment variable to point to `GEMINI_ASSETS/effect-agent.md`, which defines the agent's persona and instructions. It also uses the `--include-directories` flag to give the agent access to the local Effect source code stored in `resources/effect`.
