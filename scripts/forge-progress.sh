#!/usr/bin/env bash
# Usage : forge-progress.sh [racine-projet] — barre de progression sur les 7 étapes (0 à 6), lecture seule.
# Une étape est faite quand son livrable est au statut « Validée » (ADR : « Acceptée »).
here="$(cd "$(dirname "$0")" && pwd)"
cd "${1:-.}" || exit 2
valide() { head -12 "$1" 2>/dev/null | grep -qE '^Statut[^|]*(Validée|Acceptée)|^\| *Statut *\|.*\*\*Validée\*\*' ; }
tous() { local n=0 f; for f in "$@"; do [ -f "$f" ] || return 1; valide "$f" || return 1; n=$((n+1)); done; [ $n -gt 0 ]; }
adr=$(grep -l '^Statut : Acceptée' docs/03-architecture/adr/[0-9]*.md 2>/dev/null | grep -vc '/0000-')
names=(Cadrage Domaine Specs Architecture Contrat Recette Production)
skills=(forge-cadrage forge-domaine forge-spec forge-architecture forge-contrat forge-recette forge-prod)
ok=(0 0 0 0 0 0 0)
tous docs/00-cadrage/vision.md docs/00-cadrage/impact-map.md && ok[0]=1
tous docs/01-domaine/context-map.md && ok[1]=1
tous docs/02-specs/SPEC-*.md && ok[2]=1
[ "$adr" -ge 2 ] && ok[3]=1   # ADR-0001 (monolithe) + au moins l'ADR de stack
grep -q 'operationId:' api/openapi.yaml 2>/dev/null && "$here/check-openapi-first.sh" api/openapi.yaml docs/02-specs >/dev/null 2>&1 && ok[4]=1
tous docs/05-recette/plan-recette.md && ok[5]=1
tous docs/06-production/plan-deploiement.md && ok[6]=1
done_n=0; bar=""; next=""
for i in 0 1 2 3 4 5 6; do
  if [ "${ok[$i]}" = 1 ]; then done_n=$((done_n+1)); bar+="█"; else bar+="░"; [ -z "$next" ] && next=$i; fi
done
if [ -z "$next" ]; then echo "Progression [$bar] 7/7 · démarche complète"
else echo "Progression [$bar] $done_n/7 · étape en cours : ${names[$next]} · suite : ${skills[$next]}"; fi
