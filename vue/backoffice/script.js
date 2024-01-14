document.addEventListener("DOMContentLoaded", function() {
    // Fonction pour créer un tableau à partir des données JSON
    function createTable(data, containerId) {
        var container = document.getElementById(containerId);
        var table = '<table style="width:100%; border-collapse: collapse;">';
        table += '<tr>';
        for (var key in data[0]) {
            table += '<th style="border: 1px solid black; padding: 8px;">' + key + '</th>';
        }
        table += '<th style="border: 1px solid black; padding: 8px;">Actions</th>';
        table += '</tr>';

        data.forEach(function(row) {
            table += '<tr>';
            var firstKey = Object.keys(row)[0]; // Première clé de l'objet (nom de la colonne ID)
            var idValue = row[firstKey];       // Valeur de l'ID
        
            for (var key in row) {
                table += '<td style="border: 1px solid black; padding: 8px;">' + row[key] + '</td>';
            }
        
            var tableName = document.getElementById("tableau").value;
            table += `<td class="delete-button-container" style="border: 1px solid black; padding: 8px;"><button onclick="deleteRow('${tableName}', '${firstKey}', '${idValue}', this)">Supprimer</button></td>`;
            table += '</tr>';
        });

        table += '</table>';
        container.innerHTML = table;
    }

    window.deleteRow = function(tableName, idColumnName, id, btn) {
        $.ajax({
            type: "POST",
            url: "./index.php?controle=backoffice&action=deleteRow",
            data: { table: tableName, idColumn: idColumnName, id: id },
            success: function(response) {
                console.log(response);
                var row = btn.parentNode.parentNode;
                row.parentNode.removeChild(row);
            },
            error: function(jqXHR, textStatus, errorThrown) {
                console.log("Erreur AJAX :", textStatus, errorThrown);
            }
        });
    }

    // Fonction pour gérer les utilisateurs
    function handleUtilisateurs() {
        $.ajax({
            type: "GET",
            url: "./index.php?controle=backoffice&action=recupUsers",
            success: function(response) {
                createTable(response, 'resultatTableau');
            },
            error: function(jqXHR, textStatus, errorThrown) {
                console.log("Erreur AJAX :", textStatus, errorThrown);
            }
        });
    }

    // Fonction pour gérer les évènements
    function handleEvenements() {
        $.ajax({
            type: "GET",
            url: "./index.php?controle=backoffice&action=recupEvents",
            success: function(response) {
                createTable(response, 'resultatTableau');
            },
            error: function(jqXHR, textStatus, errorThrown) {
                console.log("Erreur AJAX :", textStatus, errorThrown);
            }
        });
    }

    // Fonction pour gérer les établissements
    function handleEtablissements() {
        $.ajax({
            type: "GET",
            url: "./index.php?controle=backoffice&action=recupBuilds",
            success: function(response) {
                createTable(response, 'resultatTableau');
            },
            error: function(jqXHR, textStatus, errorThrown) {
                console.log("Erreur AJAX :", textStatus, errorThrown);
            }
        });
    }

    function handleSujet() {
        $.ajax({
            type: "GET",
            url: "./index.php?controle=backoffice&action=recupSujet",
            success: function(response) {
                createTable(response, 'resultatTableau');
            },
            error: function(jqXHR, textStatus, errorThrown) {
                console.log("Erreur AJAX :", textStatus, errorThrown);
            }
        });
    }

    function handleMessage() {
        $.ajax({
            type: "GET",
            url: "./index.php?controle=backoffice&action=recupMessage",
            success: function(response) {
                createTable(response, 'resultatTableau');
            },
            error: function(jqXHR, textStatus, errorThrown) {
                console.log("Erreur AJAX :", textStatus, errorThrown);
            }
        });
    }
    function handleCapteurs() {
        $.ajax({
            type: "GET",
            url: "./index.php?controle=backoffice&action=recupCapteur",
            success: function(response) {
                createTable(response, 'resultatTableau');
            },
            error: function(jqXHR, textStatus, errorThrown) {
                console.log("Erreur AJAX :", textStatus, errorThrown);
            }
        });
    }
    function handleCapteursData() {
        $.ajax({
            type: "GET",
            url: "./index.php?controle=backoffice&action=recupCapteurData",
            success: function(response) {
                createTable(response, 'resultatTableau');
            },
            error: function(jqXHR, textStatus, errorThrown) {
                console.log("Erreur AJAX :", textStatus, errorThrown);
            }
        });
    }

    // Fonction exécutée lors du changement d'option
    function onOptionChange(event) {
        
        switch (event.target.value) {
            case 'utilisateur':
                handleUtilisateurs();
                break;
            case 'evenement':
                handleEvenements();
                break;
            case 'etablissement':
                handleEtablissements();
                break;
            case 'sujet':
                handleSujet();
                break;
            case 'message':
                handleMessage();
                break;
            case 'capteur':
                handleCapteurs();
                break; 
            case 'capteur_data':
                handleCapteursData();
                break;           
            default:
            alert("Sélectionnez un tableau");
        }
    }

    // Attacher l'événement 'change' à l'élément select
    document.getElementById("tableau").addEventListener("change", onOptionChange);
});
