<?php
    function verif_ident($login, $mdp)
	{
		global $resId;
		require('./modele/connectSQL.php'); //$pdo est défini dans ce fichier
		$sql = "SELECT `id_utilisateur`, `mot_de_passe`, `prenom`, `estAdmin`, `estSuperAdmin` FROM `utilisateur` WHERE `mail` = :login";
	
		try {
			$commande = $pdo->prepare($sql);
			$commande->bindParam(':login', $login);
			$bool = $commande->execute();
	
			if ($bool) {
				$resultat = $commande->fetch(PDO::FETCH_ASSOC); // Utilisez fetch pour obtenir une seule ligne
			}
		} catch (PDOException $e) {
			echo utf8_encode("Echec de la sélection : " . $e->getMessage() . "\n");
			die(); // On arrête tout.
		}
	
		if (!$resultat) {
			return false; // L'utilisateur n'existe pas
		}
	
		$hashedPassword = $resultat['mot_de_passe'];
	
		// Utilisation de password_verify pour comparer les mots de passe
		if (password_verify($mdp, $hashedPassword)) {
			$resId = $resultat['id_utilisateur'];
			$_SESSION['id'] = $resId;
			$_SESSION['prenom'] = $resultat['prenom'];
			$_SESSION['estAdmin'] = $resultat['estAdmin'];
			$_SESSION['estSuperAdmin'] = $resultat['estSuperAdmin'];
			return true; // Mot de passe correct
		} else {
			return false; // Mot de passe incorrect
		}
	}

    function verifEmail($email) {
		require('./modele/connectSQL.php'); //$pdo est défini dans ce fichier
		$sql = "SELECT `id_utilisateur` FROM `utilisateur` WHERE `mail` = :email";
		try {
			$commande = $pdo->prepare($sql);
			$commande->bindParam(':email', $email);
			$bool = $commande->execute();
			if ($bool) {
				$resultat = $commande->fetchAll(PDO::FETCH_ASSOC); //tableau d'enregistrements
			}
		}
		catch (PDOException $e) {
			echo utf8_encode("Echec de select : " . $e->getMessage() . "\n");
			die();
		}
		if ($resultat == null) return false; 
		else {
			return true;
		}
	}

	function verifLogin($login) {
		require('./modele/connectSQL.php'); //$pdo est défini dans ce fichier
		$sql="SELECT loginExists(:log) FROM `utilisateurs`";
		try {
			$commande = $pdo->prepare($sql);
			$commande->bindParam(':log', $login);
			$bool = $commande->execute();
			if ($bool) {
				$resultat = $commande->fetchAll(PDO::FETCH_ASSOC); //tableau d'enregistrements
			}
		}
		catch (PDOException $e) {
			echo utf8_encode("Echec de select : " . $e->getMessage() . "\n");
			die();
		}

		$param = "loginExists('" . $login . "')";
		$int = (int)$resultat[0][$param];

		if ($int == 0) return false; 
		else {
			return true;
		}
	}

	function signIn($login, $email, $nom, $prenom, $age, $sexe, $ville, $estAdmin, $estSuperAdmin, $mdp) {
		require('./modele/connectSQL.php');
	
		$sql = "INSERT INTO utilisateur (mail, nom, prenom, age_, sexe, ville, estAdmin, estSuperAdmin, mot_de_passe) 
				VALUES (:email, :nom, :prenom, :age, :sexe, :ville, :estAdmin, :estSuperAdmin, :mdp)";
		
		try {
			$commande = $pdo->prepare($sql);
			$commande->bindParam(':email', $email);
			$commande->bindParam(':nom', $nom);
			$commande->bindParam(':prenom', $prenom);
			$commande->bindParam(':age', $age);
			$commande->bindParam(':sexe', $sexe);
			$commande->bindParam(':ville', $ville);
			$commande->bindParam(':estAdmin', $estAdmin);
			$commande->bindParam(':estSuperAdmin', $estSuperAdmin);
			$commande->bindParam(':mdp', $mdp);
			$commande->execute();
		} catch (PDOException $e) {
			echo utf8_encode("Echec de l'insertion : " . $e->getMessage() . "\n");
			die();
		}
	}
?>