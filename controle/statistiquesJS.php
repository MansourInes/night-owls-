
<?php
require('./modele/statistiquesBD.php');

function statistiques(){
    require("./controle/function.php");
    require("./vue/navbar/navbar.tpl");
    require("./vue/statistiquesJS/statistiquesJS.tpl");
    require("./vue/footer/footer.tpl");
}


function controleGetEventdata() {
    $eventId = $_GET['eventId'];  
    $data = getEventData($eventId);
    echo json_encode($data);
}
// Inclure le fichier du modèle si nécessaire, par exemple :
// require_once('chemin/vers/le/fichier/modele.php');

function controleGetAllEtablissements() {
    $etablissements = getAllEtablissements(); // Appel de la fonction du modèle
    echo json_encode($etablissements); // Envoyer les données au format JSON
}

function controleGetEvenementsByEtablissement() {
    $idEtablissement = isset($_GET['idEtablissement']) ? intval($_GET['idEtablissement']) : 0;
    $evenements = getEvenementsByEtablissement($idEtablissement); // Appel de la fonction du modèle
    echo json_encode($evenements); // Envoyer les données au format JSON
}
?>
