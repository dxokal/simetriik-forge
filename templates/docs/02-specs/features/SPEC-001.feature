# language: fr
# Exemple — à remplacer. Chaque scénario = un critère d'acceptation testable.
Fonctionnalité: Soumission d'une demande
  En tant qu'usager
  Je veux soumettre une demande en ligne
  Afin d'éviter de me déplacer au guichet

  Règle: R1 — une demande complète reçoit un numéro unique

    Scénario: Soumission d'une demande complète
      Étant donné un usager authentifié
      Et une demande avec toutes les pièces obligatoires
      Quand l'usager soumet la demande
      Alors la demande passe au statut "Soumise"
      Et un numéro au format "DEM-2026-NNNNN" lui est attribué
      Et l'usager reçoit un SMS de confirmation

  Règle: R2 — les frais doivent être payés avant instruction

    Scénario: Demande soumise sans paiement
      Étant donné une demande soumise dont les frais de 5000 FCFA ne sont pas payés
      Quand un agent tente de l'instruire
      Alors l'action est refusée avec le motif "Paiement en attente"
