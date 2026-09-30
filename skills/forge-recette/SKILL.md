---
name: forge-recette
description: Prépare la recette (étape 5) : dérive les scénarios de recette des fichiers Gherkin, renseigne docs/05-recette/plan-recette.md, suit les anomalies et prépare le PV. Utilise pour "plan de recette", "PV de recette", "tests d'acceptation client" ou /forge-recette.
---

# forge-recette

1. Lire `docs/05-recette/plan-recette.md` et chaque `docs/02-specs/features/*.feature` des specs du lot.
2. Un scénario Gherkin = une ligne de la table Scénarios (Id, Spec, Scénario, Résultat attendu) ; colonnes Obtenu/Statut/Testeur/Date vides, à remplir par les testeurs.
3. Vérifier les **critères d'entrée** : specs `Validée` (`scripts/check-spec-validated.sh`), scénarios automatisés verts en CI, jeu de données anonymisé. Sinon, le dire et ne pas lancer la recette.
4. Anomalies : classer Bloquante (48 h) / Majeure (5 j) / Mineure (lot suivant) selon le tableau du plan ; ne jamais reclasser sans l'avis du responsable recette client.
5. Critères de sortie : 0 bloquante, ≤ N majeures avec plan, ENF critiques vérifiées. Ne jamais déclarer la recette réussie à la place du client : le PV est signé par lui.
6. Un bug trouvé en recette : enquêter avec `/investigue`, corriger via `forge-implemente`, rejouer le scénario.

Suite : `forge-prod`.

Terminer en lançant `scripts/forge-progress.sh` et en affichant sa sortie (barre de progression sur les 7 étapes).
