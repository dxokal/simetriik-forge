---
name: forge-domaine
description: Modélise le domaine (étape 1) : compte rendu d'Event Storming, glossaire ubiquitaire avec noms techniques anglais et synonymes bannis, sous-domaines et context map. Utilise pour "event storming", "glossaire", "bounded contexts" ou /forge-domaine.
---

# forge-domaine

1. Lire `docs/01-domaine/{event-storming,glossaire,context-map}.md`.
2. Event Storming : recueillir événements (participe passé), commandes, acteurs, politiques, systèmes externes, points chauds. Alimenter le flux Mermaid et la table des points chauds ; ne pas trancher un point chaud sans son responsable.
3. Glossaire : un terme = une définition = un nom technique anglais. Lister les synonymes à **bannir** (alimente le garde-fou FF-05 `scripts/check-glossary-terms.sh`). Une seule virgule entre synonymes. Le script détecte aussi un synonyme à l'intérieur d'un identifiant (`DossierService`, `client_id`) ; un faux positif assumé se marque par un commentaire `glossary-ignore` sur la ligne.
4. Context map : classer les sous-domaines (Cœur / Support / Générique), regrouper en bounded contexts, choisir les patterns (ACL pour paiement externe, Conformist pour IAM…). Effort de conception au cœur ; acheter ou faire simple ailleurs.
5. Vérifier qu'aucun terme n'apparaît sous deux noms dans les docs existants.

Suite : `forge-spec` par fonctionnalité, `forge-architecture` en parallèle.

Terminer en lançant `scripts/forge-progress.sh` et en affichant sa sortie (barre de progression sur les 7 étapes).
