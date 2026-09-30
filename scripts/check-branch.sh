#!/usr/bin/env bash
# Usage : check-branch.sh [nom-de-branche] — refuse main/master et exige feat/… ou fix/… (défaut : branche courante).
b="${1:-$(git branch --show-current)}"
case "$b" in
  feat/?*|fix/?*) echo "OK: branche $b"; exit 0 ;;
  *) echo "KO: branche '$b' — créer une branche feat/… ou fix/… avant de coder" >&2; exit 1 ;;
esac
