<?php
require_once './modele/etablissementBD.php';
require_once './modele/evenementBD.php';
// Vérifiez la méthode de la requête et l'action
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    if (isset($_GET['action']) && $_GET['action'] == 'ajouterEtablissement') {
        ajouterEtablissement();
    } elseif (isset($_GET['action']) && $_GET['action'] == 'ajouterEvenement') {
        ajouterEvenement();
    }
    exit;
}
function afficherFormulaireAjout() {
    require("./vue/navbar/navbar.tpl");
    include './vue/etablissement/etablissement.tpl'; // Assurez-vous que le chemin est correct
    require("./vue/footer/footer.tpl");
}
function ajouterEtablissement() {
    $capacite_max = $_POST['capacite_max'];
    $adresse = $_POST['adresse'];

    $model = new EtablissementModel();
    $resultat = $model->ajouterEtablissement($capacite_max, $adresse);

    if ($resultat === 'existe') {
        // Récupérer et renvoyer l'ID de l'établissement existant
        $idEtablissementExistant = $model->getIdEtablissementParAdresse($adresse);
        echo json_encode(['success' => true, 'message' => 'L\'établissement existe déjà.', 'id_etablissement' => $idEtablissementExistant]);
    } elseif ($resultat) {
        echo json_encode(['success' => true, 'message' => 'Enregistrement effectué avec succès.', 'id_etablissement' => $resultat]);
    } else {
        echo json_encode(['success' => false, 'message' => 'Erreur lors de l\'enregistrement.']);
    }
    exit;
}

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


