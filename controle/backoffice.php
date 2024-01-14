<?php

function backoffice(){
    require("./controle/function.php");
    require("./vue/navbar/navbar.tpl");
    require("./vue/backoffice/backoffice.tpl");
    require("./vue/footer/footer.tpl");
}

function deleterow() {
    $id = isset($_POST['id']) ? $_POST['id'] : '';
    $table = isset($_POST['table']) ? $_POST['table'] : '';
    $idColumn = isset($_POST['idColumn']) ? $_POST['idColumn'] : 'id'; // 'id' par défaut

    if (empty($id) || empty($table)) {
        echo "Erreur : ID ou nom de la table manquant.";
        return;
    }

    require("./modele/backoffice.php");
    deleteById($table, $idColumn, $id);
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

function recupMessage(){
    require("./modele/backoffice.php");
    header('Content-Type: application/json');
    echo (json_encode(getTableMessage()));
    
}

function recupSujet(){
    require("./modele/backoffice.php");
    header('Content-Type: application/json');
    echo (json_encode(getTableSujet()));
    
}

function recupBuilds(){
    require("./modele/backoffice.php");
    header('Content-Type: application/json');
    echo (json_encode(getTableBuilds()));
}

function recupCapteur(){
    require("./modele/backoffice.php");
    header('Content-Type: application/json');
    echo (json_encode(getTableCapteur()));
}

function recupCapteurData(){
    require("./modele/backoffice.php");
    header('Content-Type: application/json');
    echo (json_encode(getTableCapteurData()));
}

?>