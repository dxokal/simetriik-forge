---
name: forge-architecture
description: Décide et documente l'architecture (étape 3) : modèle C4 en Structurizr DSL, ADR pour chaque décision structurante, fitness functions en CI. Utilise pour "ADR", "choix technique", "diagramme C4", "fitness function" ou /forge-architecture.
---

# forge-architecture

1. Lire `docs/03-architecture/` (ADR acceptés, `fitness-functions.md`, `c4/workspace.dsl`) et la context map.
2. Toute décision structurante (**stack technique** — langage et framework back/front/mobile —, BD, hébergement, dépendance majeure, découpage) = un ADR : copier `adr/0000-template.md` en `adr/NNNN-slug.md`, options chiffrées (coût en FCFA, compétences locales, exploitation par la DSI cliente), décision, conséquences. Statut `Proposée` ; `Acceptée` par l'humain.
3. Ne pas contredire l'ADR-0001 (monolithe modulaire) ; en sortir exige un nouvel ADR qui le remplace.
4. Mettre à jour le C4 (`workspace.dsl`) en code — remplacer les technologies `[STACK : …]` par celles de l'ADR de stack —, jamais en image seule.
5. Chaque ADR à risque de dérive reçoit une fitness function (id `FF-NN`) avec outil et caractère bloquant ; brancher FF-01 (imports) et FF-03 (vulnérabilités) en CI dès le premier lot.
6. Garde-fou : `scripts/check-adr-present.sh docs/03-architecture/adr`.

Suite : `forge-contrat`, `forge-implemente`. Modifier la CI ou Docker : demander confirmation.
