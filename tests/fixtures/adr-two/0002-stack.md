# ADR-0002 — Démarrer en monolithe modulaire aligné sur les bounded contexts

Statut : Acceptée · Date : [JJ/MM/AAAA] · Décideurs : Tech lead Simetriik

## Contexte
Équipe de taille réduite, infrastructure client souvent limitée (serveurs on-premise,
compétences d'exploitation réduites), besoin de livrer vite un premier lot.
Les microservices multiplient les coûts d'exploitation (orchestration, observabilité
distribuée, réseau) sans bénéfice tant que les équipes et la charge ne l'imposent pas.

## Options envisagées
| Option | Avantages | Inconvénients |
|---|---|---|
| Monolithe classique | Simple | Frontières floues, dette rapide |
| **Monolithe modulaire** | Simple à déployer, frontières nettes, extraction possible | Discipline requise |
| Microservices | Scalabilité indépendante | Coût d'exploitation élevé pour le client |

## Décision
Un seul déployable, **un module par bounded context**, communication inter-modules via
interfaces publiques ou événements internes uniquement. Une base PostgreSQL, **un schéma
par module**.

## Conséquences
- Déploiement simple (Docker Compose ou une VM) : adapté aux DSI clientes.
- Un module pourra être extrait en service si une contrainte réelle apparaît (nouvel ADR).
- Fitness function : interdiction d'import croisé entre modules (voir `fitness-functions.md`).
