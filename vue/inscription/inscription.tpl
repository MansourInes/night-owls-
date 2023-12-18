<!DOCTYPE HTML>
<html lang="fr">

<head>
    <title>PROJET WEB</title>
    <link rel="stylesheet" href="./assets/inscription.css">
    <script src="./assets/inscription.js"></script>
</head>

<body>
    <header>
        <!-- Include navbar here if needed -->
    </header>
    <div id="page">
        <div class="form">
            <h1 class=" Titre">S'inscrire</h1>
            <form action="./index.php?controle=inscription&action=inscription" method="post">
                <label for="silogin"> <input type="text" id="silogin" name="silogin" placeholder="Login"><br></label>
                <p class="msg" id="msgLogin"></p>
                <label for="siemail"> <input type="email" id="siemail" name="siemail" value=""
                        placeholder="Email"><br></label>
                <p class="msg" id="emailmsg"></p>
                <div id="mdpvue">

                    <label class="labelmdp">
                        <input type="password" id="inputmdp" name="simdp" placeholder="Mot de passe">

                        <div class="password-icon">
                            <i class="fa-regular fa-eye"></i>
                            <i class="fa-regular fa-eye-slash"></i>
                        </div>
                    </label>
                    <p class="msg" id="msgPass"></p>
                    <label class="labelmdp">
                        <input type="password" id="confirmmdp" name="simdp" placeholder="Confirmez le mot de passe">
                        <div class="password-icon">
                            <i class="fa-regular fa-eye"></i>
                            <i class="fa-regular fa-eye-slash"></i>
                        </div>
                    </label>
                    <p class="msg" id="msgConfirmPass"></p>
                </div>
                <!--<a id="connexion" href="./index.php?controle=connexion&action=ident">!-->
                <a id="connexion" href="../connexion/connexion.html">
                    <p>Déja un compte ?
                        Se connecter</p>
                </a>
                <input id="btnInput" type="submit" value="Inscription">
            </form>
            <div class="msgImportant"><!-- If needed, you can include dynamic content here --></div>
        </div>
    </div>
</body>

</html>
