<?php

// Fonction d'inscription
function inscription() {
    $_SESSION['msgAcc'] = "";

    // Vérifie si des données POST ont été envoyées
    if (count($_POST) == 0) {
        require("./vue/inscription/inscription.tpl");
    } else {
        header('Content-Type: application/json'); // Définit le type de contenu de la réponse une seule fois

        // Récupère les données POST
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

        // Vérifie si l'identifiant existe déjà dans la base de données
        if (identExists($email)) {
            echo json_encode(["success" => false, "message" => "Le mail existe déjà, connectez-vous."]);
        } else {
            // Vous pouvez appeler la fonction d'envoi d'email ici, assurez-vous que la configuration SMTP est correcte
            // envoyerEmail($email);

            // Appelle la fonction pour enregistrer l'utilisateur
            signIn($login, $email, $nom, $prenom, $age, $sexe, $ville, $estAdmin, $estSuperAdmin, $mdp_hashed);

            // Vérifie l'identité de l'utilisateur nouvellement inscrit
            verif_ident($email, $mdp);

            // Stocke le login dans la session
            $_SESSION['login'] = $login;

            // Renvoie une réponse JSON en cas de succès
            echo json_encode(["success" => true, "redirect" => "./index.php?controle=accueil&action=accueil"]);
        }
    }
}

// Fonction pour vérifier si l'identifiant existe déjà
function identExists($email) {
    require('./modele/utilisateurBD.php');
    return verifEmail($email);
}

// Fonction pour envoyer un email de bienvenue (à configurer correctement)
function envoyerEmail($to) {
    // Pour envoyer un mail HTML, l'en-tête Content-type doit être défini
    $headers = "MIME-Version: 1.0" . "\r\n";
    $headers .= "Content-type:text/html;charset=UTF-8" . "\r\n";

    // En-têtes additionnels
    $headers .= 'From: <night.owls.isep@gmail.com>' . "\r\n";

    $subject = "Bienvenue sur Night Owls";

    // Contenu de l'email
    $message = "
    <html>
    <body>
        <h1>Bienvenue sur Night Owls !</h1>
        <p>Bonjour et bienvenue dans la communauté Night Owls, votre destination numéro un pour découvrir et profiter des meilleurs événements de boîte de nuit.</p>
        <p>Nous sommes ravis de vous avoir parmi nous ! Vous trouverez sur notre site les dernières informations sur les événements nocturnes les plus chauds, ainsi que des analyses et des statistiques exclusives sur la scène musicale.</p>
        <p><img src='https://gabrielestevesdev.github.io/mail.png' alt='Image de Bienvenue'></p>
        <p>Restez connecté pour des mises à jour régulières sur les événements à venir, et n'hésitez pas à partager vos expériences et vos avis avec notre communauté.</p>
        <p>Merci de nous rejoindre et préparez-vous à vivre des nuits inoubliables avec Night Owls !</p>
        <p>Cordialement,</p>
        <p>L'équipe Night Owls</p>
        <p><img src='https://gabrielestevesdev.github.io/logo.jpeg' alt='Logo Night owls'></p>
    </body>
    </html>";

    mail($to, $subject, $message, $headers);
}

?>
