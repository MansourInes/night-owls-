<!DOCTYPE HTML>
<html lang="fr">

<head>
    <title>PROJET WEB</title>
    <link rel="stylesheet" href="./vue/connexion/assets/connexion.css">
    <script src="./vue/connexion/assets/connexion.js"></script>
</head>

<body>
    <header>
        <!-- Include navbar here if needed -->
    </header>
    <div id="page">
        <div class="form">
            <h1 class="Titre">Se connecter</h1>
            <form action="./index.php?controle=connexion&action=ident" method="post">
                <label for="cologin">
                    <input type="text" id="cologin" name="cologin" placeholder="Login ou Email" value="" required><br>
                </label><br>

                <div class="mdp">
                    <label class="labelmdp">
                        <input type="password" id="inputmdp" name="comdp" placeholder="Mot de passe">
                        <div class="password-icon">
                            <i id="eye" class="fa-regular fa-eye"></i>
                            <i id="eyeoff" class="fa-regular fa-eye-slash"></i>
                        </div>
                    </label>
                </div>
                <!--<a id="inscription" href="./index.php?controle=inscription&action=inscription">!-->
                <a id="inscription" href="../inscription/inscription.html">
                    <p>Pas de compte ?
                        S'inscrire</p>
                </a>
                <input class="BtnInput" type="submit" value="Connexion">
            </form>
            <div class="msgImportant"><!-- If needed, you can include dynamic content here --></div>
        </div>
    </div>
</body>

</html>
