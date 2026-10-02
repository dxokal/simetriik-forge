#!/usr/bin/env bash
# Usage : check-glossary-terms.sh docs/01-domaine/glossaire.md src/
# FF-05 : échoue si un synonyme banni du glossaire apparaît dans le code, y compris comme mot
# d'un identifiant (DossierService, client_id, getClientName). Mot entier, sans tenir compte de la casse.
# Une ligne contenant « glossary-ignore » est ignorée (faux positif assumé, ex. HttpClient).
set -u
g="${1:?glossaire requis}"; dir="${2:?dossier code requis}"
# colonne 6 = « Synonymes à éviter », séparés par des virgules
banned=$(awk -F'|' '/^\|/ && ++r>2 {n=split($6, a, ","); for (i=1;i<=n;i++) {gsub(/^ +| +$/, "", a[i]); if (a[i] != "") print a[i]}}' "$g")
[ -z "$banned" ] && { echo "OK: aucun terme banni"; exit 0; }
bad=0
while IFS= read -r f; do
  grep -Iq . "$f" 2>/dev/null || continue   # fichiers vides ou binaires ignorés
  awk -v W="$banned" '
    BEGIN { n = split(W, o, "\n"); for (i = 1; i <= n; i++) { w[i] = tolower(o[i]); gsub(/[[:space:][:punct:]]+/, " ", w[i]) } }
    /glossary-ignore/ { next }
    { s = $0
      # coupe les identifiants en mots : camelCase, HTTPServer, snake_case, kebab-case
      while (match(s, /[a-z0-9][A-Z]/)) s = substr(s, 1, RSTART) " " substr(s, RSTART + 1)
      while (match(s, /[A-Z][A-Z][a-z]/)) s = substr(s, 1, RSTART) " " substr(s, RSTART + 1)
      s = tolower(s); gsub(/[[:space:][:punct:]]+/, " ", s); s = " " s " "
      for (i = 1; i <= n; i++) {
        if (index(s, " " w[i] " ")) { print FILENAME ":" FNR ":" $0; print "KO: terme banni « " o[i] " »" > "/dev/stderr"; bad = 1 }
      } }
    END { exit bad }' "$f" || bad=1
done < <(find "$dir" \( -name node_modules -o -name .git \) -prune -o -type f -print)
[ $bad -eq 0 ] && echo "OK: aucun terme banni"; exit $bad
