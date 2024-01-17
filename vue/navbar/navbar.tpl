<link rel="stylesheet" href="./vue/navbar/assets/style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css"
    integrity="sha512-SzlrxWUlpfuzQ+pcUCosxcglQRNAq/DZjVsC0lE40xsADsfeQoEypE+enwcOiGjk/bSuGGKHEyjSoQ1zVisanQ=="
    crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="./vue/navbar/assets/script.js"></script>
<header>
    <a href="index.php"> 
    <img src="./vue/img/navbar/logo-white.png" class="logo" alt="Logo du site" title="Retour à l'accueil"/>
    </a>
    <nav id="header-nav">
        <!-- Ces liens sont accessibles à tous -->
        <a class="a-header" href="./index.php">Accueil</a>
        <a class="a-header" href="./index.php?controle=statistiquesJS&action=statistiques">Statistiques</a>
        <a class="a-header" href="./index.php?controle=faq&action=faq">FAQ</a>
        
        <!-- Ce lien est accessible si un utilisateur est connecté (vérification si l'ID est défini dans la session) -->
        <?php 
        if (isset($_SESSION['id'])) {
            echo "<a class='a-header' href='./index.php?controle=forum&action=forum'>Forum</a>";
        }
        ?>
    
        <!-- Ce lien est accessible uniquement pour les super administrateurs -->
        <?php 
        if (isset($_SESSION['estSuperAdmin']) && $_SESSION['estSuperAdmin'] == 1) {
            echo "<a class='a-header' href='./index.php?controle=backoffice&action=backoffice'>Backoffice</a>";
        }
        ?>

        <a class="a-header" href="./index.php?controle=entreprise&action=entreprise">Entreprise</a>
        <a class="a-header" href="./index.php?modele=theme-switcher&action=switch">Changer de thème</a>
    
    </nav>
    
    <?php 
            if(isset($_SESSION['id']))
            echo("
                <a class='a-header' href='./index.php?controle=deconnexion&action=logOut' id='deconnexion-button'>
                    <i id='iprofil'class='fa-regular fa-user'></i>
                    ".$_SESSION['prenom']."
                </a>
                "); 
            else 
            echo("<a class='a-header' id='connexion-button'>Authentification</a>");
    ?>
    <!-- <?php var_dump($_SESSION); ?> -->
    <!-- Pop-up Connexion -->
<div id="connexion-popup" class="popup">
    <span class="close">&times;</span>
    <div class="form">
        
        <h1 class="Titre">Se connecter</h1>
        <form>
            <label for="cologin">
                <input type="text" id="cologin" name="cologin" placeholder="Login ou Email" value="" required><br>
            </label><br>

            <div class="mdp">
                <div class="input-icon">
                    <input type="password" id="inputmdp" name="comdp" placeholder="Mot de passe" required>
                    <label for="inputmdp" class="fa fa-eye toggle-password" onclick="togglePasswordVisibility('inputmdp');"></label>
                </div>
            </div>
            <a id="inscription">
                <p>Pas de compte ?
                    S'inscrire</p>
            </a>
            <input class="BtnInput" type="submit" value="Connexion">
        </form>
        <div id="msgConnexionImportant" class="msgImportant"></div>
    </div>
</div>

<!-- Pop-up Inscription -->
<div id="inscription-popup" class="popup">
    <span class="close">&times;</span>
    <div class="form">
        <h1 class="Titre">S'inscrire</h1>
        <form>
            <label for="siemail">
                <input type="email" id="siemail" name="siemail" placeholder="Email" required>
            </label>
            <p class="msg" id="emailErrorMsg"></p>

            <label for="sinom">
                <input type="text" id="sinom" name="sinom" placeholder="Nom" maxlength="20" required>
            </label>
            <p class="msg" id="nomErrorMsg"></p>

            <label for="siprenom">
                <input type="text" id="siprenom" name="siprenom" placeholder="Prénom" maxlength="20" required>
            </label>
            <p class="msg" id="prenomErrorMsg"></p>

            <label for="siage">
                <input type="number" id="siage" name="siage" placeholder="Âge" required>
            </label>
            <p class="msg" id="ageErrorMsg"></p>

            <label for="sisexe">Homme
                <input type="radio" id="homme" name="sexe" value="Homme">
            </label>
            <label for="sisexe">Femme 
                <input type="radio" id="femme" name="sexe" value="Femme">
            </label>
            <label for="sisexe">Autre 
                <input type="radio" id="autre" name="sexe" value="Autre">
            </label><br>
            <p class="msg" id="genderErrorMsg"></p>

            <label for="siville"> 
                <input type="text" id="siville" name="siville" placeholder="Ville" maxlength="50">
            </label>
            <p class="msg" id="villeErrorMsg"></p>

            <label for="siestAdmin">Êtes-vous Admin ? 
                <input type="checkbox" id="siestAdmin" name="siestAdmin" value="1">
            </label>
            <p class="msg" id="adminErrorMsg"></p>

            <label for="siestSuperAdmin">Êtes-vous Super Admin ? 
                <input type="checkbox" id="siestSuperAdmin" name="siestSuperAdmin" value="1">
            </label>
            <p class="msg" id="superAdminErrorMsg"></p>

            <input type="number" id="verificationCode" name="verificationCode" class="hidden" min="0" max="999999" placeholder="Code vérification">

            <p class="msg" id="codeErrorMsg"></p>

            <div class="input-icon">
                <input type="password" id="simotdepasse" name="simotdepasse" placeholder="Mot de passe" required>
                <label for="simotdepasse" class="fa fa-eye toggle-password" onclick="togglePasswordVisibility('simotdepasse');"></label>
            </div>
            <p class="msg" id="passwordErrorMsg"></p>
            
            <div class="input-icon">
                <input type="password" id="simotdepasseConfirm" name="simotdepasseConfirm" placeholder="Confirmer le mot de passe" required>
                <label for="simotdepasseConfirm" class="fa fa-eye toggle-password" onclick="togglePasswordVisibility('simotdepasseConfirm');"></label>
            </div>
            <p class="msg" id="passwordConfirmErrorMsg"></p>
            
            
            
            <a id="connexion">
                <p>Déjà un compte ? Se connecter</p>
            </a>
            <input id="btnInput" type="submit" value="Inscription">
        </form>
        <div id="msgInscriptionImportant" class="msgImportant"></div>
    </div>
</div>
</header>
