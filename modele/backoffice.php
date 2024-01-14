<?php

function getTableUsers() {
    require('./modele/connectSQL.php'); //$pdo est défini dans ce fichier
    $sql = "SELECT id_utilisateur,nom,prenom,mail,age_,sexe,ville,estAdmin,estSuperAdmin FROM utilisateur";
    try {
        $stmt = $pdo->query($sql);
        $data = $stmt->fetchAll(PDO::FETCH_ASSOC);
        return $data;
    } catch (PDOException $e) {
        echo "Erreur lors de la récupération des données: " . $e->getMessage();
    }
}

function getTableSujet() {
    require('./modele/connectSQL.php'); //$pdo est défini dans ce fichier
    $sql = "SELECT * FROM sujet";
    try {
        $stmt = $pdo->query($sql);
        $data = $stmt->fetchAll(PDO::FETCH_ASSOC);
        return $data;
    } catch (PDOException $e) {
        echo "Erreur lors de la récupération des données: " . $e->getMessage();
    }
}

function getTableCapteur() {
    require('./modele/connectSQL.php'); //$pdo est défini dans ce fichier
    $sql = "SELECT * FROM capteur";
    try {
        $stmt = $pdo->query($sql);
        $data = $stmt->fetchAll(PDO::FETCH_ASSOC);
        return $data;
    } catch (PDOException $e) {
        echo "Erreur lors de la récupération des données: " . $e->getMessage();
    }
}

function getTableCapteurData() {
    require('./modele/connectSQL.php'); //$pdo est défini dans ce fichier
    $sql = "SELECT * FROM capteur_data";
    try {
        $stmt = $pdo->query($sql);
        $data = $stmt->fetchAll(PDO::FETCH_ASSOC);
        return $data;
    } catch (PDOException $e) {
        echo "Erreur lors de la récupération des données: " . $e->getMessage();
    }
}


function getTableMessage() {
    require('./modele/connectSQL.php'); //$pdo est défini dans ce fichier
    $sql = "SELECT * FROM message";
    try {
        $stmt = $pdo->query($sql);
        $data = $stmt->fetchAll(PDO::FETCH_ASSOC);
        return $data;
    } catch (PDOException $e) {
        echo "Erreur lors de la récupération des données: " . $e->getMessage();
    }
}

function deleteById($table, $idColumn, $id) {
    require('./modele/connectSQL.php'); // $pdo est défini dans ce fichier

    // Liste des tables et colonnes valides
    $validTables = ['utilisateur', 'sujet', 'capteur', 'capteur_data', 'message', 'evenement', 'etablissement'];
    $validColumns = ['id_utilisateur', 'id_sujet', 'id_capteur', 'id_capteur_data', 'id_message', 'id_evenement', 'id_etablissement'];

    // Vérifier si le nom de la table et de la colonne sont valides
    if (!in_array($table, $validTables) || !in_array($idColumn, $validColumns)) {
        echo "Nom de table ou de colonne invalide.";
        return;
    }

    // Construction de la requête SQL
    $sql = "DELETE FROM $table WHERE $idColumn = :id";

    try {
        $stmt = $pdo->prepare($sql);
        $stmt->bindParam(':id', $id, PDO::PARAM_INT);
        $stmt->execute();

        if ($stmt->rowCount() > 0) {
            echo("Élément supprimé avec succès.");
        } else {
            echo "Aucun élément trouvé avec cet ID dans la table $table.";
        }
    } catch (PDOException $e) {
        echo "Erreur lors de la suppression: " . $e->getMessage();
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