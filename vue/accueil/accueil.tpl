

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./vue/accueil/assets/accueil.css">
    <title>Accueil</title>
    <style>
        /* Style pour le bouton "Voir les événements NightOwls" */
        #btnAfficherEvenements {
            padding: 10px 20px;
            background-color: #0056b3; /* Couleur de fond bleue */
            color: white; /* Texte blanc pour le contraste */
            border: none; /* Pas de bordure */
            border-radius: 5px; /* Coins arrondis */
            cursor: pointer; /* Curseur en forme de main au survol */
            font-weight: bold; /* Texte en gras */
            transition: background-color 0.3s; /* Transition en douceur pour le survol */
            margin : 20px;
        }

        #btnAfficherEvenements:hover {
            background-color: #004080; /* Couleur de fond plus foncée au survol */
        }
    </style>
</head>
<body>
   
   <section>
        <!-- Vue/accueil/accueil.tpl -->
        <form class="search-form" action="index.php?controle=evenement&action=rechercher" method="get">
            <input type="date" name="date" placeholder="Date" required />
            <button type="submit">Rechercher</button>
        </form>


</section>

    <section>
        <!-- Bouton pour charger les événements NightOwls -->
        <button id="btnAfficherEvenements">Voir les événements NightOwls</button>
        <section id="evenementsNightOwls" class="columns" style="display:none;"></section>
    </section>
  
     <section>
        <div class="page-header">
            <h1 class="page-title">Evenement à venir</h1>
        </div>
    </section>

    <section class='columns'>
        <?=  showNightClubEvents(); ?>
    </section>
    
        <div class="page-header">
            <h2 id="titre-stat" class="page-title">Statistiques Générales</h1>
        </div>
        <section id="statistics-generales">
            <div class="statistic-container">
                <h3>La musique la plus populaire</h3>
                <?= getMostPopularSongCover();?>
                <p>Source : Deezer</p>
            </div>
            
            <div class="statistic-container  ">
                <h3>Nombre de visites du sites</h3>
                <div class="visits-info ">
                <?= incrementerCompteur();?>
                </div>
            </div>
            <div class="statistic-container  ">
                <h3>La boite la plus populaire</h3>
                <a href="https://www.instagram.com/rexclub/?utm_source=ig_embed&ig_rid=5f0a3276-8b17-40f4-bf59-de37fc7e1adb">
                    <img src="./vue/img/accueil/rexclublogo.jpeg" alt="logo" />
                </a>
            </div>
    </section>  
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
</body>
</html>