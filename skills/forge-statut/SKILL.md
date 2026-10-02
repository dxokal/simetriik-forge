---
name: forge-statut
description: Tableau de bord de la démarche : état de chaque étape et de chaque spec, garde-fous en échec, prochaine action recommandée. Utilise pour "où en est-on", "statut du projet", "que faire ensuite" ou /forge-statut.
---

# forge-statut

Lecture seule.

1. Lancer `scripts/forge-status.sh` (racine du projet) ; lancer aussi les garde-fous applicables : `check-spec-validated.sh` par spec, `check-openapi-first.sh api/openapi.yaml docs/02-specs`, `check-adr-present.sh docs/03-architecture/adr 2` (ADR-0001 + ADR de stack).
2. Présenter un tableau court étape → état (Brouillon / En revue / Validée), puis **une seule** prochaine action avec le skill à invoquer :
   cadrage → `forge-cadrage` · domaine → `forge-domaine` · spec manquante/brouillon → `forge-spec` · contrat non rattaché → `forge-contrat` · spec validée sans code → `forge-implemente` · lot prêt → `forge-recette` · PV signé → `forge-prod`.
3. Ne rien modifier, ne pas valider à la place de l'humain.
