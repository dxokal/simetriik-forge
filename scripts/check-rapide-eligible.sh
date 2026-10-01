#!/usr/bin/env bash
# Usage : check-rapide-eligible.sh docs/02-specs/SPEC-NNN.md [branche-de-base=main]
# Vérifie qu'un travail reste éligible au cycle court : spec de taille S, ≤ 8 fichiers,
# aucun manifeste de dépendances, aucune migration. Sinon : passer par le cycle complet.
spec="${1:?fichier spec requis}"; base="${2:-main}"; bad=0
ko() { echo "KO: $*" >&2; bad=1; }
grep -qE '^\| *Taille *\| *S *\|' "$spec" || ko "$spec n'est pas de taille S"
files=$( { git diff --name-only "$(git merge-base HEAD "$base")"; git ls-files -o --exclude-standard; } | sort -u )
n=$(grep -c . <<<"$files"); [ "$n" -le 8 ] || ko "$n fichiers modifiés (max 8)"
deps=$(grep -E '(^|/)(package\.json|package-lock\.json|pnpm-lock\.yaml|yarn\.lock|requirements[^/]*\.txt|pyproject\.toml|poetry\.lock|pom\.xml|build\.gradle|go\.mod|Cargo\.toml)$' <<<"$files")
[ -z "$deps" ] || ko "dépendances modifiées : $(tr '\n' ' ' <<<"$deps")"
mig=$(grep -E '(migrations/|\.sql$)' <<<"$files")
[ -z "$mig" ] || ko "migration : $(tr '\n' ' ' <<<"$mig")"
[ $bad -eq 0 ] && echo "OK: éligible au cycle court"; exit $bad
