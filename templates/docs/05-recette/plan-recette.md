# Plan de recette

Statut : Brouillon · Environnement : [URL de préproduction]

## Organisation
| Rôle | Nom | Responsabilité |
|---|---|---|
| Responsable recette client | | Signe le PV |
| Testeurs métier | | Exécutent les scénarios |
| Simetriik | | Support, correction |

## Critères d'entrée
- Specs du lot au statut `Validée`
- Scénarios Gherkin automatisés au vert en CI
- Jeu de données de recette chargé (données anonymisées)

## Classification des anomalies
| Niveau | Définition | Délai de correction |
|---|---|---|
| Bloquante | Empêche un processus métier sans contournement | 48 h ouvrées |
| Majeure | Processus dégradé, contournement possible | 5 j ouvrés |
| Mineure | Gêne ergonomique ou cosmétique | Lot suivant |

## Critères de sortie (acceptation)
0 bloquante, ≤ [N] majeures avec plan de correction, ENF critiques vérifiées.

## Scénarios
| Id | Spec | Scénario | Résultat attendu | Obtenu | Statut | Testeur | Date |
|---|---|---|---|---|---|---|---|

## PV de recette
Lot : · Date : · Décision : ☐ Acceptée ☐ Acceptée avec réserves ☐ Refusée
Réserves :
Signatures : Client ____________ Simetriik Solutions ____________
