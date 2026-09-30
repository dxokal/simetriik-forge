# Livrables formels pour le client

Beaucoup d'administrations et de bailleurs exigent un **dossier de conception** au format
classique (UML, parfois Merise). On ne conçoit pas en UML : on **génère** ces vues
depuis les artefacts du dépôt, au moment des jalons.

## Dossier de conception générale (DCG) — sommaire type
1. Présentation du projet ← `00-cadrage/vision.md`
2. Périmètre et objectifs ← `00-cadrage/impact-map.md`
3. Analyse de l'existant et processus cibles ← `01-domaine/event-storming.md` (+ BPMN si exigé)
4. Glossaire ← `01-domaine/glossaire.md`
5. Spécifications fonctionnelles ← `02-specs/SPEC-*.md`
6. Modèle de données (MCD / diagramme de classes) ← agrégats du contexte cœur
7. Architecture technique ← `03-architecture/c4/` + ADR
8. Exigences non fonctionnelles et sécurité ← `02-specs/exigences-non-fonctionnelles.md`
9. Plan de recette ← `05-recette/plan-recette.md`

Voir `correspondance-methodes.md` pour la table de passage.

## Génération assistée
Demander à l'agent IA : *« À partir de docs/, génère le DCG au format Word selon le
sommaire de docs/04-livrables-client/README.md, avec diagrammes UML en PlantUML. »*
Relire systématiquement : l'IA reformule, elle ne doit pas inventer.
