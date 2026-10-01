#!/usr/bin/env bash
# Usage : forge-lecons.sh [racine-projet] — progression des leçons de forge-apprendre (exercices dans apprentissage/).
here="$(cd "$(dirname "$0")" && pwd)"; a=apprentissage
cd "${1:-.}" || exit 2
names=(01-impact-map 02-langage 03-spec 04-adr); ok=(0 0 0 0)
grep -qi indicateur $a/impact-map.md 2>/dev/null && grep -qi cible $a/impact-map.md && grep -qi échéance $a/impact-map.md && ok[0]=1
[ -f $a/glossaire.md ] && [ -d $a/code ] && "$here/check-glossary-terms.sh" $a/glossaire.md $a/code >/dev/null 2>&1 && ok[1]=1
"$here/check-spec-validated.sh" $a/SPEC-001.md >/dev/null 2>&1 && ok[2]=1
"$here/check-adr-present.sh" $a/adr >/dev/null 2>&1 && ok[3]=1
n=0; bar=""; next=""
for i in 0 1 2 3; do if [ "${ok[$i]}" = 1 ]; then n=$((n+1)); bar+="█"; else bar+="░"; [ -z "$next" ] && next=${names[$i]}; fi; done
[ -z "$next" ] && echo "Leçons [$bar] 4/4 · parcours terminé : refais chaque exercice sur ton projet" || echo "Leçons [$bar] $n/4 · prochaine : $next"
