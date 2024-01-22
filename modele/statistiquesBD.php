<?php
// Connexion à la base de données
require('./modele/connectSQL.php');

// Fonction pour obtenir les données d'un événement à partir de son ID
function getEventData($eventId) {
    global $pdo;
    $sql = "SELECT * FROM capteur_data WHERE id_capteur = (SELECT id_capteur FROM capteur WHERE id_evenement = :eventId)";
    try {
        $stmt = $pdo->prepare($sql);
        $stmt->bindParam(':eventId', $eventId, PDO::PARAM_INT);
        $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    } catch (PDOException $e) {
        return [];
    }
}

// Fonction pour obtenir tous les établissements depuis la base de données
function getAllEtablissements() {
    global $pdo;
    $sql = "SELECT * FROM etablissement";
    try {
        $stmt = $pdo->query($sql);
        $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    } catch (PDOException $e) {
        return $e;
    }
}

// Fonction pour obtenir tous les événements d'un établissement à partir de son ID
function getEvenementsByEtablissement($idEtablissement) {
    global $pdo;
    $sql = "SELECT * FROM evenement WHERE id_etablissement = :idEtablissement";
    try {
        $stmt = $pdo->prepare($sql);
        $stmt->bindParam(':idEtablissement', $idEtablissement, PDO::PARAM_INT);
        $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    } catch (PDOException $e) {
        // Gérer l'erreur ou renvoyer un tableau vide en cas d'erreur
        return [];
    }
}
?>
