<?php
session_start();
$controle = isset($_GET['controle'])?($_GET['controle']):NULL;
$action = isset($_GET['action'])?($_GET['action']):NULL;
// var_dump($controle);
// var_dump($action);
if($controle == NULL || $action == NULL){
    require(("./controle/accueil.php"));
    accueil();
}
else {
    require ("./controle/" . $controle . ".php");
    $action();
}
?>