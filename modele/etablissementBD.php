<?php
// modele/EtablissementModel.php
require_once 'connectSQL.php'; // Assurez-vous que le chemin est correct

class EtablissementModel {

    // Méthode pour ajouter un établissement
public function ajouterEtablissement($capacite_max, $nom, $adresse) {
    global $pdo;

    // Vérifiez ensuite si l'établissement existe déjà par son adresse
    $sqlCheckAdresse = "SELECT COUNT(*) FROM etablissement WHERE nom = :nom";
    $stmtCheckAdresse = $pdo->prepare($sqlCheckAdresse);
    $stmtCheckAdresse->bindParam(':nom', $nom, PDO::PARAM_STR);
    $stmtCheckAdresse->execute();

    if ($stmtCheckAdresse->fetchColumn() > 0) {
        return 'existe';
    }

    // Si l'établissement n'existe pas, procédez à l'insertion
    try {
        $sql = "INSERT INTO etablissement (capacite_max, nom, adresse) VALUES (:capacite_max, :nom, :adresse)";
        
        $stmt = $pdo->prepare($sql);
        $stmt->bindParam(':capacite_max', $capacite_max, PDO::PARAM_INT);
        $stmt->bindParam(':nom', $nom, PDO::PARAM_STR);
        $stmt->bindParam(':adresse', $adresse, PDO::PARAM_STR);
        $stmt->execute();
        return $pdo->lastInsertId();
    } catch (PDOException $e) {
        // Gérer l'erreur ici, par exemple en retournant un message d'erreur ou un code spécifique
        return 'erreur: ' . $e->getMessage();
    }
}


    // Méthode pour obtenir l'ID de l'établissement par son adresse
    public function getIdEtablissementParAdresse($adresse) {
        global $pdo;
        $sql = "SELECT id_etablissement FROM etablissement WHERE adresse = :adresse";
        $stmt = $pdo->prepare($sql);
        $stmt->bindParam(':adresse', $adresse, PDO::PARAM_STR);
        $stmt->execute();
        return $stmt->fetchColumn();
    }

    // Méthode pour obtenir la capacité maximale d'un établissement par son ID
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
