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

function deleteUserById($id) {
    require('./modele/connectSQL.php'); // $pdo est défini dans ce fichier

    // Préparation de la requête SQL pour éviter les injections SQL
    $sql = "DELETE FROM utilisateur WHERE id_utilisateur = :id";

    try {
        $stmt = $pdo->prepare($sql);
        $stmt->bindParam(':id', $id);

        // Exécution de la requête
        $stmt->execute();

        // Vous pouvez ajouter des actions supplémentaires ici, par exemple,
        // vérifier si l'utilisateur a bien été supprimé, etc.
        if ($stmt->rowCount() > 0) {
            echo("Utilisateur supprimé avec succès.");
        } else {
            echo "$sql . Aucun utilisateur trouvé avec cet ID.";
        }
    } catch (PDOException $e) {
        echo "Erreur lors de la suppression de l'utilisateur: " . $e->getMessage();
    }
}


function getTableEvents() {
    require('./modele/connectSQL.php'); //$pdo est défini dans ce fichier
    $sql = "SELECT * FROM evenement";
    try {
        $stmt = $pdo->query($sql);
        $data = $stmt->fetchAll(PDO::FETCH_ASSOC);
        return $data;
    } catch (PDOException $e) {
        echo "Erreur lors de la récupération des données: " . $e->getMessage();
    }
}

function getTableBuilds() {
    require('./modele/connectSQL.php'); //$pdo est défini dans ce fichier
    $sql = "SELECT * FROM etablissement";
    try {
        $stmt = $pdo->query($sql);
        $data = $stmt->fetchAll(PDO::FETCH_ASSOC);
        return $data;
    } catch (PDOException $e) {
        echo "Erreur lors de la récupération des données: " . $e->getMessage();
    }
}



?>