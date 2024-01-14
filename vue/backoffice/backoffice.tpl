<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./vue/backoffice/assets/backoffice.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="./vue/backoffice/script.js"></script>
    <title>Backoffice</title>
</head>
<body>

    <div class="container">
        <h1>Bienvenue dans le Backoffice</h1>
        <p>Quel tableau souhaitez-vous regarder ?</p>
        <label for="tableau">Sélectionnez un tableau :</label>
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
    </div>
    <script src="script.js"></script>
</body>
</html>
