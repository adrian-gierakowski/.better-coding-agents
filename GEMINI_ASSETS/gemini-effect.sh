#!/bin/bash

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
