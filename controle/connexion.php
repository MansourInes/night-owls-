<?php
   function ident(){
    $login =  isset($_POST['cologin'])?($_POST['cologin']):'';
    $mdp =  isset($_POST['comdp'])?($_POST['comdp']):'';
    $msg = '';
    $msgAcc = isset($_SESSION['msgAcc'])?($_SESSION['msgAcc']):'';

    if(count($_POST)==0) {
        require ("./vue/connexion/connexion.tpl");
    }
    else {
        require('./modele/utilisateurBD.php');
        if(!verif_ident($login,$mdp)) {
            $msg ="Erreur de saisie OU utilisateur inconnu";
            echo("Erreur de saisie OU utilisateur inconnu");
            require ("./vue/connexion/connexion.tpl");
        }
        else { 
            $msg = "Vous êtes connectés";
            $_SESSION['login'] = $login;
            $url="./index.php?controle=accueil&action=accueil"; //redirection accueil
            header("Location:" . $url);
        }
    }	
}
?>