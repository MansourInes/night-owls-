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
            $msgAcc ="Erreur de saisie OU utilisateur inconnu";
            $url="./index.php?controle=accueil&action=accueil"; //redirection accueil
            header("Location:" . $url);
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