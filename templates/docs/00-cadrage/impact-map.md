# Impact Map

Statut : Brouillon

Chaque fonctionnalité doit remonter à un objectif. Sinon, elle sort du périmètre.

```mermaid
graph LR
  G["🎯 POURQUOI<br/>O1 : [objectif mesurable]"]
  A1["👤 QUI<br/>[Acteur 1]"]
  A2["👤 QUI<br/>[Acteur 2]"]
  I1["↗ COMMENT<br/>[changement de comportement]"]
  I2["↗ COMMENT<br/>[changement de comportement]"]
  D1["📦 QUOI<br/>[fonctionnalité]"]
  D2["📦 QUOI<br/>[fonctionnalité]"]
  G --> A1 --> I1 --> D1
  G --> A2 --> I2 --> D2
```

## Priorisation (MoSCoW)
| Fonctionnalité | Objectif | Impact visé | Priorité | Lot |
|---|---|---|---|---|
| | O1 | | Must | Lot 1 |
