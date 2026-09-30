#!/usr/bin/env bash
# Usage : check-spec-validated.sh docs/02-specs/SPEC-001.md
# Échoue (code 1) si le statut de la spec n'est pas exactement « Validée ».
set -u
f="${1:?fichier spec requis}"
[ -f "$f" ] || { echo "KO: $f introuvable" >&2; exit 2; }
statut=$(awk -F'|' '$2 ~ /^ *Statut *$/ {gsub(/\*|^ +| +$/, "", $3); print $3; exit}' "$f")
if [ "$statut" = "Validée" ]; then echo "OK: $f est Validée"; else
  echo "KO: $f a le statut « ${statut:-absent} » (attendu : Validée)" >&2; exit 1; fi
