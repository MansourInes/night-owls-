<?php
// Définition des paramètres de la base de données
$hostname = "localhost";
$base = "app";
$loginBD = "root";
$passBD = "";

try {
    // DSN (Data Source Name) pour se connecter à MySQL
    $dsn = "mysql:host=$hostname;dbname=$base";
    
    // Création d'une instance de la classe PDO pour la connexion à la base de données
    $pdo = new PDO($dsn, $loginBD, $passBD, array(PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES utf8"));
    
    // Configuration pour afficher les erreurs et lancer des exceptions en cas d'erreur
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    
    // La connexion à la base de données a réussi
    // Vous pouvez ajouter d'autres opérations à effectuer ici si nécessaire
    // echo "Connexion au DSN: ".$dsn." OK! </br>";
} catch (PDOException $e) {
    // En cas d'échec de connexion, affiche le message d'erreur associé à l'exception
    echo utf8_encode("Echec de connexion : " . $e->getMessage() . "\n");
    die(); // Arrête l'exécution du script en cas d'échec de connexion.
}
?>
