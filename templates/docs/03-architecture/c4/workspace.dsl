// Modèle C4 — Structurizr DSL
// Rendu : docker run -it --rm -p 8080:8080 -v $(pwd):/usr/local/structurizr structurizr/lite
workspace "[Nom du projet]" "Architecture C4 — Simetriik Solutions" {

    model {
        // Acteurs
        applicant = person "Usager" "Dépose et suit ses demandes"
        agent = person "Agent instructeur" "Instruit les demandes"

        // Systèmes externes
        payment = softwareSystem "Agrégateur de paiement mobile" "MTN MoMo, Moov Money, cartes" "External"
        sms = softwareSystem "Passerelle SMS" "" "External"
        iam = softwareSystem "Keycloak" "Identité et accès" "External"

        system = softwareSystem "[Nom du système]" {
            web = container "Application web" "Interface usagers et agents" "[STACK : à fixer par ADR]"
            mobile = container "Application mobile" "Saisie terrain hors ligne" "[STACK : à fixer par ADR]"
            api = container "API (monolithe modulaire)" "Règles métier, un module par bounded context" "[STACK : à fixer par ADR]" {
                instruction = component "Module Instruction" "Contexte cœur"
                notification = component "Module Notifications" "Contexte support"
                paymentAcl = component "ACL Paiement" "Couche anticorruption"
            }
            db = container "Base de données" "" "PostgreSQL" "Database"
            files = container "Stockage de fichiers" "Pièces justificatives" "MinIO (S3)" "Database"
        }

        // Relations
        applicant -> web "Utilise" "HTTPS"
        agent -> web "Utilise" "HTTPS"
        agent -> mobile "Utilise sur le terrain"
        web -> api "Appelle" "JSON/HTTPS"
        mobile -> api "Synchronise" "JSON/HTTPS"
        api -> db "Lit/écrit" "SQL"
        api -> files "Stocke" "S3"
        api -> iam "Valide les jetons" "OIDC"
        paymentAcl -> payment "Initie et vérifie les paiements" "HTTPS + webhooks"
        notification -> sms "Envoie" "HTTPS"
        instruction -> notification "Publie des événements"
        instruction -> paymentAcl "Demande un paiement"
    }

    views {
        systemContext system "N1-Contexte" { include * ; autolayout lr }
        container system "N2-Conteneurs" { include * ; autolayout lr }
        component api "N3-Composants-API" { include * ; autolayout lr }
        styles {
            element "Person" { shape Person ; background #0b4f6c ; color #ffffff }
            element "Software System" { background #1b7fa6 ; color #ffffff }
            element "Container" { background #3aa6d0 ; color #ffffff }
            element "Database" { shape Cylinder }
            element "External" { background #999999 ; color #ffffff }
        }
    }
}
