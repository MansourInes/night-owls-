<?php
require('./modele/connectSQL.php'); // Assurez-vous que ce fichier existe et qu'il contient les informations de connexion à la base de données.

// Fonction pour obtenir tous les sujets depuis la base de données
function getAllTopicsBD() {
    global $pdo;
    $sql = "SELECT sujet.*, utilisateur.prenom AS prenom, utilisateur.nom as nom,  
                   (SELECT contenu FROM message WHERE message.id_sujet = sujet.id_sujet ORDER BY date_creation ASC LIMIT 1) AS first_message 
            FROM sujet 
            JOIN utilisateur ON sujet.id_utilisateur = utilisateur.id_utilisateur";
    try {
        $stmt = $pdo->query($sql);
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    } catch (PDOException $e) {
        return [];
    }
}

// Fonction pour obtenir des informations spécifiques sur un sujet à partir de son ID depuis la base de données
function getInfoSpecificTopicBD($topicID) {
    global $pdo;
    $sql = "SELECT sujet.titre as titre, sujet.date_creation, utilisateur.prenom AS prenom, utilisateur.nom as nom FROM sujet INNER JOIN utilisateur ON sujet.id_utilisateur = utilisateur.id_utilisateur WHERE sujet.id_sujet = :topicID";
    try {
        $stmt = $pdo->prepare($sql); // Utilisez prepare() au lieu de query()
        $stmt->bindParam(':topicID', $topicID, PDO::PARAM_INT);
        $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    } catch (PDOException $e) {
        return [];
    }
}

// Fonction pour obtenir tous les messages d'un sujet depuis la base de données
function getMessagesByTopicBD($topicId) {
    global $pdo;
    $sql = "SELECT message.*, utilisateur.prenom AS prenom, utilisateur.nom as nom
    FROM message JOIN utilisateur ON message.id_utilisateur = utilisateur.id_utilisateur
    WHERE id_sujet = :topicId";
    try {
        $stmt = $pdo->prepare($sql);
        $stmt->bindParam(':topicId', $topicId, PDO::PARAM_INT);
        $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    } catch (PDOException $e) {
        return [];
    }
}

// Fonction pour créer un nouveau sujet dans la base de données
function createTopicBD($title, $userId) {
    global $pdo;

    // Définir le fuseau horaire à celui de la France (par exemple, Paris)
    date_default_timezone_set('Europe/Paris');

    // Obtenir la date et l'heure actuelles
    $now = new DateTime();
    $formattedDateTime = $now->format('Y-m-d H:i:s'); // Format MySQL

    $sql = "INSERT INTO sujet (titre, id_utilisateur, date_creation) VALUES (:title, :userId, :dateCreation)";
    try {
        $stmt = $pdo->prepare($sql);
        $stmt->bindParam(':title', $title);
        $stmt->bindParam(':userId', $userId);
        $stmt->bindParam(':dateCreation', $formattedDateTime);
        $stmt->execute();
        return $pdo->lastInsertId();
    } catch (PDOException $e) {
        return false;
    }
}

// Fonction pour poster un message dans un sujet dans la base de données
function postMessageBD($topicId, $userId, $content) {
    global $pdo;

    //Définir le fuseau horaire à celui de la France (par exemple, Paris)
    date_default_timezone_set('Europe/Paris');

    // Obtenir la date et l'heure actuelles
    $now = new DateTime();
    $formattedDateTime = $now->format('Y-m-d H:i:s'); // Format MySQL

    $sql = "INSERT INTO message (contenu, id_utilisateur, id_sujet, date_creation) VALUES (:content, :userId, :topicId, :dateCreation)";
    try {
        $stmt = $pdo->prepare($sql);
        $stmt->bindParam(':content', $content);
        $stmt->bindParam(':userId', $userId);
        $stmt->bindParam(':topicId', $topicId);
        $stmt->bindParam(':dateCreation', $formattedDateTime);
        $stmt->execute();
        return true;
    } catch (PDOException $e) {
        return false;
    }
}
?>
