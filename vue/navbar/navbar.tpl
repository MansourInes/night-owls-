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
        <a class="a-header" href="./index.php?controle=traitement&action=traitement">Traitement</a>
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
            echo("<a class='a-header' href='./index.php?controle=connexion&action=ident' id='connexion-button'>Authentification</a>");
    ?>
    <!-- <?php var_dump($_SESSION); ?> -->
    
</header>