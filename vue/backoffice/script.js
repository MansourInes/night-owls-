document.addEventListener("DOMContentLoaded", function() {
    // Fonction appelée lorsque 'Utilisateurs' est sélectionné
    function handleUtilisateurs() {
        $.ajax({
            type: "GET",
            url: "./index.php?controle=backoffice&action=recupUsers",
             
            success: function(response) {
               console.log(response);
            },
            error: function(jqXHR, textStatus, errorThrown) {
                console.log("Erreur AJAX :", textStatus, errorThrown);
            }            
        });  
    }

    // Fonction appelée lorsque 'Évènements' est sélectionné
    function handleEvenements() {
        console.log("Option 'Évènements' sélectionnée");
        // Code spécifique pour 'Évènements'
    }

    // Fonction appelée lorsque 'Établissements' est sélectionné
    function handleEtablissements() {
        console.log("Option 'Établissements' sélectionnée");
        // Code spécifique pour 'Établissements'
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
