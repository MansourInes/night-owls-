<link rel="stylesheet" href="./vue/navbar/assets/style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css"
    integrity="sha512-SzlrxWUlpfuzQ+pcUCosxcglQRNAq/DZjVsC0lE40xsADsfeQoEypE+enwcOiGjk/bSuGGKHEyjSoQ1zVisanQ=="
    crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src="./vue/navbar/assets/script.js"></script>
<header>
    <a href="index.php"> 
    <img src="./vue/img/navbar/logo-white.png" class="logo" alt="Logo du site" title="Retour à l'accueil"/>
    </a>
    <nav id="header-nav">
        <a class="a-header" href="./index.php">Accueil</a>
        <a class="a-header" href="./index.php?controle=statistiques&action=statistiques">Statistiques</a>
        <?php 
        if(isset($_SESSION['estDJ']) && $_SESSION['estDJ']==1)
        echo("
        <a class='a-header' href='./index.php?controle=traitement&action=traitement'>Traitement</a>
            "); 
        ?>
       
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
            <a id="inscription">
                <p>Pas de compte ?
                    S'inscrire</p>
            </a>
            <input class="BtnInput" type="submit" value="Connexion">
        </form>
        <div class="msgImportant"><?php if(isset($msgAcc)) echo $msgAcc;?></div>
    </div>
</div>

<!-- Pop-up Inscription -->
<div id="inscription-popup" class="popup">
    <span class="close">&times;</span>
        <div class="form">
            <h1 class="Titre">S'inscrire</h1>
            <form action="./index.php?controle=inscription&action=inscription" method="post">
                <label for="siemail"> <input type="email" id="siemail" name="siemail" value=""
                        placeholder="Email" required><br></label>
                <p class="msg" id="emailmsg"></p>

                <label for="sinom"> <input type="text" id="sinom" name="sinom" placeholder="Nom" required><br></label>

                <label for="siprenom"> <input type="text" id="siprenom" name="siprenom" placeholder="Prénom" required><br></label>

                <label for="siage"> <input type="number" id="siage" name="siage" placeholder="Âge" required><br></label>

                <!-- Nouveau champ pour le sexe -->
                <label for="sisexe">Homme 
                    <input type="radio" id="homme" name="sexe" value="Homme">
                </label>
                
                <label for="sisexe">Femme 
                    <input type="radio" id="femme" name="sexe" value="Femme">
                </label><br>

                <label for="siville"> <input type="text" id="siville" name="siville" placeholder="Ville" required><br></label>

                <label for="siestDJ"> 
                    Êtes-vous DJ ? 
                    <input type="checkbox" id="siestDJ" name="siestDJ" value="1">
                </label><br>

                <label for="simotdepasse"> <input type="password" id="simotdepasse" name="simotdepasse" placeholder="Mot de passe" required><br></label>
                <p class="msg" id="msgPass"></p>
                
                <a id="connexion">
                    <p>Déjà un compte ? Se connecter</p>
                </a>
                <input id="btnInput" type="submit" value="Inscription">
            </form>
            <div class="msgImportant"><?php if(isset($msgAcc)) echo $msgAcc;?></div>
        </div>
</div>
</header>