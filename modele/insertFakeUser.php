<?php
require('./connectSQL.php'); // Assurez-vous d'inclure votre fichier de connexion PDO

$mail = "test@gmail.com";
$nom = "ESTEVES";
$prenom = "GABRIEL";
$age = 20;
$sexe = "M";
$ville = "Bezons";
$estDJ = 0;
$motDePasse = "test";

// Hachage du mot de passe avec Bcrypt
$motDePasseHache = password_hash($motDePasse, PASSWORD_BCRYPT);

$sql = "INSERT INTO `utilisateur`(`mail`, `nom`, `prenom`, `age_`, `sexe`, `ville`, `estDJ`, `mot_de_passe`) 
        VALUES (:mail, :nom, :prenom, :age, :sexe, :ville, :estDJ, :motDePasse)";

try {
    $commande = $pdo->prepare($sql);
    $commande->bindParam(':mail', $mail);
    $commande->bindParam(':nom', $nom);
    $commande->bindParam(':prenom', $prenom);
    $commande->bindParam(':age', $age);
    $commande->bindParam(':sexe', $sexe);
    $commande->bindParam(':ville', $ville);
    $commande->bindParam(':estDJ', $estDJ);
    $commande->bindParam(':motDePasse', $motDePasseHache);
    
    $bool = $commande->execute();

    if ($bool) {
        echo "Faux utilisateur inséré avec succès!";
    } else {
        echo "Erreur lors de l'insertion de l'utilisateur.";
    }
} catch (PDOException $e) {
    echo utf8_encode("Echec de l'insertion : " . $e->getMessage() . "\n");
    die(); // Arrête tout en cas d'échec.
}
?>