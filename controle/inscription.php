<?php
function inscription() {
    $_SESSION['msgAcc'] = "";

    if (count($_POST) == 0) {
        require("./vue/inscription/inscription.tpl");
    } else {
        header('Content-Type: application/json'); // Définit le type de contenu de la réponse une seule fois

        $login = isset($_POST['silogin']) ? $_POST['silogin'] : '';
        $email = isset($_POST['siemail']) ? $_POST['siemail'] : '';
        $nom = isset($_POST['sinom']) ? $_POST['sinom'] : '';
        $prenom = isset($_POST['siprenom']) ? $_POST['siprenom'] : '';
        $age = isset($_POST['siage']) ? $_POST['siage'] : '';
        $sexe = isset($_POST['sisexe']) ? $_POST['sisexe'] : '';
        $ville = isset($_POST['siville']) ? $_POST['siville'] : '';
        $estAdmin = isset($_POST['siestAdmin']) ? $_POST['siestAdmin'] : '';
        $estSuperAdmin = isset($_POST['siestSuperAdmin']) ? $_POST['siestSuperAdmin'] : '';
        $mdp = isset($_POST['simotdepasse']) ? $_POST['simotdepasse'] : '';
        $mdp_hashed = password_hash($mdp, PASSWORD_BCRYPT);

        if (identExists($email)) {
            echo json_encode(["success" => false, "message" => "Le mail existe déjà, connectez vous."]);
        } else {
            signIn($login, $email, $nom, $prenom, $age, $sexe, $ville, $estAdmin, $estSuperAdmin, $mdp_hashed);
            verif_ident($email, $mdp);
            $_SESSION['login'] = $login;
            echo json_encode(["success" => true, "redirect" => "./index.php?controle=accueil&action=accueil"]);
        }
    }
}

function identExists($email) {
    require('./modele/utilisateurBD.php');
    return verifEmail($email);
}
?>
