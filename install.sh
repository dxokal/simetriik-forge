#!/usr/bin/env bash
# Installe les skills pour Codex et OpenCode (ils lisent tous deux ~/.agents/skills).
# Claude Code : claude --plugin-dir "$(pwd)"
set -eu
root="$(cd "$(dirname "$0")" && pwd)"; dest="$HOME/.agents/skills"
mkdir -p "$dest"
for s in "$root"/skills/forge-*; do ln -sfn "$s" "$dest/$(basename "$s")"; echo "lié: $(basename "$s")"; done
