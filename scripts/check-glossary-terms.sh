#!/usr/bin/env bash
# Usage : check-glossary-terms.sh docs/01-domaine/glossaire.md src/
# FF-05 : échoue si un synonyme banni du glossaire apparaît dans le code.
set -u
g="${1:?glossaire requis}"; dir="${2:?dossier code requis}"
bad=0
# colonne 6 = « Synonymes à éviter », séparés par des virgules
while IFS= read -r w; do
  [ -z "$w" ] && continue
  if grep -rniw --exclude-dir=node_modules --exclude-dir=.git -- "$w" "$dir"; then
    echo "KO: terme banni « $w »" >&2; bad=1; fi
done < <(awk -F'|' '/^\|/ && ++r>2 {n=split($6, a, ","); for (i=1;i<=n;i++) {gsub(/^ +| +$/, "", a[i]); print a[i]}}' "$g")
[ $bad -eq 0 ] && echo "OK: aucun terme banni"; exit $bad
