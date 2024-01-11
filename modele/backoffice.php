<?php

function getTableUsers() {
    require('./modele/connectSQL.php'); //$pdo est défini dans ce fichier
    $sql = "SELECT * FROM utilisateur";
    try {
        $stmt = $pdo->query($sql);
        $data = $stmt->fetchAll(PDO::FETCH_ASSOC);
        return $data;
    } catch (PDOException $e) {
        echo "Erreur lors de la récupération des données: " . $e->getMessage();
    }
}

?>