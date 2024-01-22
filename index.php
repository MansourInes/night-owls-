<?php
// Démarre une session PHP (si elle n'est pas déjà démarrée)
session_start();

// Récupère les valeurs des paramètres 'controle' et 'action' depuis la requête GET,
// ou les initialise à NULL si elles ne sont pas définies.
$controle = isset($_GET['controle']) ? $_GET['controle'] : NULL;
$action = isset($_GET['action']) ? $_GET['action'] : NULL;

// Vérifie si l'une ou les deux variables $controle et $action sont NULL
if ($controle == NULL || $action == NULL) {
    // Si l'une ou les deux variables sont NULL, inclut le fichier "./controle/accueil.php"
    require("./controle/accueil.php");

    // Appelle la fonction "accueil" du fichier inclus
    accueil();
} else {
    // Si les deux variables sont définies, construit le chemin du fichier à inclure
    $controleFilePath = "./controle/" . $controle . ".php";

    // Inclut le fichier de contrôle correspondant au "controle" spécifié
    require($controleFilePath);

    // Appelle la fonction correspondant à l'action spécifiée
    $action();
}
?>
