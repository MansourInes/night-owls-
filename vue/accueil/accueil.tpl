<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Métadonnées de base -->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <!-- Lien vers la feuille de style CSS externe -->
    <link rel="stylesheet" href="./vue/accueil/assets/accueil.css">
    
    <!-- Titre de la page -->
    <title>Accueil</title>
</head>
<body>
    <!-- Section pour les événements NightOwls -->
    <section>
        <!-- Bouton pour charger les événements NightOwls -->
        <button id="btnAfficherEvenements">Voir les événements NightOwls</button>
        <!-- Section pour afficher les événements NightOwls (initiallement masquée) -->
        <section id="evenementsNightOwls" class="columns" style="display:none;"></section>
    </section>
  
    <!-- Section pour l'en-tête de la page -->
    <section>
        <div class="page-header">
            <h1 class="page-title">Evenement à venir</h1>
        </div>
    </section>

    <!-- Section pour afficher les événements NightClub en utilisant PHP -->
    <section class='columns'>
        <?= showNightClubEvents(); ?>
    </section>
    
    <!-- Section pour afficher des statistiques générales -->
    <div class="page-header">
        <h2 id="titre-stat" class="page-title">Statistiques Générales</h2>
    </div>
    <section id="statistics-generales">
        <!-- Container pour afficher la musique la plus populaire -->
        <div class="statistic-container">
            <h3>La musique la plus populaire</h3>
            <?= getMostPopularSongCover(); ?>
            <p>Source : Deezer</p>
        </div>
        
        <!-- Container pour afficher le nombre de visites du site -->
        <div class="statistic-container">
            <h3>Nombre de visites du site</h3>
            <div class="visits-info">
                <?= incrementerCompteur(); ?>
            </div>
        </div>

        <!-- Container pour afficher la boîte de nuit la plus populaire -->
        <div class="statistic-container">
            <h3>La boite la plus populaire</h3>
            <a href="https://www.instagram.com/rexclub/?utm_source=ig_embed&ig_rid=5f0a3276-8b17-40f4-bf59-de37fc7e1adb">
                <img src="./vue/img/accueil/rexclublogo.jpeg" alt="logo" />
            </a>
        </div>
    </section>  
    
    <!-- Script JavaScript pour charger les événements NightOwls en réponse au clic -->
    <script>
        document.getElementById('btnAfficherEvenements').addEventListener('click', function() {
            fetch('index.php?controle=evenement&action=afficherEvenements')
                .then(response => response.text())
                .then(html => {
                    document.getElementById('evenementsNightOwls').innerHTML = html;
                    document.getElementById('evenementsNightOwls').style.display = 'block';
                })
                .catch(error => console.error('Erreur:', error));
        });
    </script>  
    
    <!-- Script JavaScript pour le changement de thème -->
    <script src="./modele/theme-switcher.js"></script>
</body>
</html>
