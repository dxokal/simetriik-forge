---
name: forge-init
description: Instancie le dossier de conception Lumière (docs/, api/, AGENTS.md, .github/) dans le projet courant et remplit les [PLACEHOLDERS]. Utilise quand l'utilisateur démarre un nouveau projet, veut "initialiser le dossier de conception" ou lance /forge-init.
---

# forge-init

Point de départ de la démarche : copier le gabarit, le personnaliser.

1. Vérifier que le dossier courant ne contient pas déjà `docs/` ou `AGENTS.md`. Si oui, **s'arrêter** et le signaler (ne jamais écraser).
2. Poser, une question à la fois : nom du projet, institution cliente, chef de projet, date de démarrage, stack (Python/FastAPI, TS/Next.js, Java).
3. Copier `templates/` (à la racine du plugin) dans le projet : `cp -rn <plugin>/templates/. .` (`-n` = pas d'écrasement).
4. Remplacer `[NOM DU PROJET]`, `[INSTITUTION]`, `[NOM]`, `[JJ/MM/AAAA]` dans `README.md` et `api/openapi.yaml` ; laisser les autres placeholders pour les étapes suivantes.
5. Créer `CLAUDE.md` contenant `@AGENTS.md` si absent.
6. Annoncer la suite : `forge-cadrage` (vision + impact map).

Règles : ne rien inventer (demander), pas de `git push`, pas de commit sans demande.
