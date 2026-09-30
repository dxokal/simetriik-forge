#!/usr/bin/env bash
# Usage : check-openapi-first.sh api/openapi.yaml docs/02-specs
# Chaque operationId doit citer une SPEC-NNN (dans summary) dont la spec existe et est Validée.
set -u
api="${1:?openapi requis}"; specs="${2:?dossier specs requis}"
here="$(dirname "$0")"; bad=0
while read -r op ref; do
  if [ -z "$ref" ]; then echo "KO: $op ne cite aucune SPEC-NNN dans summary" >&2; bad=1; continue; fi
  "$here/check-spec-validated.sh" "$specs/$ref.md" >/dev/null 2>&1 || { echo "KO: $op → $ref absente ou non Validée" >&2; bad=1; }
done < <(awk '/operationId:/ {if (op) print op, ref; op=$2; ref=""} /summary:/ && match($0, /SPEC-[0-9]+/) {ref=substr($0,RSTART,RLENGTH)} END {if (op) print op, ref}' "$api")
[ $bad -eq 0 ] && echo "OK: contrat rattaché à des specs Validées"; exit $bad
