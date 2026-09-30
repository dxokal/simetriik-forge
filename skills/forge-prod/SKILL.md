---
name: forge-prod
description: Prépare et documente la mise en production (étape 6) : plan de déploiement, CI/CD, runbook, retour arrière, monitoring lié aux objectifs de l'Impact Map. Utilise pour "mise en production", "déployer", "runbook", "rollback" ou /forge-prod.
---

# forge-prod

Produit `docs/06-production/{plan-deploiement,runbook,rollback,plan-monitoring}.md` (gabarits fournis).

1. **Porte d'entrée** : PV de recette signé par le client, 0 bloquante. Sinon, s'arrêter.
2. Interroger sur l'hébergement réel (VM client, cloud, on-premise), la capacité d'exploitation de la DSI, le budget FCFA. Décision structurante (hébergement, orchestration) = ADR via `forge-architecture`; par défaut Docker Compose ou une VM (ADR-0001).
3. Renseigner le plan de déploiement, le pipeline CI/CD (FF-01/03/04 bloquants), le runbook, le retour arrière avec déclencheurs chiffrés, le monitoring.
4. Contraintes par défaut : connexions lentes/instables, reprise après coupure, paiements Mobile Money (file de reprise, statuts vérifiables auprès de l'opérateur), secrets en variables d'environnement.
5. Monitoring métier : chaque objectif `O#` de l'Impact Map reçoit un indicateur, une source de mesure et une revue à J+7/J+30.
6. **Confirmation explicite avant** : toute modification CI/CD, Docker, `.env`, migration ou donnée de production, `git push`, appel à un service payant. Ce skill rédige et prépare ; il n'exécute jamais un déploiement de production de lui-même.

Clôture : revue post-production, puis retour à `forge-cadrage` pour le lot suivant.

Terminer en lançant `scripts/forge-progress.sh` et en affichant sa sortie (barre de progression sur les 7 étapes).
