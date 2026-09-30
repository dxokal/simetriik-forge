# Runbook d'exploitation

Statut : Brouillon

## Démarrer / arrêter / redéployer
[commandes Docker Compose ou systemd]

## Vérifier la santé
| Contrôle | Commande / URL | Résultat attendu |
|---|---|---|
| API | `/health` | 200 |
| BD | | |

## Incidents courants
| Symptôme | Cause probable | Action | Escalade |
|---|---|---|---|
| Paiement mobile en échec | Agrégateur indisponible | Vérifier statut opérateur, file de reprise | Tech lead |

## Sauvegarde et restauration
Fréquence, rétention, procédure de restauration testée le [date].

## Contacts
| Rôle | Nom | Téléphone | Horaires |
|---|---|---|---|
