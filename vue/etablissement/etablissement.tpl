<!DOCTYPE html>
<html>
<head>
    <title>Ajout Etablissement et Evénement</title>
    <link rel="stylesheet" href="./vue/etablissement/assets/etablissement.css">
</head>
<body>
    <div class="form-container">
        <!-- Formulaire d'ajout d'établissement -->
        <form id="formAjoutEtablissement" method="post">
            <label for="adresse">Adresse:</label>
            <input type="text" id="adresse" name="adresse" required>

            <label for="capacite_max">Capacité Max:</label>
            <input type="number" id="capacite_max" name="capacite_max" required>

            <!-- Champ pour afficher le nom de l'établissement -->
            <label for="nom_etablissement">Nom de l'établissement:</label>
            <input type="text" id="nom_etablissement" name="nom_etablissement" required>

            <input type="submit" value="Ajouter l'établissement">
        </form>
    </div>

    <div class="form-container" id="formulaireEvenement" style="display: none;">
        <!-- Formulaire d'ajout d'événement -->
        <form id="formAjoutEvenement" method="post">
            <label for="nom_evenement">Nom de l'événement:</label>
            <input type="text" id="nom_evenement" name="nom_evenement" required>

            <label for="date_evenement">Date de l'événement:</label>
            <input type="date" id="date_evenement" name="date_evenement" required>

            <label for="capacite_max_evenement">Capacité Max:</label>
            <input type="number" id="capacite_max_evenement" name="capacite_max_evenement" required>

            <input type="hidden" name="id_etablissement" id="idEtablissement" value="">
            <input type="submit" value="Ajouter l'événement">
        </form>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            document.getElementById('formAjoutEtablissement').addEventListener('submit', function(e) {
                e.preventDefault();
                var formData = new FormData(this);
                fetch('index.php?controle=etablissement&action=ajouterEtablissement', {
                    method: 'POST',
                    body: formData
                })
                .then(response => response.json())
                .then(data => {
                    alert(data.message);
                    if (data.id_etablissement) {
                        document.getElementById('idEtablissement').value = data.id_etablissement;
                        document.getElementById('formulaireEvenement').style.display = 'block';
                    }
                })
                .catch(error => {
                    console.error('Erreur:', error);
                });
            });

            document.getElementById('formAjoutEvenement').addEventListener('submit', function(e) {
                e.preventDefault();
                var formData = new FormData(this);
                fetch('index.php?controle=etablissement&action=ajouterEvenement', {
                    method: 'POST',
                    body: formData
                })
                .then(response => response.json())
                .then(data => {
                    if (data.success) {
                        alert(data.message);
                    } else {
                        alert(data.message);
                    }
                })
                .catch(error => {
                    console.error('Erreur:', error);
                });
            });
        });
    </script>
</body>
</html>
