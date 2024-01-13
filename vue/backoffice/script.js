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
            for (var key in row) {
                table += '<td style="border: 1px solid black; padding: 8px;">' + row[key] + '</td>';
            }
            table += `<td class="delete-button-container" style="border: 1px solid black; padding: 8px;"><button onclick="deleteRow('${row.id_utilisateur}', this)">Supprimer</button></td>`;
            table += '</tr>';
        });

        table += '</table>';
        container.innerHTML = table;
    }

    // Fonction pour supprimer une ligne et envoyer une requête AJAX
    window.deleteRow = function(id, btn) {
        $.ajax({
            type: "POST",
            url: "./index.php?controle=backoffice&action=deleteRow", // Modifier l'URL selon le besoin
            data: { id: id },
            success: function(response) {
                // Supprime la ligne de la table après la confirmation du serveur
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

    // Fonction exécutée lors du changement d'option
    function onOptionChange(event) {
        
        switch (event.target.value) {
            case 'utilisateurs':
                handleUtilisateurs();
                break;
            case 'evenements':
                handleEvenements();
                break;
            case 'etablissements':
                handleEtablissements();
                break;
            default:
                console.log("Sélectionnez un tableau");
        }
    }

    // Attacher l'événement 'change' à l'élément select
    document.getElementById("tableau").addEventListener("change", onOptionChange);
});
