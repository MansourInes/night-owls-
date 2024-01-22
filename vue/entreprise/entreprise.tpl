<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./vue/entreprise/assets/entreprise.css">
    <title>InnovTech & Night Owls</title>
    <style>
        body {
            margin: 0;
            font-family: 'Helvetica Neue', sans-serif;
            background: #b1d8ff;
            color: #333;
        }
        body.dark-theme {
            margin: 0;
            font-family: 'Helvetica Neue', sans-serif;
            background: #000130;
            color: #333;
        }
        #header-nav .a-header:nth-child(3) {
            background-color: #0562be;
        }

        .wrapper {
            max-width: 1200px; /* Or your preferred maximum width */
            margin: auto;
            padding: 20px;
        }

        .header {
            background-color: #001f3f;
            color: white;
            padding: 20px;
            text-align: center;
        }

        .main-content {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between; /* This will maintain spacing between the columns */
            margin: 20px 0;
        }

        .column {
            background-color: #ffffff;
            margin-bottom: 20px;
            padding: 20px;
            flex: 1; /* Each column will take up equal space */
            margin: 0 10px; /* Spacing between columns */
        }
        body.dark-theme .column {
            background-color: #000000;
            margin-bottom: 20px;
            padding: 20px;
            flex: 1; /* Each column will take up equal space */
            margin: 0 10px; /* Spacing between columns */
            color: white;
        }

        /* Ensuring that columns do not get too thin on smaller screens */
        @media (max-width: 768px) {
            .column {
                flex-basis: 100%;
                margin: 10px 0;
            }
        }

        .footer {
            background-color: #001f3f;
            color: white;
            text-align: center;
            padding: 20px;
        }

    </style>
</head>
<body>
    <header class="header">
        <h1>Bienvenue chez InnovTech</h1>
        <p>Une startup d'ingénieurs qualifiés dédiée à l'innovation technologique.</p>
    </header>

    <div class="wrapper">
        <section class="main-content">
            <div class="column" id="introduction">         
                <h2>Night Owls </h2>
                <p>Night Owls va au-delà de l'application ordinaire. C'est une plateforme complète spécialement conçue pour :</p>
                <ul>
                    <li>Rationaliser la gestion des réservations de billets.</li>
                    <li>Optimiser le suivi des performances des DJs.</li>
                </ul>
                <p>Notre objectif principal est de simplifier les processus internes des établissements nocturnes,<br> tout en accentuant de manière significative l'expérience globale de la clientèle.</p>
            </div>

            <div class="column" id="fonctionnalites">
                <h2>Fonctionnalités Principales</h2>
                    <ul>
                        <li><strong>Inscription et Authentification:</strong> Facilitez l'accès à vos services avec un processus d'inscription <br> et d'authentification fluide.</li>
                        <!-- Ajoutez d'autres fonctionnalités ici -->
                    </ul>
            </div>
            <div class="column" id="backoffice">
                <h2>Backoffice Administratif</h2>
                    <p>Le backoffice administratif offre des outils puissants pour la gestion efficace de votre plateforme.</p>
                    <ul>
                        <li><strong>Gestion du Forum:</strong> Animez et suivez les discussions sur votre forum.</li>
                        <!-- Ajoutez d'autres fonctionnalités du backoffice ici -->
                    </ul>
            </div>

            <div class="column" id="mesures">
                <h2>Mesures Sonores et Visuelles</h2>
                    <p>Optimisez l'expérience sonore et visuelle de vos clients avec des fonctionnalités de pointe.</p>
                    <ul>
                        <li><strong>Mesure de la Consommation:</strong> Suivez la consommation de manière précise et efficace.</li>
                        <!-- Ajoutez d'autres mesures sonores et visuelles ici -->
                    </ul>
            </div>
        </section>
    </div>

    <footer class="footer">
        <!-- Footer content -->
    </footer>
</body>
</html>
