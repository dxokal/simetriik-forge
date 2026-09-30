---
name: forge-contrat
description: Modifie le contrat d'API api/openapi.yaml AVANT toute implémentation, à partir d'une spec Validée. Utilise pour "contrat d'API", "openapi", "endpoint" d'une spec ou /forge-contrat.
---

# forge-contrat

Le contrat précède le code (règle de `AGENTS.md`).

1. `scripts/check-spec-validated.sh docs/02-specs/SPEC-NNN.md` ; si KO, s'arrêter.
2. Lire la section « Interfaces » de la spec et `api/openapi.yaml`.
3. Ajouter chemins/schémas : `operationId` en camelCase anglais (termes du glossaire), `tags: [<bounded context>]`, **`summary` citant `(SPEC-NNN)`**, erreurs en `application/problem+json`.
4. Montants : `integer` + suffixe `Xof`, `minimum: 0`. Dates : `date-time` (UTC). Identifiants métier avec `pattern`.
5. Vérifier : `scripts/check-openapi-first.sh api/openapi.yaml docs/02-specs`.
6. Le contrat est la base du test FF-04 (Schemathesis) ; rappeler de le brancher en CI.

Suite : `forge-implemente`.
