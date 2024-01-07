<?php
function ident() {
    $login = isset($_POST['cologin']) ? $_POST['cologin'] : '';
    $mdp = isset($_POST['comdp']) ? $_POST['comdp'] : '';
    $msgAcc = isset($_SESSION['msgAcc']) ? $_SESSION['msgAcc'] : '';

    if (count($_POST) == 0) {
        require("./vue/connexion/connexion.tpl");
    } else {
        require('./modele/utilisateurBD.php');
        header('Content-Type: application/json'); // Définit le type de contenu de la réponse une seule fois

        if (!verif_ident($login, $mdp)) {
            // Si les identifiants sont incorreacts, renvoyez un message d'erreur
            echo json_encode(["success" => false, "message" => "Erreur de saisie ou utilisateur inconnu, veuillez réessayer."]);
        } else { 
            // Si la connexion est réussie, renvoyez une confirmation et l'URL de redirection
            $_SESSION['login'] = $login;
            echo json_encode(["success" => true, "redirect" => "./index.php?controle=accueil&action=accueil"]);
        }
    }    
}
?>
