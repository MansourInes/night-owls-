<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./vue/backoffice/assets/backoffice.css">
    <!-- Inclusion de la feuille de style CSS -->

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <!-- Inclusion de la bibliothèque jQuery -->

    <script src="./vue/backoffice/script.js"></script>
    <!-- Inclusion du fichier JavaScript personnalisé pour le Backoffice -->
    
    <title>Backoffice</title>
</head>
<body>

    <div class="container">
        <h1>Bienvenue dans le Backoffice</h1>
        <p>Quel tableau souhaitez-vous regarder ?</p>
        <label for="tableau">Sélectionnez un tableau :</label>
        <!-- Formulaire de sélection du tableau -->
        <select id="tableau">
            <option value="">Sélectionnez un tableau :</option>
            <option value="utilisateur">Utilisateurs</option>
            <option value="evenement">Évènements</option>
            <option value="etablissement">Établissements</option>
            <option value="sujet">Forum - Sujets</option>
            <option value="message">Forum - Message</option>
            <option value="capteur">Capteurs</option>
            <option value="capteur_data">Données capteurs</option>
        </select>

        <div id="resultatTableau"></div>
        <!-- Zone pour afficher les résultats du tableau -->
    </div>
    
    <script src="script.js"></script>
    <!-- Inclusion du fichier JavaScript principal -->
    
    <script src="./modele/theme-switcher.js"></script>
    <!-- Inclusion du fichier JavaScript pour le changement de thème -->
</body>
</html>
