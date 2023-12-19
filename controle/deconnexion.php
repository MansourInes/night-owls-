<?php

function logOut(){
    session_destroy();
    $url="./index.php?controle=accueil&action=accueil"; //redirection accueil
    header("Location:" . $url);
}

?>