<!DOCTYPE HTML>
<html lang="fr">

<head>
    <title>PROJET WEB</title>
    <link rel="stylesheet" href="./vue/inscription/assets/inscription.css">
    <script src="./vue/inscription/assets/inscription.js"></script>
</head>

<body>
    <header>
        <!-- Include navbar here if needed -->
    </header>
    <div id="page">
        <div class="form">
            <h1 class="Titre">S'inscrire</h1>
            <form action="./index.php?controle=inscription&action=inscription" method="post">
                <label for="siemail"> <input type="email" id="siemail" name="siemail" value=""
                        placeholder="Email" required><br></label>
                <p class="msg" id="emailmsg"></p>

                <label for="sinom"> <input type="text" id="sinom" name="sinom" placeholder="Nom"><br></label>

                <label for="siprenom"> <input type="text" id="siprenom" name="siprenom" placeholder="Prénom"><br></label>

                <label for="siage"> <input type="number" id="siage" name="siage" placeholder="Âge"><br></label>

                <!-- Nouveau champ pour le sexe -->
                <label for="sisexe">Homme 
                    <input type="radio" id="homme" name="sexe" value="Homme">
                </label>
                
                <label for="sisexe">Femme 
                    <input type="radio" id="femme" name="sexe" value="Femme">
                </label><br>

                <label for="siville"> <input type="text" id="siville" name="siville" placeholder="Ville"><br></label>

                <label for="siestDJ"> 
                    Êtes-vous Admin ? 
                    <input type="checkbox" id="siestDJ" name="siestDJ" value="1">
                </label><br>

                <label for="siestSuperAdmin"> 
                    Êtes-vous Super Admin ? 
                    <input type="checkbox" id="siestDJ" name="siestDJ" value="1">
                </label><br>

                <label for="simotdepasse"> <input type="password" id="simotdepasse" name="simotdepasse" placeholder="Mot de passe" required><br></label>
                <p class="msg" id="msgPass"></p>

                <label for="siconfirmmdp"> <input type="password" id="siconfirmmdp" name="siconfirmmdp" placeholder="Confirmez le mot de passe" required><br></label>
                <p class="msg" id="msgConfirmPass"></p>

                <a id="connexion" href="./index.php?controle=connexion&action=ident">
                    <p>Déjà un compte ? Se connecter</p>
                </a>

                <input id="btnInput" type="submit" value="Inscription">
            </form>
            <div class="msgImportant"><!-- If needed, you can include dynamic content here --></div>
        </div>
    </div>
</body>

</html>
