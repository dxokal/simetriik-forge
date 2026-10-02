#!/usr/bin/env bash
# Usage : check-adr-present.sh docs/03-architecture/adr [minimum=1]
# Échoue s'il y a moins de <minimum> ADR au statut « Acceptée » (hors gabarit 0000).
# Minimum 2 = l'ADR-0001 fourni + l'ADR de stack (étape 3 terminée).
set -u
d="${1:?dossier adr requis}"; min="${2:-1}"
n=$(grep -l '^Statut : Acceptée' "$d"/[0-9]*.md 2>/dev/null | grep -vc '/0000-')
[ "$n" -ge "$min" ] && echo "OK: $n ADR acceptée(s)" || { echo "KO: $n ADR Acceptée dans $d (minimum : $min)" >&2; exit 1; }
