<?php
require "./header.inc.php"
?>
<link rel="stylesheet" href="style.css"/>
<section>
    <h1>Statistiques du dernier évènement :</h1>
    <section>
        <a href="diagramme.png">
            <img class="diagramme" src="diagramme.png" alt="">
            <p>Diagramme indiquant le niveau d'affluence pour chaque musique</p>
        </a>
    </section>
    
    <h1>Statistiques générales :</h1>
<section class="general-stats">
    <a href="https://shotgun.live/fr/festivals/rock-en-seine-2024">
        <img class="stat_gen" src="rock_en_seine.jpg" alt="">
        <p>Soirée recommandée</p>
    </a>
<?php   require "./functions.inc.php" ?>
    <a href="">
        <?= getMostPopularSongCover();?>
        <p>Meilleur son du moment</p>
    </a>
    <a href="https://soundcloud.com/user-685208605">
        <img class="stat_gen" src="pp_dj.jpg" alt="">
        <p>DJ recommandé : SSEJOW</p>
    </a>

    
</section>

<?php
require "./footer.inc.php"
?>