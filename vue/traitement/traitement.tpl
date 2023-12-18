<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./vue/traitement/assets/style.css">
    <title>Test</title>
</head>
<body>
    <div class="container-page">
        <div class="page">
            <div id="traiterParent">
                <button class="btn" id="traiter">Cliquer pour traiter</button>
            </div>
            <div class="diagramme">
                <div class="graphique">
                    <h2 class="title">Fréquences obtenues</h2>
                    <img src="./vue/img/traitement/Graphiques-en-cascades-Power-BI-1024x589.png" alt="">
                    <p>Diagramme représentant les fréquences sonores</p>
                </div>
                <div class="legend">
                    <div class="fils-legend">
                        <button class="legend-humaines"></button>
                        <p class="name-legend">ambiance humaine</p>
                    </div>
                    <div class="fils-legend">
                        <button class="legend-musical"></button>
                        <p class="name-legend">ambiance musicale</p>
                    </div>
                </div>
            </div>
            <div id="diagramme2" class="diagramme">
                <div class="graphique">
                    <img src="./vue/img/traitement/Graphiques-en-cascades-Power-BI-1024x589.png" alt="">
                </div>
                <div id="legend2" class="legend">
                    <button class="btn">Mesurer la qualité</button>
                    <button class="btn">Mesure de consommation</button>
                    <button class="btn">Puissance sonore</button>
                </div>
            </div>
            <div class="conclusion">
                <h2>Conclusion</h2>
                <p class="texte-conclusion">
                    Le niveau d'affluence était le plus élever au moment T sur la chanson X.
                </p>
            </div>
        </div>
    </div>
</body>
</html>