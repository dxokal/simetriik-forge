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
| Suivi | `forge-statut` |

## Installation
- **Claude Code** : `claude --plugin-dir /chemin/vers/simetriik-forge`
- **Codex et OpenCode** : `./install.sh` (liens symboliques dans `~/.agents/skills`, lu par les deux). Redémarrer l'outil si les skills n'apparaissent pas.

Dans un projet vide : lancer `forge-init`, puis suivre `forge-statut`.

## Tests
`bash tests/run.sh` (garde-fous uniquement ; les skills sont des instructions, à éprouver sur un projet réel).
