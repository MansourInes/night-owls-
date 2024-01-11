<?php

function backoffice(){
    require("./controle/function.php");
    require("./vue/navbar/navbar.tpl");
    require("./vue/backoffice/backoffice.tpl");
    require("./vue/footer/footer.tpl");
}


function recupUsers(){
    require("./modele/backoffice.php");
    header('Content-Type: application/json');
    echo (json_encode(getTableUsers()));
    
    
}

function recupEvents(){
    require("./modele/backoffice.php");
    header('Content-Type: application/json');
    echo (json_encode(getTableEvents()));
    
}

function recupBuilds(){
    require("./modele/backoffice.php");
    header('Content-Type: application/json');
    echo (json_encode(getTableBuilds()));
    
}


?>