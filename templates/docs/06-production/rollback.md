# Plan de retour arrière

Statut : Brouillon

## Déclencheurs (décidés à l'avance)
- Taux d'erreur > [x] % pendant [n] min
- Processus métier critique bloqué sans contournement

## Procédure
1. Geler les nouvelles entrées si nécessaire.
2. Redéployer la version précédente : [commande / tag].
3. Base de données : [migration inverse | restauration]. **Confirmation humaine obligatoire.**
4. Vérifier avec le runbook, informer le client.

## Durée maximale acceptée
[ex. 30 min]
