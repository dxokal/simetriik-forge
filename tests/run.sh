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
mkdir -p $F/specs && cp $F/spec-ok.md $F/specs/SPEC-001.md
printf 'paths:\n  /a:\n    post:\n      operationId: op1\n      summary: Soumettre (SPEC-001)\n' > $F/api-ok.yaml
printf 'paths:\n  /a:\n    post:\n      operationId: op1\n      summary: Sans spec\n' > $F/api-nospec.yaml
printf 'paths:\n  /a:\n    post:\n      operationId: op1\n      summary: Fantome (SPEC-009)\n' > $F/api-ghost.yaml
ok scripts/check-openapi-first.sh $F/api-ok.yaml $F/specs
ko scripts/check-openapi-first.sh $F/api-nospec.yaml $F/specs
ko scripts/check-openapi-first.sh $F/api-ghost.yaml $F/specs
ok scripts/check-adr-present.sh $T/03-architecture/adr
mkdir -p $F/adr-empty && cp $T/03-architecture/adr/0000-template.md $F/adr-empty/
ko scripts/check-adr-present.sh $F/adr-empty
[ $fail -eq 0 ] && echo "tous les tests passent"; exit $fail
