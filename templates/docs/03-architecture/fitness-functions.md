# Fitness functions

Contrôles automatiques exécutés en CI pour empêcher l'architecture de dériver.

| Id | Protège | Règle | Outil | Bloquant |
|---|---|---|---|---|
| FF-01 | ADR-0001 | Aucun import direct entre modules de contextes différents | import-linter (Python) / dependency-cruiser (TS) / ArchUnit (Java) | Oui |
| FF-02 | ENF-01 | P95 < 2 s sur scénario de référence | k6 | Non (alerte) |
| FF-03 | ENF-05 | 0 vulnérabilité critique dans les dépendances | Trivy / pip-audit / npm audit | Oui |
| FF-04 | Contrats | L'implémentation respecte `api/openapi.yaml` | Schemathesis | Oui |
| FF-05 | Glossaire | Pas de terme banni dans le code | Script grep sur la liste des synonymes | Non |

## Exemple — FF-01 avec import-linter (Python / FastAPI)
```ini
# .importlinter
[importlinter]
root_package = app

[importlinter:contract:bounded-contexts]
name = Les modules ne s'importent pas entre eux
type = independence
modules =
    app.instruction
    app.notification
    app.payment_acl
```

## Exemple — FF-01 avec dependency-cruiser (TypeScript)
```js
// .dependency-cruiser.cjs
module.exports = {
  forbidden: [{
    name: "no-cross-context-imports",
    comment: "Un module ne dépend que des interfaces publiques des autres",
    from: { path: "^src/modules/([^/]+)/" },
    to: { path: "^src/modules/([^/]+)/(?!public)", pathNot: "^src/modules/$1/" },
    severity: "error",
  }],
};
```
