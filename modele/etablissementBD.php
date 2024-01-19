<?php
// modele/EtablissementModel.php
require_once 'connectSQL.php'; // Assurez-vous que le chemin est correct

class EtablissementModel {

    public function ajouterEtablissement($capacite_max, $adresse) {
        global $pdo;
        // Vérifiez d'abord si l'établissement existe déjà
        $sqlCheck = "SELECT COUNT(*) FROM etablissement WHERE adresse = :adresse";
        $stmtCheck = $pdo->prepare($sqlCheck);
        $stmtCheck->bindParam(':adresse', $adresse, PDO::PARAM_STR);
        $stmtCheck->execute();
    
        if ($stmtCheck->fetchColumn() > 0) {
            return 'existe';
        }
    
        // Si l'établissement n'existe pas, procédez à l'insertion
        try {
            $sql = "INSERT INTO etablissement (capacite_max, adresse) VALUES (:capacite_max, :adresse)";
            
        $stmt = $pdo->prepare($sql);
        $stmt->bindParam(':capacite_max', $capacite_max, PDO::PARAM_INT);
        $stmt->bindParam(':adresse', $adresse, PDO::PARAM_STR);
        $stmt->execute();
        return $pdo->lastInsertId();
        } catch (PDOException $e) {
        // Gérer l'erreur ici, par exemple en retournant un message d'erreur ou un code spécifique
    return 'erreur: ' . $e->getMessage();
         }
    }
    public function getIdEtablissementParAdresse($adresse) {
        global $pdo;
        $sql = "SELECT id_etablissement FROM etablissement WHERE adresse = :adresse";
        $stmt = $pdo->prepare($sql);
        $stmt->bindParam(':adresse', $adresse, PDO::PARAM_STR);
        $stmt->execute();
        return $stmt->fetchColumn();
    }
    public function getCapaciteMax($id_etablissement) {
        global $pdo;
        try {
            $sql = "SELECT capacite_max FROM etablissement WHERE id_etablissement = :id_etablissement";
            $stmt = $pdo->prepare($sql);
            $stmt->bindParam(':id_etablissement', $id_etablissement, PDO::PARAM_INT);
            $stmt->execute();
            return $stmt->fetchColumn();
        } catch (PDOException $e) {
            return 'erreur: ' . $e->getMessage();
        }
    }

}
?>


