#!/usr/bin/env bash
# Usage : check-commit-allowed.sh — hook pre-commit : pas de code sur feat/SPEC-NNN-slug sans spec Validée.
# Commit docs-only (docs/, *.md, .github/, scripts/, tests/) : toujours autorisé. Branches fix/… : non concernées.
b="$(git branch --show-current)"
case "$b" in fix/?*) exit 0 ;; esac
# Commit docs-only ? (aucun fichier indexé hors périmètre documentaire)
if ! git diff --cached --name-only | grep -qvE '^(docs/|\.github/|scripts/|tests/)|\.md$'; then exit 0; fi
if [[ "$b" =~ ^feat/(SPEC-[0-9]+)- ]]; then
  "$(dirname "$0")/check-spec-validated.sh" "docs/02-specs/${BASH_REMATCH[1]}.md"
else
  echo "KO: branche '$b' — du code exige une branche feat/SPEC-NNN-slug (ex. feat/SPEC-003-login)" >&2; exit 1
fi
