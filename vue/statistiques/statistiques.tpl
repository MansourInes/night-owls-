<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="./vue/statistiques/assets/style.css"/>
    <title>Statistiques</title>
</head>
<body>
    <div class="container-page">
        <header class="page-header">
            <h1 class="page-title">Dernier évènement</h1>
        </header>
            <section class="chart-section">
                <a>
                    <img src="./vue/img/statistiques/intensité sonore.png" alt="" class="chart-image">
                </a>
            </section>
            <section class="chart-section">
                <a>
                    <img src="./vue/img/statistiques/Graphique en secteur .png" alt="" class="chart-image">
                </a>
            </section>
            <div class="container-page">
                <header class="page-header">
                    <h1 class="page-title">Statistiques générales</h1>
                </header>
            </div>
            <section class="general-stats">
                <a href="https://shotgun.live/fr/festivals/rock-en-seine-2024">
                    <img class="stat_gen" src="./vue/img/statistiques/rock_en_seine.jpg" alt="">
                    <p class="p">Soirée recommandée</p>
                </a>
                <a href="">
                    <p class="p">Meilleur son du moment</p>
                    <?= getMostPopularSongCover(); ?>
                    <p id="deezer"> Source : Deezer</p>
                </a>
                <a href="https://soundcloud.com/user-685208605">
                    <img class="stat_gen" src="./vue/img/statistiques/pp_dj.jpg" alt="">
                    <p class="p">DJ recommandé : SSEJOW</p>
                </a>
            </section>
    </div>
</body>
</html>
