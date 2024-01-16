<?php


// Initialisation d'une variable pour stocker les résultats
$resultatEvenements = '';

// Vérifier si le formulaire a été soumis
if ($_SERVER['REQUEST_METHOD'] == 'GET' && isset($_GET['ville']) && isset($_GET['date'])) {
    // Appeler la fonction rechercheEvenements et stocker le résultat
    $resultatEvenements = rechercheEvenements();
}
?>

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
        <form class="search-form" action="" method="get">
            <input type="text" name="nomEvenement" placeholder="Nom de l'événement" />
            <input type="text" name="ville" placeholder="Ville" />
            <input type="date" name="date" placeholder="Date" />
            <button type="submit">Rechercher</button>
        </form>
    </section>

    <!-- Affichage des résultats de la recherche -->
    <section>
        <?= $resultatEvenements; ?>
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
</body>
</html>