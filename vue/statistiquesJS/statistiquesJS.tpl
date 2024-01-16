<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="./vue/statistiquesJS/assets/style.css"/>
    <title>Statistiques</title>
</head>
<body>
    <div class="container-page">
        <div id="statsJS">
            <p class="invitation-message">Sélectionnez un établissement et un événement pour afficher des statistiques détaillées.</p>
            <div class="select-container">
                <select id="selectEtablissement">
                 <option value="">Choisir un établissement</option>
                <!-- Les options seront chargées par JS -->
                </select>
                <select id="selectEvenement">
                    <option value="">Choisir un événement</option>
                    <!-- Les options seront chargées par JS -->
                </select>
                <button id="btnLoadData" type="submit">Charger les données</button>
            </div>
            <div id="graph-container">
                <div class="graph-block">
                    <canvas id="eventGraph"></canvas>
                    <p id="conclusionEventGraph"></p> <!-- Conclusion pour le premier graphique -->
                </div>
            
                <div class="graph-block">
                    <canvas id="musicBarChart"></canvas>
                    <p id="conclusionMusicBarChart"></p> <!-- Conclusion pour le deuxième graphique -->
                </div>
            
                <div class="graph-block">
                    <canvas id="averageIntensityChart"></canvas>
                    <p id="conclusionAverageIntensityChart"></p> <!-- Conclusion pour le troisième graphique -->
                </div>
            </div>      
        </div>
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
     <!-- Ajoutez ici le lien vers jQuery si vous ne l'avez pas déjà dans votre projet -->
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
     <!-- Ajoutez ici le lien vers votre fichier JS -->
     <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
     <script src="./vue/statistiquesJS/assets/script.js"></script>
     <script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-datalabels@2.0.0"></script>
</body>
</html>
