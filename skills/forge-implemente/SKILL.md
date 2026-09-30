---
name: forge-implemente
description: Implémente une spec validée en respectant glossaire, ADR, contrat OpenAPI et frontières de bounded contexts, avec un test par critère d'acceptation. Utilise quand l'utilisateur veut coder une SPEC-NNN ou lance /forge-implemente.
---

# forge-implemente

## Garde-fous (bloquants, avant d'écrire du code)
1. `scripts/check-spec-validated.sh docs/02-specs/SPEC-NNN.md` → si KO : **s'arrêter** et le dire.
2. Lire glossaire, ADR au statut `Acceptée`, `docs/01-domaine/context-map.md`.
3. Le contrat `api/openapi.yaml` couvre la spec (`operationId` cité) ; sinon passer par `forge-contrat` d'abord.
4. Planifier brièvement et attendre l'accord avant une tâche non triviale.

## Implémentation
- Un scénario Gherkin = au moins un test (écrire le test d'abord).
- Code en anglais, commentaires en français, noms techniques du glossaire.
- FCFA : entiers (`amountXof`), jamais de `float`. Dates : UTC en stockage, `Africa/Porto-Novo` à l'affichage.
- Aucun import direct entre modules de contextes différents (FF-01). Pas de nouvelle dépendance majeure sans ADR.
- Règle absente de la spec → poser la question, ne pas deviner.

## Avant de conclure
- Lancer linter + tests du projet, puis `scripts/check-glossary-terms.sh docs/01-domaine/glossaire.md <dossier-code>` (FF-05).
- Ne jamais affaiblir un test pour le faire passer. Pas de commit/push sans demande (voir `/branche`, `/livre`).

Terminer en lançant `scripts/forge-progress.sh` et en affichant sa sortie (barre de progression sur les 7 étapes).
