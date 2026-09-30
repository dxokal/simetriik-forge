---
name: forge-cadrage
description: Cadre le besoin (étape 0) en remplissant docs/00-cadrage/vision.md et impact-map.md par questionnement : vision, objectifs mesurables O1.., acteurs, impacts, priorisation MoSCoW. Utilise au démarrage d'un projet, pour "cadrer le besoin" ou /forge-cadrage.
---

# forge-cadrage

Objectif : que chaque future fonctionnalité remonte à un objectif mesurable.

1. Lire `docs/00-cadrage/vision.md` et `impact-map.md` (gabarits).
2. Interroger, une question à la fois, dans l'ordre : pour qui / quel problème → situation actuelle, cadre réglementaire (APDP, OHADA, marchés publics), contraintes terrain (connectivité, terminaux, langues) → objectifs mesurables (indicateur, valeur actuelle, cible, échéance) → acteurs → changements de comportement → fonctionnalités.
3. Renseigner `vision.md`, puis l'Impact Map (Mermaid + tableau MoSCoW, colonne Objectif obligatoire).
4. Fonctionnalité sans objectif `O#` → la signaler hors périmètre. Chiffres inconnus → `À mesurer`, jamais inventés.
5. Statut `En revue` ; la validation revient au sponsor client.

Suite : `forge-domaine`.

Terminer en lançant `scripts/forge-progress.sh` et en affichant sa sortie (barre de progression sur les 7 étapes).
