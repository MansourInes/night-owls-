<?php
function ident() {
    // Récupération des valeurs du formulaire (login et mot de passe) depuis les données POST
    $login = isset($_POST['cologin']) ? $_POST['cologin'] : '';
    $mdp = isset($_POST['comdp']) ? $_POST['comdp'] : '';
    $msgAcc = isset($_SESSION['msgAcc']) ? $_SESSION['msgAcc'] : '';

    // Vérification si des données POST ont été soumises
    if (count($_POST) == 0) {
        // Si aucune donnée POST n'est présente, affiche le formulaire de connexion
        require("./vue/connexion/connexion.tpl");
    } else {
        // Si des données POST sont présentes, inclut le fichier 'utilisateurBD.php'
        require('./modele/utilisateurBD.php');
        
        // Définit le type de contenu de la réponse HTTP comme JSON
        header('Content-Type: application/json');

        // Vérification des identifiants de connexion en utilisant la fonction 'verif_ident'
        if (!verif_ident($login, $mdp)) {
            // Si les identifiants sont incorrects, renvoie un message d'erreur au format JSON
            echo json_encode(["success" => false, "message" => "Erreur de saisie ou utilisateur inconnu, veuillez réessayer."]);
        } else { 
            // Si la connexion est réussie, enregistre le nom d'utilisateur dans une session
            $_SESSION['login'] = $login;
            
            // Renvoie une confirmation de succès au format JSON avec l'URL de redirection vers la page d'accueil
            echo json_encode(["success" => true, "redirect" => "./index.php?controle=accueil&action=accueil"]);
        }
    }    
}
?>
