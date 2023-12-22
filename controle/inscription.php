<?php
function inscription() {
    $_SESSION['msgAcc']="";
	if(count($_POST)==0) {
		require ("./vue/inscription/inscription.tpl");
	}
	else{
		$login = isset($_POST['silogin']) ? $_POST['silogin'] : '';
		$email = isset($_POST['siemail']) ? $_POST['siemail'] : '';
		$nom = isset($_POST['sinom']) ? $_POST['sinom'] : '';
		$prenom = isset($_POST['siprenom']) ? $_POST['siprenom'] : '';
		$age = isset($_POST['siage']) ? $_POST['siage'] : '';
		$sexe = isset($_POST['sisexe']) ? $_POST['sisexe'] : '';
		$ville = isset($_POST['siville']) ? $_POST['siville'] : '';
		$estDJ = isset($_POST['siestDJ']) ? $_POST['siestDJ'] : '';
		$mdp = isset($_POST['simotdepasse']) ? $_POST['simotdepasse'] : '';
		// $mdp_confirm = isset($_POST['siconfirmmdp']) ? $_POST['siconfirmmdp'] : '';
	
		
		// Utilisation de password_hash pour hacher le mot de passe
		$mdp_hashed = password_hash($mdp, PASSWORD_BCRYPT);

		if (identExists($email)) {
			$msgAcc = "Le login et/ou le mail existe déjà";
			$_SESSION['msgAcc'] = $msgAcc;
			require('./vue/inscription/inscription.tpl');
		} else {
			// Utilisation de la fonction signUp avec les nouveaux champs et le mot de passe haché
			signIn($login, $email, $nom, $prenom, $age, $sexe, $ville, $estDJ, $mdp_hashed);
			verif_ident($email, $mdp);
			$_SESSION['login'] = $login;
			$url="./index.php?controle=accueil&action=accueil"; //redirection accueil
            header("Location:" . $url);
		}
	}
}
// function inscription(){
// 	$_SESSION['msgAcc']="";
// 	if(count($_POST)==0) {
// 		require ("./vue/inscription/inscription.tpl");
// 	}
// 	else {
// 		$login =  isset($_POST['silogin'])?($_POST['silogin']):'';
// 		$email =  isset($_POST['siemail'])?($_POST['siemail']):'';
// 		$mdp =  isset($_POST['simdp'])?($_POST['simdp']):'';
// 		if(identExists($login, $email)) {
// 			$msgAcc = "Le login et/ou le mail existe déjà";
// 			$_SESSION['msgAcc'] = $msgAcc;
// 			require('./vue/inscription/inscription.tpl');
// 		} else {
// 			signIn($login,$email,$mdp);
// 			$url = "./index.php?controle=connexion&action=ident";
// 			header("Location:" .$url);
// 		}
// 	}	
// }
function identExists($email) {
	require('./modele/utilisateurBD.php');
	if(verifEmail($email)) {
		return true;
	} else {
		return false;
	}
}


?>