<?php
require_once './modele/evenementBD.php';

function afficherEvenements() {
    $modelEvenement = new EvenementModel();
    $evenements = $modelEvenement->recupererEvenements();

    require('./vue/evenement/evenement.tpl'); // Vue spécifique pour AJAX
}

?>