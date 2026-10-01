# simetriik-forge

Plugin pour pratiquer la démarche du dossier Lumière, du besoin à la mise en production, avec des garde-fous déterministes (`scripts/`).

| Étape | Skill |
|---|---|
| Démarrage | `forge-init` |
| 0 Cadrage | `forge-cadrage` |
| 1 Domaine | `forge-domaine` |
| 2 Spécification | `forge-spec` |
| 3 Architecture / contrat | `forge-architecture`, `forge-contrat` |
| Code | `forge-implemente` |
| 5 Recette | `forge-recette` |
| 6 Production | `forge-prod` |
| Petite fonctionnalité (cycle court) | `forge-rapide` |
| Suivi | `forge-statut` |

## Installation
- **Claude Code** : `claude --plugin-dir /chemin/vers/simetriik-forge`
- **Codex et OpenCode** : `./install.sh` (liens symboliques dans `~/.agents/skills`, lu par les deux). Redémarrer l'outil si les skills n'apparaissent pas.

Dans un projet vide : lancer `forge-init`, puis suivre `forge-statut`.

Chaque skill se termine par `scripts/forge-progress.sh` : barre de progression sur les 7 étapes (0 à 6), ex. `Progression [███░░░░] 3/7 · étape en cours : Architecture · suite : forge-contrat`.

Rigueur Git : `scripts/check-branch.sh` (pas de code sur `main`, branches `feat/`·`fix/`) et `scripts/check-commit-msg.sh` (Conventional Commits), utilisables en hook `commit-msg` ou en CI.

Hook pre-commit (opt-in, `scripts/install-hooks.sh`) : sur `feat/SPEC-NNN-slug`, tout commit de code est refusé tant que la spec n'est pas `Validée` ; les commits docs-only et les branches `fix/` passent. Contournable par `--no-verify` : seule une CI serveur rendrait la règle absolue.

## Tests
`bash tests/run.sh` (garde-fous uniquement ; les skills sont des instructions, à éprouver sur un projet réel).
