<?php
    function verif_ident($login, $mdp)
	{
		global $resId;
		require('./modele/connectSQL.php'); //$pdo est défini dans ce fichier
		$mdp = "$2y$10$2IxbUQt95GbRXIQMoRtsgef3iZlp880rfOGawd47oDB";
		$sql = "SELECT `id_utilisateur`, `mot_de_passe` FROM `utilisateur` WHERE `mail` = :login and `mot_de_passe` = :mdp" ;
	
		try {
			$commande = $pdo->prepare($sql);
			$commande->bindParam(':login', $login);
			$commande->bindParam(':mdp', $mdp);
			$bool = $commande->execute();
	
			if ($bool) {
				$resultat = $commande->fetch(PDO::FETCH_ASSOC); // Utilisez fetch pour obtenir une seule ligne
			}
		} catch (PDOException $e) {
			echo utf8_encode("Echec de la sélection : " . $e->getMessage() . "\n");
			die(); // On arrête tout.
		}
		echo($resultat);
		if (!$resultat) {
			return false; // L'utilisateur n'existe pas
		}
		else return true;
	
		$hashedPassword = $resultat['mot_de_passe'];
	
		// Utilisation de password_verify pour comparer les mots de passe
		if (password_verify($mdp, $hashedPassword)) {
			$resId = $resultat['id_utilisateur'];
			$_SESSION['id'] = $resId;
			return true; // Mot de passe correct
		} else {
			return false; // Mot de passe incorrect
		}
	}

    function verifEmail($email) {
		require('./modele/connectSQL.php'); //$pdo est défini dans ce fichier
		$sql="SELECT emailExists(:mail) FROM `utilisateurs`";
		try {
			$commande = $pdo->prepare($sql);
			$commande->bindParam(':mail', $email);
			$bool = $commande->execute();
			if ($bool) {
				$resultat = $commande->fetchAll(PDO::FETCH_ASSOC); //tableau d'enregistrements
			}
		}
		catch (PDOException $e) {
			echo utf8_encode("Echec de select : " . $e->getMessage() . "\n");
			die();
		}
		//var_dump($resultat);
		$param = "emailExists('" . $email . "')";
		$int = (int)$resultat[0][$param];
		
		if ($int == 0) return false; 
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

	function signIn($login, $email, $mdp) {
		require('./modele/connectSQL.php'); //$pdo est défini dans ce fichier
		$sql="CALL signIn(:log,:email,:mdp)";
		try {
			$commande = $pdo->prepare($sql);
			$commande->bindParam(':log', $login);
			$commande->bindParam(':email', $email);
			$commande->bindParam(':mdp', $mdp);
			$commande->execute();
		}
		catch (PDOException $e) {
			echo utf8_encode("Echec de select : " . $e->getMessage() . "\n");
			die();
		}
	}
?>