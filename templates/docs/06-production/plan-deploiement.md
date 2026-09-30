# Plan de déploiement

Statut : Brouillon · Lot : · Version cible :

## Environnements
| Env | URL / hôte | Données | Accès |
|---|---|---|---|
| Préproduction | [URL] | Anonymisées | Équipe + recette |
| Production | [URL / VM client] | Réelles | DSI cliente |

## Pipeline CI/CD
Étapes bloquantes : lint, tests, FF-01, FF-03, FF-04 → build image → déploiement préprod → (validation humaine) → production.

## Prérequis production
- [ ] PV de recette signé (`docs/05-recette/`), 0 anomalie bloquante
- [ ] Secrets en variables d'environnement, `.env.example` à jour
- [ ] Sauvegarde BD testée (restauration vérifiée)
- [ ] Migrations relues, réversibles ou plan de retour arrière
- [ ] Conformité données personnelles (APDP) revue

## Déroulé du jour J
| Heure | Action | Responsable | Point de contrôle |
|---|---|---|---|

## Communication
Qui prévenir (client, usagers, agents), par quel canal (SMS, WhatsApp, email), avant et après.
