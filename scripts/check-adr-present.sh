#!/usr/bin/env bash
# Usage : check-adr-present.sh docs/03-architecture/adr
# Échoue s'il n'existe aucun ADR au statut « Acceptée » (hors gabarit 0000).
set -u
d="${1:?dossier adr requis}"
n=$(grep -l '^Statut : Acceptée' "$d"/[0-9]*.md 2>/dev/null | grep -vc '/0000-')
[ "$n" -gt 0 ] && echo "OK: $n ADR acceptée(s)" || { echo "KO: aucun ADR Acceptée dans $d" >&2; exit 1; }
