# Leçon 4 — L'ADR : consigner une décision structurante

**Concept.** Un ADR (Architecture Decision Record) consigne *une* décision : contexte, options chiffrées, décision, conséquences. La stack technique est une décision d'architecture : elle se prend par ADR, jamais par défaut.

**Pourquoi.** Dans six mois, personne ne se souvient pourquoi ; l'ADR évite de re-débattre ou de subir un choix arbitraire.

**Exercice (PayBoutique).** Décision : héberger l'API sur un VPS en Europe, sur un hébergeur local béninois, ou sur un cloud public ?
1. Copie `docs/03-architecture/adr/0000-template.md` en `apprentissage/adr/0001-hebergement.md`.
2. Compare au moins deux options avec avantages, inconvénients et **coût estimé en FCFA** ; pense latence pour les utilisateurs béninois et connexions instables.
3. Tranche, note les conséquences, passe le statut à `Acceptée`.
4. `scripts/check-adr-present.sh apprentissage/adr`

**Réussite.** Le script passe. Relecture : les options sont-elles réellement chiffrées ? la dette acceptée est-elle nommée ?

**Sur ton projet.** `forge-architecture`.
