<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- <link rel="stylesheet" href="./vue/backoffice/assets/backoffice.css"> -->
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
            <option value="utilisateurs">Utilisateurs</option>
            <option value="evenements">Évènements</option>
            <option value="etablissements">Établissements</option>
        </select>

        <div id="resultatTableauUtilisateurs" style="display: none;">
            <table id="tableUtilisateurs">
                <thead>
                    <tr>
                        <th>Nom</th>
                        <th>Prénom</th>
                        <th>Mail</th>
                        <th>Âge</th>
                        <th>Sexe</th>
                        <th>Ville</th>
                        <th>Est DJ</th>
                    </tr>
                </thead>
                <tbody id="tbodyUtilisateurs"></tbody>
            </table>
        </div>
        
        <div id="resultatTableauEvenements" style="display: none;">
            <table id="tableEvenements">
                <thead>
                    <tr>
                        <th>Nom</th>
                        <th>Capacité maximale</th>
                        <th>Date</th>
                        <th>Nom de l'établissement</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody id="tbodyEvenements"></tbody>
            </table>
        </div>
        
        <div id="resultatTableauEtablissements" style="display: none;">
            <table id="tableEtablissements">
                <thead>
                    <tr>
                        <th>Nom</th>
                        <th>Capacité maximale</th>
                        <th>Adresse</th>
                    </tr>
                </thead>
                <tbody id="tbodyEtablissements"></tbody>
            </table>
        </div>
    </div>

    <script src="script.js"></script>
</body>
</html>