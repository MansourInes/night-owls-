<?php
function inscription(){
	$_SESSION['msgAcc']="";
	if(count($_POST)==0) {
		require ("./vue/inscription/inscription.tpl");
	}
	else {
		$login =  isset($_POST['silogin'])?($_POST['silogin']):'';
		$email =  isset($_POST['siemail'])?($_POST['siemail']):'';
		$mdp =  isset($_POST['simdp'])?($_POST['simdp']):'';
		if(identExists($login, $email)) {
			$msgAcc = "Le login et/ou le mail existe déjà";
			$_SESSION['msgAcc'] = $msgAcc;
			require('./vue/inscription/inscription.tpl');
		} else {
			signIn($login,$email,$mdp);
			$url = "./index.php?controle=connexion&action=ident";
			header("Location:" .$url);
		}
	}
	
	
}
function identExists($login, $email) {
	require('./modele/utilisateurBD.php');
	if(verifLogin($login) || verifEmail($email)) {
		return true;
	} else {
		return false;
	}
}


?>