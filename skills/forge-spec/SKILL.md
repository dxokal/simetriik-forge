---
name: forge-spec
description: Rédige une spécification fonctionnelle (docs/02-specs/SPEC-NNN.md + features/SPEC-NNN.feature) depuis le gabarit, par questionnement, et la fait valider. Utilise quand l'utilisateur veut spécifier une fonctionnalité, écrire des critères d'acceptation Gherkin, ou lance /forge-spec.
---

# forge-spec

Pas de code sans spec `Validée`. Ce skill produit la spec, il n'implémente rien.

1. Lire `docs/01-domaine/glossaire.md` (vocabulaire exact), `docs/00-cadrage/impact-map.md` (objectif `O#` lié) et `docs/02-specs/_TEMPLATE-spec.md`.
2. Numéroter : prochain `SPEC-NNN` libre. Copier le gabarit en `docs/02-specs/SPEC-NNN.md`, statut `Brouillon`.
3. Remplir section par section, **une question à la fois** : problème, récit, règles métier (chaque règle avec sa source), données (marquer les données personnelles), interfaces, hors périmètre.
   - Ne jamais inventer une règle métier : si elle manque, la mettre en « Questions ouvertes » et demander.
   - Montants en FCFA entiers ; termes du glossaire uniquement (ajouter les nouveaux termes au glossaire avec leur nom technique anglais).
4. Écrire `docs/02-specs/features/SPEC-NNN.feature` (Gherkin français) : 1 `Règle` par règle métier, au moins un cas nominal, un cas limite, un cas d'erreur.
5. Passer le statut à `En revue` ; demander la validation métier puis tech. Seul l'humain passe à `Validée` (renseigner nom + date).
6. Vérifier : `scripts/check-spec-validated.sh docs/02-specs/SPEC-NNN.md`.

Suite : `forge-contrat` puis `forge-implemente`.
