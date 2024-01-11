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
    //return json_encode(getTableUsers());
    $json = '[
        {
            "id": 1,
            "nom": "Jean Dupont",
            "email": "jean.dupont@example.com"
        },
        {
            "id": 2,
            "nom": "Marie Curie",
            "email": "marie.curie@example.com"
        },
        {
            "id": 3,
            "nom": "Henri Poincaré",
            "email": "henri.poincare@example.com"
        }
    ]';
    return ($json);
    
}

?>