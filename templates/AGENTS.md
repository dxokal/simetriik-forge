# Consignes pour les agents IA

Ce fichier est lu par les agents de code (Claude Code, Cursor, Kiro…). Copiez-le
aussi en `CLAUDE.md` si besoin.

## Avant d'écrire du code
1. Lire `docs/01-domaine/glossaire.md` — utiliser **exactement** ces termes (traduits
   en anglais selon la colonne « Nom technique »).
2. Lire la spec concernée dans `docs/02-specs/`. Si elle n'est pas `Validée`, s'arrêter
   et le signaler.
3. Lire les ADR au statut `Acceptée` dans `docs/03-architecture/adr/`.
4. Respecter les frontières des bounded contexts (`docs/01-domaine/context-map.md`) :
   aucun import direct entre modules de contextes différents.

## En écrivant du code
- Code, noms et messages de commit en **anglais** ; commentaires en **français**.
- Chaque critère d'acceptation de la spec devient au moins un test.
- Les contrats d'API suivent `api/openapi.yaml` : on modifie le contrat **d'abord**.
- Montants en FCFA (XOF) : entiers, pas de décimales, pas de `float`.
- Dates : stockage UTC, affichage `Africa/Porto-Novo` (ou fuseau du client).

## Ce qu'il ne faut pas faire
- Inventer une règle métier absente de la spec → poser la question.
- Ajouter une dépendance majeure sans ADR.
- Contourner une fitness function en CI.
