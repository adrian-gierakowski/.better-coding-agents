#!/bin/bash

# Check if gemini is installed
if ! command -v gemini &> /dev/null; then
    echo "Error: gemini cli is not installed or not in PATH."
    echo "Please install it: npm install -g @google/gemini-cli"
    exit 1
fi

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# Get the repository root (one level up from GEMINI_ASSETS)
REPO_ROOT="$(dirname "$SCRIPT_DIR")"

# Set the system prompt to the Effect Agent definition located in the same directory
export GEMINI_SYSTEM_MD="$SCRIPT_DIR/effect-agent.md"

# Run gemini with the effect resources included
# We use the absolute path resolved from the script location
# "$@" passes any arguments from the user (like -p "question" or a file)
gemini --include-directories "$REPO_ROOT/resources/effect" "$@"
