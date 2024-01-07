<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./vue/accueil/assets/accueil.css">
    <title>Accueil</title>
</head>
<body>
    <section>
        <form class="search-form" action="rechercher.php" method="get">
            <input type="text" name="query" placeholder="Rechercher..." />
            <button type="submit">Rechercher</button>
        </form>
    </section>
    <div class="page-header">
        <h1 class="page-title">Evenement à venir</h1>
    </div>
        <section class='columns'>
            <div class='ligne'>
                <a href="https://shotgun.live/fr/festivals/le-jardin-d-hiver-2024-lille">
                    <img src="./vue/img/accueil/image1.png" alt="event1" title="événement : Jardin d'hiver " />
                    <p>Jardin d'hiver</p>
                    <button class="btn-reserver">Réserver</button>
                </a>
            </div>
            <div class='ligne'>
                <a href="https://shotgun.live/fr/festivals/newrave-festival-2023-lunar">
                    <img src="./vue/img/accueil/image2.png" alt="event2" title="événement : new RAVE " />
                    <p>New RAVE Festival</p>
                    <button class="btn-reserver">Réserver</button>
                </a>
            </div>
            <div class='ligne'>
                <a href="https://shotgun.live/fr/festivals/holiday-house">
                    <img src="./vue/img/accueil/image3.png" alt="event3" title="événement : holidays house " />
                    <p>Holidays House</p>
                    <button class="btn-reserver">Réserver</button>
                </a>
            </div>
            <div class='ligne'>
                <a href="https://shotgun.live/fr/events/la-purple-nantes-christmas-edition">
                    <img src="./vue/img/accueil/image4.png" alt="event4" title="événement : Purgatory " />
                    <p>Purgatory</p>
                    <button class="btn-reserver">Réserver</button>
                </a>
            </div>
        </section>
    
        <section class='columns'>
            <div class='ligne'>
                <a href="https://shotgun.live/fr/venues/yardland">
                    <img src="./vue/img/accueil/image5.jpg" alt="event5" title="événement : Yardland " />
                    <p>Yardland</p>
                    <button class="btn-reserver">Réserver</button>
                </a>
            </div>
            <div class='ligne'>
                <a href="https://shotgun.live/fr/festivals/rock-en-seine-2024">
                    <img src="./vue/img/accueil/image6.jpg" alt="event6" title="événement : Rock en Seine " />
                    <p>Rock en Seine</p>
                    <button class="btn-reserver">Réserver</button>
                </a>
            </div>
            <div class='ligne'>
                <a href="https://shotgun.live/fr/events/nomadas-neptunes-fest-special-nye">
                    <img src="./vue/img/accueil/image7.jpg" alt="event7" title="événement : Culture" />
                    <p>Culture</p>
                    <button class="btn-reserver">Réserver</button>
                </a>
            </div>
            <div class='ligne'>
                <a href="https://shotgun.live/fr/festivals/illuzion-market-trap-music-bar-funchal">
                    <img src="./vue/img/accueil/image8.jpg" alt="event8" title="événement : illusion market " />
                    <p>Illusion Market</p>
                    <button class="btn-reserver">Réserver</button>
                </a>
            </div>
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
</body>
</html>