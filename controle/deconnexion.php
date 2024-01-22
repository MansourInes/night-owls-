<?php

function logOut(){
    session_destroy(); //détruit la variable session
    $url="./index.php?controle=accueil&action=accueil"; //redirection accueil
    header("Location:" . $url);
}

?>