<?php
// Inclusion des fichiers de modèle nécessaires
require_once './modele/etablissementBD.php';
require_once './modele/evenementBD.php';

// Vérification de la méthode de la requête et de l'action
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    if (isset($_GET['action']) && $_GET['action'] == 'ajouterEtablissement') {
        ajouterEtablissement();
    } elseif (isset($_GET['action']) && $_GET['action'] == 'ajouterEvenement') {
        ajouterEvenement();
    }
    exit;
}

// Fonction pour afficher le formulaire d'ajout
function afficherFormulaireAjout() {
    // Inclusion des éléments de la page (entête, formulaire, pied de page, etc.)
    require("./vue/navbar/navbar.tpl");
    include './vue/etablissement/etablissement.tpl'; // Assurez-vous que le chemin est correct
    require("./vue/footer/footer.tpl");
}

// Fonction pour ajouter un établissement
function ajouterEtablissement() {
    $capacite_max = $_POST['capacite_max'];
    $adresse = $_POST['adresse'];
    $nom_etablissement = $_POST['nom_etablissement']; // Ajout de la récupération du nom de l'établissement

    $model = new EtablissementModel();
    $resultat = $model->ajouterEtablissement($capacite_max, $nom_etablissement, $adresse,); // Modification de l'appel de la fonction

    if ($resultat === 'existe') {
        // Si l'établissement existe déjà, récupérez son ID et renvoyez un message
        $idEtablissementExistant = $model->getIdEtablissementParAdresse($nom_etablissement);
        echo json_encode(['success' => true, 'message' => 'L\'établissement existe déjà.', 'id_etablissement' => $idEtablissementExistant]);
    } elseif ($resultat) {
        // Si l'ajout de l'établissement est réussi, renvoyez un message de succès
        echo json_encode(['success' => true, 'message' => 'Enregistrement effectué avec succès.', 'id_etablissement' => $resultat]);
    } else {
        // En cas d'erreur lors de l'enregistrement, renvoyez un message d'erreur
        echo json_encode(['success' => false, 'message' => 'Erreur lors de l\'enregistrement.']);
    }
    exit;
}

// Fonction pour ajouter un événement
function ajouterEvenement() {
    $nom = $_POST['nom_evenement'];
    $date_evenement = $_POST['date_evenement'];
    $capacite_max = $_POST['capacite_max_evenement'];
    $id_etablissement = $_POST['id_etablissement'];

    $modelEvenement = new EvenementModel();
    $capaciteTotale = $modelEvenement->capaciteTotaleEvenements($id_etablissement, $date_evenement);

    $modelEtablissement = new EtablissementModel();
    $capaciteMaxEtablissement = $modelEtablissement->getCapaciteMax($id_etablissement);

    if ($capaciteTotale + $capacite_max > $capaciteMaxEtablissement) {
        // Vérifiez si la capacité maximale de l'établissement est dépassée
        echo json_encode(['success' => false, 'message' => 'La capacité maximale de l\'établissement est atteinte pour cette date. Veuillez choisir une autre date.']);
        exit;
    }
    
    // Insérez l'événement si la capacité n'est pas dépassée
    $resultat = $modelEvenement->ajouterEvenement($nom, $date_evenement, $capacite_max, $id_etablissement);
    if ($resultat) {
        echo json_encode(['success' => true, 'message' => 'Événement ajouté avec succès.']);
    } else {
        echo json_encode(['success' => false, 'message' => 'Erreur lors de l\'ajout de l\'événement.']);
    }
}

?>
