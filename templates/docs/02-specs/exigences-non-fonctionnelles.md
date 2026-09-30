# Exigences non fonctionnelles (ENF)

Statut : Brouillon — valeurs cibles à négocier avec la DSI client.

| Id | Catégorie | Exigence | Cible | Vérification |
|---|---|---|---|---|
| ENF-01 | Performance | Temps de réponse P95 des écrans principaux | < 2 s en 3G (1 Mbit/s) | Test de charge k6 |
| ENF-02 | Disponibilité | Disponibilité mensuelle hors maintenance planifiée | 99,5 % | Supervision |
| ENF-03 | Résilience réseau | Saisie possible hors ligne, synchro au retour réseau | Oui (mobile) | Test terrain |
| ENF-04 | Sécurité | Authentification forte des agents | MFA (TOTP/SMS) | Revue |
| ENF-05 | Sécurité | Conformité OWASP ASVS | Niveau 2 | Audit / pentest |
| ENF-06 | Données perso | Conformité Code du numérique (Bénin) / APDP : registre, consentement, durée de conservation | Oui | Revue DPO |
| ENF-07 | Hébergement | Localisation des données | [Datacenter national / cloud UE / à préciser] | Contrat |
| ENF-08 | Traçabilité | Journal d'audit non modifiable des actions sensibles | Conservation [X] ans | Test |
| ENF-09 | Sauvegarde | RPO / RTO | 24 h / 4 h | Test de restauration trimestriel |
| ENF-10 | Accessibilité | Langues d'interface | FR (+ [fon, yoruba, EN] si requis) | Recette |
| ENF-11 | Compatibilité | Navigateurs et terminaux | Chrome/Firefox récents, Android 9+ bas de gamme | Recette |
| ENF-12 | Exploitabilité | Logs structurés, métriques, alertes | OpenTelemetry | Revue |
