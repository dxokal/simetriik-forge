#!/usr/bin/env bash
# Usage : forge-status.sh [racine-projet]  — état de la démarche, lecture seule.
cd "${1:-.}" || exit 2
statut() { awk -F'|' '$2 ~ /^ *Statut *$/ {gsub(/\*|^ +| +$/, "", $3); print $3; exit}' "$1"; }
echo "== Cadrage";  for f in docs/00-cadrage/*.md; do echo "  $(basename "$f"): $(grep -m1 '^Statut' "$f")"; done
echo "== Specs"
for f in docs/02-specs/SPEC-*.md; do [ -f "$f" ] && echo "  $(basename "$f" .md): $(statut "$f") $([ -f docs/02-specs/features/$(basename "$f" .md).feature ] || echo '(feature manquante)')"; done
echo "== ADR acceptées: $(grep -l '^Statut : Acceptée' docs/03-architecture/adr/[0-9]*.md 2>/dev/null | grep -vc '/0000-')"
echo "== Recette:    $(grep -m1 '^Statut' docs/05-recette/plan-recette.md 2>/dev/null)"
echo "== Production: $(grep -m1 '^Statut' docs/06-production/plan-deploiement.md 2>/dev/null)"
