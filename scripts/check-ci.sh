#!/usr/bin/env bash
# Usage : check-ci.sh [base=origin/main] [dossier-code=src] — garde-fous de la démarche pour la CI (pull request).
# Reprend côté serveur ce que font les hooks locaux, qu'un --no-verify contourne : nom de branche,
# messages de commit, spec Validée si du code change, ADR (stack), contrat rattaché, glossaire.
# La branche vient de GITHUB_HEAD_REF (CI) ou de la branche courante.
base="${1:-origin/main}"; code="${2:-src}"; here="$(cd "$(dirname "$0")" && pwd)"; bad=0
branch="${GITHUB_HEAD_REF:-$(git branch --show-current)}"
ko() { echo "KO: $*" >&2; bad=1; }
"$here/check-branch.sh" "$branch" || bad=1
# Messages de commit de la branche (hors merges)
tmp=$(mktemp); while IFS= read -r subject; do
  printf '%s\n' "$subject" > "$tmp"; "$here/check-commit-msg.sh" "$tmp" || bad=1
done < <(git log --no-merges --format=%s "$base..HEAD"); rm -f "$tmp"
# Du code a-t-il changé ? (hors docs/, .github/, scripts/, tests/ et *.md)
changed=$(git diff --name-only "$base...HEAD")
if grep -qvE '^(docs/|\.github/|scripts/|tests/)|\.md$' <<<"$changed"; then
  if [[ "$branch" =~ ^feat/(SPEC-[0-9]+)- ]]; then
    "$here/check-spec-validated.sh" "docs/02-specs/${BASH_REMATCH[1]}.md" || bad=1
  elif [[ "$branch" != fix/?* ]]; then
    ko "branche '$branch' : du code exige feat/SPEC-NNN-slug ou fix/slug"
  fi
  [ -d docs/03-architecture/adr ] && { "$here/check-adr-present.sh" docs/03-architecture/adr 2 || bad=1; }
fi
[ -f api/openapi.yaml ] && { "$here/check-openapi-first.sh" api/openapi.yaml docs/02-specs || bad=1; }
[ -f docs/01-domaine/glossaire.md ] && [ -d "$code" ] && { "$here/check-glossary-terms.sh" docs/01-domaine/glossaire.md "$code" || bad=1; }
[ $bad -eq 0 ] && echo "OK: garde-fous CI passés"; exit $bad
