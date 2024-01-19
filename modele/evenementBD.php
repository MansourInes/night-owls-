<?php
require 'connectSQL.php'; // Assurez-vous que le chemin est correct

class EvenementModel {
   
    // Méthode pour ajouter un événement
    public function ajouterEvenement($nom, $date_evenement, $capacite_max, $id_etablissement) {
        global $pdo;

        try {
            // Préparation de la requête SQL pour insérer un nouvel événement
            $sql = "INSERT INTO evenement (nom, date_evenement, capacite_max, id_etablissement) VALUES (:nom, :date_evenement, :capacite_max, :id_etablissement)";
            $stmt = $pdo->prepare($sql);
            
            // Liaison des paramètres
            $stmt->bindParam(':nom', $nom, PDO::PARAM_STR);
            $stmt->bindParam(':date_evenement', $date_evenement);
            $stmt->bindParam(':capacite_max', $capacite_max, PDO::PARAM_INT);
            $stmt->bindParam(':id_etablissement', $id_etablissement, PDO::PARAM_INT);

            // Exécution de la requête
            $stmt->execute();

            // Retourner l'ID de l'événement ajouté
            return $pdo->lastInsertId();
        } catch (PDOException $e) {
            // Gérer l'erreur ici
            return 'erreur: ' . $e->getMessage();
        }
    }
    public function capaciteTotaleEvenements($id_etablissement, $date_evenement) {
        global $pdo;
        try {
            $sql = "SELECT SUM(capacite_max) FROM evenement WHERE id_etablissement = :id_etablissement AND date_evenement = :date_evenement";
            $stmt = $pdo->prepare($sql);
            $stmt->bindParam(':id_etablissement', $id_etablissement, PDO::PARAM_INT);
            $stmt->bindParam(':date_evenement', $date_evenement);
            $stmt->execute();
            return $stmt->fetchColumn() ?: 0;
        } catch (PDOException $e) {
            return 'erreur: ' . $e->getMessage();
        }
    }
    public function recupererEvenements() {
        global $pdo;
        $sql = "SELECT nom, date_evenement FROM evenement";
        $stmt = $pdo->prepare($sql);
        $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }
    public function __construct($date = '') {
        $this->date = $date;
    }

    

    
    
}
?>
