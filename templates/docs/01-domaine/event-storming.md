# Compte rendu d'Event Storming

Type : Big Picture / Process Level · Date : · Participants :
Photos du mur : `docs/01-domaine/photos/` · Outil : [Miro / papier]

## Légende
| Couleur | Élément | Formulation |
|---|---|---|
| 🟧 Orange | Événement métier | Participe passé : « Demande soumise » |
| 🟦 Bleu | Commande | Impératif : « Soumettre la demande » |
| 🟨 Jaune | Acteur | « Agent de guichet » |
| 🟪 Lilas | Politique / règle | « Dès que…, alors… » |
| 🟩 Vert | Vue / information | « Liste des demandes en attente » |
| 🩷 Rose | Système externe | « Plateforme de paiement mobile » |
| 🟥 Rouge | Point chaud / question | « Qui valide au-delà de 5 M FCFA ? » |

## Flux principal (chronologique)
```mermaid
flowchart LR
  C1[/"Soumettre demande"/]:::cmd --> E1(["Demande soumise"]):::evt
  E1 --> P1{{"Dès qu'une demande est soumise, notifier le superviseur"}}:::pol
  P1 --> C2[/"Valider demande"/]:::cmd --> E2(["Demande validée"]):::evt
  classDef evt fill:#f59e0b,color:#000
  classDef cmd fill:#3b82f6,color:#fff
  classDef pol fill:#c4b5fd,color:#000
```

## Événements pivots (changements de phase)
1.
2.

## Points chauds à résoudre
| # | Question | Responsable | Échéance | Réponse |
|---|---|---|---|---|
| H1 | | | | |

## Candidats bounded contexts identifiés
→ reportés dans `context-map.md`
