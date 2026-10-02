#!/usr/bin/env bash
# Usage : check-spec-validated.sh docs/02-specs/SPEC-001.md
# Échoue (code 1) si le statut n'est pas exactement « Validée », ou si une ligne « Validé par… »
# manque, garde un placeholder ou n'indique pas un nom et une date (JJ/MM/AAAA ou AAAA-MM-JJ).
set -u
f="${1:?fichier spec requis}"
[ -f "$f" ] || { echo "KO: $f introuvable" >&2; exit 2; }
statut=$(awk -F'|' '$2 ~ /^ *Statut *$/ {gsub(/\*|^ +| +$/, "", $3); print $3; exit}' "$f")
if [ "$statut" != "Validée" ]; then
  echo "KO: $f a le statut « ${statut:-absent} » (attendu : Validée)" >&2; exit 1; fi
# Chaque ligne « Validé par… » : valeur sans « [ », avec une date et un nom (≥ 2 lettres hors date).
bad=$(awk -F'|' '
  $2 ~ /^ *Validé par/ { n++; v=$3; d=v
    gsub(/[0-9]{2}\/[0-9]{2}\/[0-9]{4}|[0-9]{4}-[0-9]{2}-[0-9]{2}/, "", d)
    hasdate = (v != d); nom=d; gsub(/[^[:alpha:]]/, "", nom)
    if (v ~ /\[/ || !hasdate || length(nom) < 2) { gsub(/^ +| +$/, "", $2); print $2 } }
  END { if (!n) print "(ligne « Validé par » absente)" }' "$f")
if [ -n "$bad" ]; then
  echo "KO: $f est « Validée » sans validation humaine nommée et datée :" >&2
  echo "$bad" | sed 's/^/  - /' >&2; exit 1; fi
echo "OK: $f est Validée"
