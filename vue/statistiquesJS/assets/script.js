$(document).ready(function() {
    // Charger les établissements au démarrage
    loadEtablissements();

    // Gestionnaire de changement pour le premier select
    $('#selectEtablissement').change(function() {
        var idEtablissement = $(this).val();
        if (idEtablissement) {
            loadEvenements(idEtablissement);
        }
    });

    // Gestionnaire de clic pour le bouton
    $('#btnLoadData').click(function() {
        var idEvenement = $('#selectEvenement').val();
        if (idEvenement) {
            // Ici, vous pouvez appeler une fonction qui chargera les données de l'événement sélectionné
            loadDataForEvenement(idEvenement);
        } else {
            alert('Veuillez choisir un événement.');
        }
    });

    // Fonction pour charger les établissements
    function loadEtablissements() {
        $.ajax({
            url: './index.php?controle=statistiquesJS&action=controleGetAllEtablissements',
            type: 'GET',
            dataType: 'json',
            success: function(data) {
                var select = $('#selectEtablissement');
                select.empty().append('<option value="">Choisir un établissement</option>');
                data.forEach(function(etablissement) {
                    select.append('<option value="' + etablissement.id_etablissement + '">' + etablissement.nom + '</option>');
});
}
});
}
    // Fonction pour charger les événements en fonction de l'établissement sélectionné
    // Fonction pour charger les événements en fonction de l'établissement sélectionné
function loadEvenements(idEtablissement) {
    $.ajax({
        url: './index.php?controle=statistiquesJS&action=controleGetEvenementsByEtablissement&idEtablissement=' + idEtablissement,
        type: 'GET',
        dataType: 'json',
        success: function(data) {
            var select = $('#selectEvenement');
            data.forEach(function(evenement) {
                select.append('<option value="' + evenement.id_evenement + '">' + evenement.nom + '</option>');
            });
        }
    });
}
var currentChart1;
var currentChart2;
var currentChart3;
// Fonction pour charger les données pour un événement sélectionné
function loadDataForEvenement(idEvenement) {

    // Obtenez une référence à l'élément canvas
    // Ici, vous pouvez faire une requête AJAX pour récupérer les données de l'événement
    // et ensuite les utiliser pour afficher un graphique ou autre
    $.ajax({
        url: './index.php?controle=statistiquesJS&action=controleGetEventdata&eventId=' + idEvenement,
        type: 'GET',
        dataType: 'json',
        success: function(data) {
            console.log(data);
            var labels = data.map(function(item) {
                return item.date_data;
            });

            var intensiteSonoreData = data.map(function(item) {
                return item.intensite_sonore;
            });
            if (currentChart1) {
                currentChart1.destroy();
            }

            var ctx = document.getElementById('eventGraph').getContext('2d');
            currentChart1 = new Chart(ctx, {
                type: 'line',
                data: {
                    labels: labels,
                    datasets: [{
                        label: 'Intensité sonore (dB)',
                        data: intensiteSonoreData,
                        fill: false,
                        borderColor: 'blue',
                        tension: 0.1
                    }]
                },
                options: {
                    scales: {
                        y: {
                            beginAtZero: true
                        }
                    }
                }
            });

            createMusicBarChart(data);
            createAverageIntensityChart(data);
        }
    });
}

function createMusicBarChart(data) {
    // Compter les occurrences de chaque musique
    var musicCounts = {};
    data.forEach(function(item) {
        if (!musicCounts[item.musique]) {
            musicCounts[item.musique] = 0;
        }
        musicCounts[item.musique]++;
    });

    // Calculer la somme totale des occurrences
    var totalOccurrences = Object.values(musicCounts).reduce((sum, current) => sum + current, 0);

    // Préparer les données pour le graphique en barres avec pourcentage
    var barLabels = Object.keys(musicCounts);
    var barData = Object.values(musicCounts).map(count => (count / totalOccurrences * 100).toFixed(2)); // Convertir en pourcentage

    // Tri des musiques par pourcentage décroissant
    var sortedIndices = barData.map((percentage, index) => ({ percentage, index }))
                               .sort((a, b) => b.percentage - a.percentage)
                               .map(data => data.index);

    var sortedLabels = sortedIndices.map(index => barLabels[index]);
    var sortedData = sortedIndices.map(index => barData[index]);

    if (currentChart2) {
        currentChart2.destroy();
    }

    var barCtx = document.getElementById('musicBarChart').getContext('2d');
    currentChart2 = new Chart(barCtx, {
        type: 'bar',
        data: {
            labels: sortedLabels,
            datasets: [{
                label: 'Pourcentage de fois jouée',
                data: sortedData,
                backgroundColor: [
                    // Ajoutez autant de couleurs que nécessaire ici
                    'red', 'orange', 'yellow', 'green', 'blue', 'indigo', 'violet'
                ]
            }]
        },
        options: {
            indexAxis: 'y', // Cela rendra le graphique horizontal
            responsive: true,
            plugins: {
                legend: {
                    position: 'right', // Position de la légende
                },
                title: {
                    display: true,
                    text: 'Graphique en barres par musique'
                }
            },
            scales: {
                x: {
                    beginAtZero: true,
                    title: {
                        display: true,
                        text: '%TG Somme de Nombre' // Titre de l'axe des X
                    },
                    ticks: {
                        callback: function(value) {
                            return value + "%"; // Ajouter le symbole pourcentage sur l'axe des X
                        }
                    }
                }
            },
            tooltips: {
                callbacks: {
                    label: function(tooltipItem) {
                        return tooltipItem.xLabel + '%'; // Ajouter le symbole pourcentage dans les bulles d'aide
                    }
                }
            }
        }
    });
}

function createAverageIntensityChart(data) {
    // Calculer la moyenne des intensités sonores pour chaque musique
    var intensitySums = {};
    var intensityCounts = {};
    
    data.forEach(function(item) {
        if (!intensitySums[item.musique]) {
            intensitySums[item.musique] = 0;
            intensityCounts[item.musique] = 0;
        }
        intensitySums[item.musique] += parseInt(item.intensite_sonore, 10);
        intensityCounts[item.musique]++;
    });
    
    var averageIntensities = Object.keys(intensitySums).map(function(musique) {
        return {
            musique: musique,
            averageIntensity: (intensitySums[musique] / intensityCounts[musique]).toFixed(2)
        };
    });

    // Trier par intensité sonore moyenne décroissante et prendre les 15 premières
    averageIntensities.sort(function(a, b) {
        return b.averageIntensity - a.averageIntensity;
    });

    var topMusiques = averageIntensities.slice(0, 10);
    
    // Préparer les données pour le graphique à barres
    var barLabels = topMusiques.map(function(item) {
        return item.musique;
    });
    var barData = topMusiques.map(function(item) {
        return item.averageIntensity;
    });

    if (currentChart3) {
        currentChart3.destroy();
    }
    var ctx = document.getElementById('averageIntensityChart').getContext('2d');
    currentChart3 = new Chart(ctx, {
        type: 'bar',
        data: {
            labels: barLabels,
            datasets: [{
                label: 'Intensité sonore moyenne (dB)',
                data: barData,
                backgroundColor: 'rgba(54, 162, 235, 0.2)',
                borderColor: 'rgba(54, 162, 235, 1)',
                borderWidth: 1
            }]
        },
        options: {
            scales: {
                y: {
                    beginAtZero: true
                }
            },
            plugins: {
                legend: {
                    display: false
                },
                datalabels: {
                    display: true,
                    align: 'end',
                    anchor: 'end',
                    formatter: function(value, context) {
                        return value + ' dB';
                    }
                }
            },
            responsive: true,
            maintainAspectRatio: false
        },
        plugins: [ChartDataLabels] // Assurez-vous d'avoir importé le plugin ChartDataLabels
    });
}



});