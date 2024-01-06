<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="../vue/entreprise/assets/entreprise.css">
    <style>
        body {
            /* background-color: #f8f8f8; */
            margin: 0;
            font-family: 'Helvetica Neue', sans-serif;
            background: #b1d8ff;
        }

        article {
            padding: 20px;
        }

        #introduction,
        #backoffice {
            background-color: #001f3f;
            float: right;
            color: white;
        }

        #fonctionnalites,
        #mesures {
            background-color: #ffffff;
            float: left;
        }

        footer {
            clear: both; /* Clear the float property for the footer */
            background-color: #001f3f;
            color: white;
            text-align: center;
            padding: 20px;
        }

        .footer-content {
            display: flex;
            justify-content: space-between;
            background-color: #001f3f;
            color: #fff;
            padding: 20px;
            font-size: 0.9em;
        }

        .footer-section {
            display: flex;
            flex-direction: column;
        }

        .footer-section h3 {
            margin-bottom: 3px;
        }

        .footer-section a {
            color: #fff;
            text-decoration: none;
            line-height: 2;
            transition: color 0.3s ease;
        }

        .footer-section a:hover {
            color: red;
        }

        .footer-bottom {
            text-align: center;
            background-color: #001931;
            color: #fff;
            padding: 3px 10;
        }
        p{
            margin: 20px;
        }
    </style>

    <title>InnovTech & Night Owls</title>
</head>

<body>

    <h1>Bienvenue chez InnovTech</h1>
    <h2 style="align-self: center;">Une startup d'ingénieurs qualifiés dédiée à l'innovation technologique.</h2>

    <section id="introduction">
        <h2>Night Owls </h2>
        <p>Night Owls va au-delà de l'application ordinaire. C'est une plateforme complète spécialement conçue pour :</p>
        <ul>
            <li>Rationaliser la gestion des réservations de billets.</li>
            <li>Optimiser le suivi des performances des DJs.</li>
        </ul>
        <p>Notre objectif principal est de simplifier les processus internes des établissements nocturnes,<br> tout en accentuant de manière significative l'expérience globale de la clientèle.</p>
    </section>
    

    <article id="fonctionnalites">
        <h2>Fonctionnalités Principales</h2>
        <ul>
            <li><strong>Inscription et Authentification:</strong> Facilitez l'accès à vos services avec un processus d'inscription <br> et d'authentification fluide.</li>
            <!-- Ajoutez d'autres fonctionnalités ici -->
        </ul>
    </article>

    <article id="backoffice">
        <h2>Backoffice Administratif</h2>
        <p>Le backoffice administratif offre des outils puissants pour la gestion efficace de votre plateforme.</p>
        <ul>
            <li><strong>Gestion du Forum:</strong> Animez et suivez les discussions sur votre forum.</li>
            <!-- Ajoutez d'autres fonctionnalités du backoffice ici -->
        </ul>
    </article>

    <article id="mesures">
        <h2>Mesures Sonores et Visuelles</h2>
        <p>Optimisez l'expérience sonore et visuelle de vos clients avec des fonctionnalités de pointe.</p>
        <ul>
            <li><strong>Mesure de la Consommation:</strong> Suivez la consommation de manière précise et efficace.</li>
            <!-- Ajoutez d'autres mesures sonores et visuelles ici -->
        </ul>
    </article>

    
</body>

</html>
