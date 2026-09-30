# Correspondance entre la démarche Simetriik et les méthodes attendues par les clients

| Artefact Simetriik | UML (UP) | Merise | Remarque |
|---|---|---|---|
| Impact Map / Vision | Document de vision | Étude préalable | |
| Acteurs de l'Event Storming | Acteurs (cas d'utilisation) | Acteurs (MCC) | |
| Commandes | Cas d'utilisation | Opérations (MCT) | Une commande ≈ un cas d'utilisation |
| Événements + politiques | Diagramme d'activités / d'états | MCT (événement → opération → résultat) | Très proche du MCT |
| Agrégats et entités | Diagramme de classes | MCD (entités, associations) | Agrégat = frontière de cohérence, pas seulement une entité |
| Bounded contexts | Diagramme de paquetages | Domaines (découpage en sous-systèmes) | |
| Scénarios Gherkin | Scénarios de cas d'utilisation | — | Directement testables |
| C4 niveau 2 | Diagramme de déploiement / composants | MPD / architecture technique | |
| Schéma PostgreSQL | — | MLD / MPD | Générable depuis les migrations |
| ADR | — | — | À annexer : apprécié en audit |
