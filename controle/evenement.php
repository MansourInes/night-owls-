<?php
require_once './modele/evenementBD.php';

function afficherEvenements() {
    $modelEvenement = new EvenementModel();
    $evenements = $modelEvenement->recupererEvenements();

    require('./vue/evenement/evenement.tpl'); // Vue spécifique pour AJAX
}
function rechercher() {
    $date = $_GET['date'] ?? '';

    $modelEvenement = new EvenementModel('', $date);
    $resultatRecherche = $modelEvenement->rechercheEvenementsParDate();

    require("./vue/navbar/navbar.tpl");
    require('./vue/recherche/resultatsRecherche.tpl');
    require("./vue/footer/footer.tpl");
}

?>