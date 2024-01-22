<?php

require('./modele/statistiquesBD.php');

// Fonction principale pour la page de statistiques
function statistiques(){
    require("./controle/function.php");
    require("./vue/navbar/navbar.tpl");
    require("./vue/statistiquesJS/statistiquesJS.tpl");
    require("./vue/footer/footer.tpl");
}

// Fonction de contrôle pour récupérer les données d'un événement
function controleGetEventdata() {
    $eventId = $_GET['eventId'];  
    $data = getEventData($eventId);
    echo json_encode($data);
}

// Fonction de contrôle pour récupérer tous les établissements
function controleGetAllEtablissements() {
    $etablissements = getAllEtablissements(); // Appel de la fonction du modèle
    echo json_encode($etablissements); // Envoyer les données au format JSON
}

// Fonction de contrôle pour récupérer les événements par établissement
function controleGetEvenementsByEtablissement() {
    $idEtablissement = isset($_GET['idEtablissement']) ? intval($_GET['idEtablissement']) : 0;
    $evenements = getEvenementsByEtablissement($idEtablissement); // Appel de la fonction du modèle
    echo json_encode($evenements); // Envoyer les données au format JSON
}

?>
