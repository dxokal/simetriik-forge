# Leçon 3 — La spécification : une règle, un exemple, une validation

**Concept.** Une spec décrit une règle métier *avec sa source* et des exemples Gherkin (cas nominal, limite, erreur). Aucun code sans spec **Validée** par un humain.

**Pourquoi.** L'ambiguïté coûte moins cher sur papier que dans le code. Les exemples deviennent les tests.

**Exercice (PayBoutique).** Règle : « un paiement Mobile Money n'est confirmé qu'après réception du retour de l'opérateur ; un paiement non confirmé après 15 minutes expire. »
1. Copie `docs/02-specs/_TEMPLATE-spec-rapide.md` en `apprentissage/SPEC-001.md`.
2. Remplis la règle (invente une source plausible et dis que c'est fictif), un scénario nominal, et ajoute le cas limite (exactement 15 minutes) et le cas d'erreur (opérateur injoignable).
3. Passe le statut à `Validée` et renseigne `Validé par` avec ton nom et la date du jour (c'est un exercice : tu joues le validateur).
4. `scripts/check-spec-validated.sh apprentissage/SPEC-001.md`

**Réussite.** Le script passe. **Attention :** il ne contrôle que le statut et la présence d'un nom et d'une date de validation, pas la qualité du contenu. En relecture, vérifie ensemble : aucune section vide, les trois cas présents, aucun terme banni.

**Sur ton projet.** `forge-spec` (cycle complet) ou `forge-rapide` (petite fonctionnalité).
