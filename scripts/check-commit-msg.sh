#!/usr/bin/env bash
# Usage : check-commit-msg.sh <fichier-message> — 1re ligne au format Conventional Commits.
src="${1:?fichier message requis}"; msg="$(head -n1 "$src" 2>/dev/null)"
re='^(feat|fix|refactor|docs|test|chore)(\([a-z0-9-]+\))?!?: .+'
if [[ "$msg" =~ $re ]] && [ ${#msg} -le 72 ]; then echo "OK: message conforme"; else
  echo "KO: '$msg' — attendu « type(portée): sujet » (feat|fix|refactor|docs|test|chore), 72 car. max" >&2; exit 1; fi
