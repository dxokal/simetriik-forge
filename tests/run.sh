#!/usr/bin/env bash
# Tests des garde-fous : bash tests/run.sh
cd "$(dirname "$0")/.." || exit 1
T=templates/docs; F=tests/fixtures; fail=0
ok()  { "$@" >/dev/null 2>&1 || { echo "FAIL (attendu OK): $*"; fail=1; }; }
ko()  { "$@" >/dev/null 2>&1 && { echo "FAIL (attendu KO): $*"; fail=1; }; }
printf '| Champ | Valeur |\n|---|---|\n| Statut | **Validée** |\n' > $F/spec-ok.md
printf '| Champ | Valeur |\n|---|---|\n| Statut | Brouillon |\n' > $F/spec-draft.md
ok scripts/check-spec-validated.sh $F/spec-ok.md
ko scripts/check-spec-validated.sh $F/spec-draft.md
ko scripts/check-spec-validated.sh $T/02-specs/_TEMPLATE-spec.md
mkdir -p $F/code-ok $F/code-bad
echo 'class Application {}' > $F/code-ok/a.ts
echo 'class Dossier {}'     > $F/code-bad/a.ts
ok scripts/check-glossary-terms.sh $T/01-domaine/glossaire.md $F/code-ok
ko scripts/check-glossary-terms.sh $T/01-domaine/glossaire.md $F/code-bad
[ $fail -eq 0 ] && echo "tous les tests passent"; exit $fail
