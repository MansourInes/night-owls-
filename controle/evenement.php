<?php
// Inclusion du fichier de modèle nécessaire
require_once './modele/evenementBD.php';

// Fonction pour afficher les événements
function afficherEvenements() {
    // Créez une instance du modèle des événements
    $modelEvenement = new EvenementModel();
    
    // Récupérez la liste des événements depuis le modèle
    $evenements = $modelEvenement->recupererEvenements();

    // Incluez la vue des événements (vue spécifique pour AJAX)
    require('./vue/evenement/evenement.tpl');
}

?>
