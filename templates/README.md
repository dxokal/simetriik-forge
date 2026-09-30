# Dossier de conception — [NOM DU PROJET]

> Modèle Simetriik Solutions (filiale de Nemim Sarl) — v1.0
> Client : [INSTITUTION] · Chef de projet : [NOM] · Démarrage : [JJ/MM/AAAA]

Ce dépôt est la **source de vérité** de la conception. Les humains et les agents IA
(Claude Code, etc.) travaillent à partir de ces fichiers. Toute décision qui n'est
pas écrite ici n'existe pas.

## Démarche en 5 temps

| Étape | Dossier | Livrable clé | Validé par |
|---|---|---|---|
| 0. Cadrage | `docs/00-cadrage/` | Vision + Impact Map | Sponsor client |
| 1. Domaine | `docs/01-domaine/` | Event Storming, glossaire, context map | Experts métier |
| 2. Spécifications | `docs/02-specs/` | Specs fonctionnelles + exemples Gherkin | Référent métier + Tech lead |
| 3. Architecture | `docs/03-architecture/` | C4 + ADR + fitness functions | Tech lead / DSI client |
| 4. Livrables client | `docs/04-livrables-client/` | Dossier formel (UML/Merise si exigé) | Comité de pilotage |
| 5. Recette | `docs/05-recette/` | Plan et PV de recette | Client |

Contrats d'API : `api/openapi.yaml`. Consignes pour les agents IA : `AGENTS.md`.

## Règles du dépôt

1. **Spec avant code** : pas de ticket de dev sans spec au statut `Validée`.
2. **Une décision structurante = un ADR** (`docs/03-architecture/adr/`).
3. **Le glossaire fait foi** : un terme métier a un seul nom, dans le code comme dans les docs.
4. Les diagrammes sont **en code** (Structurizr DSL / Mermaid), jamais en image seule.
5. Toute modification de spec passe par une Pull Request relue.

## Statuts des documents

`Brouillon` → `En revue` → `Validée` → `Obsolète` (remplacée par …)
