# Leçon 2 — Le langage omniprésent (glossaire)

**Concept.** Un terme métier = une définition = un nom technique. Les synonymes sont *bannis* du code et des documents.

**Pourquoi.** « Client », « acheteur » et « usager » pour la même personne créent des bogues et des malentendus entre métier et technique.

**Exercice (PayBoutique).**
Amorce : crée `apprentissage/code/order.ts` contenant `class Client { name: string }`.
1. Dans `apprentissage/glossaire.md`, au même format que `docs/01-domaine/glossaire.md` (tableau à 6 colonnes), définis le terme **Acheteur** (nom technique `Buyer`) et bannis les synonymes `client` et `user` dans la colonne « Synonymes à éviter ».
2. Lance `scripts/check-glossary-terms.sh apprentissage/glossaire.md apprentissage/code` : il doit échouer (KO). Corrige le code jusqu'à OK.

**Réussite.** Le script passe, après avoir échoué une première fois.

**Sur ton projet.** `forge-domaine`.
