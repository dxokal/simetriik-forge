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
ok scripts/check-branch.sh feat/x
ok scripts/check-branch.sh fix/y
ko scripts/check-branch.sh main
ko scripts/check-branch.sh feat/
echo 'feat(api): add login' > $F/msg-ok.txt; echo 'added stuff' > $F/msg-bad.txt
ok scripts/check-commit-msg.sh $F/msg-ok.txt
ko scripts/check-commit-msg.sh $F/msg-bad.txt
P=$F/proj; rm -rf $P; mkdir -p $P/docs/00-cadrage
[ "$(scripts/forge-progress.sh $P)" = "Progression [░░░░░░░] 0/7 · étape en cours : Cadrage · suite : forge-cadrage" ] || { echo "FAIL progress 0/7"; fail=1; }
printf 'Statut : Validée\n' > $P/docs/00-cadrage/vision.md; cp $P/docs/00-cadrage/vision.md $P/docs/00-cadrage/impact-map.md
scripts/forge-progress.sh $P | grep -q '1/7 · étape en cours : Domaine' || { echo "FAIL progress 1/7"; fail=1; }
G=$(mktemp -d); R=$PWD; ( cd $G && git init -q && mkdir -p docs/02-specs scripts src && cp $R/scripts/check-*.sh scripts/ && git config user.email t@t && git config user.name t
  cp $R/$F/spec-draft.md docs/02-specs/SPEC-001.md; echo x > src/a.ts
  git switch -q -c feat/SPEC-001-x; git add src/a.ts
  scripts/check-commit-allowed.sh 2>/dev/null && { echo "FAIL hook: spec brouillon + code"; exit 1; }
  git reset -q; git add docs/02-specs/SPEC-001.md; scripts/check-commit-allowed.sh >/dev/null 2>&1 || { echo "FAIL hook: docs-only"; exit 1; }
  cp $R/$F/spec-ok.md docs/02-specs/SPEC-001.md; git reset -q; git add src/a.ts; scripts/check-commit-allowed.sh >/dev/null 2>&1 || { echo "FAIL hook: spec validee"; exit 1; }
  git switch -q -c feat/sans-spec; scripts/check-commit-allowed.sh 2>/dev/null && { echo "FAIL hook: feat sans SPEC"; exit 1; }
  git switch -q -c fix/y; scripts/check-commit-allowed.sh >/dev/null 2>&1 || { echo "FAIL hook: fix/"; exit 1; }
  $R/scripts/install-hooks.sh >/dev/null 2>&1 && [ -x .git/hooks/pre-commit ] && ! $R/scripts/install-hooks.sh >/dev/null 2>&1 ) || fail=1; rm -rf $G
G=$(mktemp -d); R=$PWD; ( cd $G && git init -q -b main && git config user.email t@t && git config user.name t && mkdir -p docs/02-specs src
  printf '| Champ | Valeur |\n|---|---|\n| Taille | S |\n' > docs/02-specs/SPEC-001.md; echo a > src/a.ts; git add . && git commit -qm "chore: init" && git switch -q -c feat/SPEC-001-x
  $R/scripts/check-rapide-eligible.sh docs/02-specs/SPEC-001.md >/dev/null 2>&1 || { echo "FAIL rapide: petit travail"; exit 1; }
  echo '{}' > package.json; $R/scripts/check-rapide-eligible.sh docs/02-specs/SPEC-001.md >/dev/null 2>&1 && { echo "FAIL rapide: dependances"; exit 1; }
  rm package.json; mkdir db && echo x > db/001.sql; $R/scripts/check-rapide-eligible.sh docs/02-specs/SPEC-001.md >/dev/null 2>&1 && { echo "FAIL rapide: migration"; exit 1; }
  rm -r db; sed -i 's/| S |/| M |/' docs/02-specs/SPEC-001.md; $R/scripts/check-rapide-eligible.sh docs/02-specs/SPEC-001.md >/dev/null 2>&1 && { echo "FAIL rapide: taille M"; exit 1; }
  sed -i 's/| M |/| S |/' docs/02-specs/SPEC-001.md; for i in 1 2 3 4 5 6 7 8 9; do echo $i > src/f$i.ts; done; $R/scripts/check-rapide-eligible.sh docs/02-specs/SPEC-001.md >/dev/null 2>&1 && { echo "FAIL rapide: trop de fichiers"; exit 1; }
  exit 0 ) || fail=1; rm -rf $G
L=$F/lecons; rm -rf $L; mkdir -p $L/apprentissage/code $L/apprentissage/adr
[ "$(scripts/forge-lecons.sh $L)" = "Leçons [░░░░] 0/4 · prochaine : 01-impact-map" ] || { echo "FAIL lecons 0/4"; fail=1; }
printf 'indicateur cible échéance\n' > $L/apprentissage/impact-map.md; cp $F/spec-ok.md $L/apprentissage/SPEC-001.md
printf '| a | b |\n|---|---|\n| Acheteur | d | c | Buyer | client | e |\n' > $L/apprentissage/glossaire.md; echo 'class Client {}' > $L/apprentissage/code/o.ts
scripts/forge-lecons.sh $L | grep -q '2/4 · prochaine : 02-langage' || { echo "FAIL lecons 2/4"; fail=1; }
rm -rf $L
[ $fail -eq 0 ] && echo "tous les tests passent"; exit $fail
