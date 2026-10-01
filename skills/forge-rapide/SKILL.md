---
name: forge-rapide
description: Cycle court pour une petite fonctionnalité (mini-spec d'une règle, test d'abord, code, vérifications) sans passer par toutes les étapes. Utilise pour "petite fonctionnalité", "ajout simple", "petit changement" ou /forge-rapide. Bascule vers le cycle complet si le travail n'est pas petit.
---

# forge-rapide

Même rigueur, moins de cérémonie : la mini-spec reste obligatoire et validée par l'humain (le hook pre-commit s'appuie dessus).

## 1. Éligibilité (poser la question avant d'écrire quoi que ce soit)
Le cycle court est **refusé** si une réponse est oui : nouveau bounded context ? nouvelle dépendance ? migration de données ? rupture du contrat OpenAPI ? plus d'une règle métier ? décision structurante (ADR) ? → expliquer pourquoi et passer par `forge-spec` (cycle complet).

## 2. Mini-spec
1. Lire `docs/01-domaine/glossaire.md` et `docs/00-cadrage/impact-map.md` (objectif `O#`).
2. Prochain `SPEC-NNN` libre : copier `docs/02-specs/_TEMPLATE-spec-rapide.md`, statut `Brouillon`, taille `S`.
3. Une règle (avec sa source, jamais inventée : sinon demander), un scénario Gherkin, l'`operationId` si l'API change. Termes du glossaire uniquement.
4. Passer en `En revue` ; seul l'humain passe à `Validée` (nom + date). Vérifier : `scripts/check-spec-validated.sh docs/02-specs/SPEC-NNN.md`.

## 3. Réalisation
1. Branche `feat/SPEC-NNN-slug` (`scripts/check-branch.sh`).
2. Si l'API change : ajouter l'opération à `api/openapi.yaml` (`summary` citant `(SPEC-NNN)`), puis `scripts/check-openapi-first.sh api/openapi.yaml docs/02-specs`.
3. Test d'abord pour le scénario, puis le code (règles de `forge-implemente` : anglais, FCFA entiers, pas d'import entre contextes).
4. Avant de conclure : linter + tests, `scripts/check-glossary-terms.sh docs/01-domaine/glossaire.md <dossier-code>` et **`scripts/check-rapide-eligible.sh docs/02-specs/SPEC-NNN.md`**. S'il est KO, le travail a dépassé le cadre : s'arrêter et basculer vers le cycle complet (`forge-spec`).
5. Pas de commit/push sans demande ; message Conventional Commits citant `SPEC-NNN`.

Terminer en lançant `scripts/forge-progress.sh` et en affichant sa sortie (barre de progression sur les 7 étapes).
