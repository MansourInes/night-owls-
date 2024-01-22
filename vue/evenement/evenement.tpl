<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Métadonnées et CSS -->
    <link rel="stylesheet" href="./vue/accueil/assets/accueil.css">
    <script src="./vue/evenement/script.js"></script>
    <title>Événements</title>
</head>
<body>
    <section class="columns">
        <?php foreach ($evenements as $evenement) : ?>
            <div class="ligne">
                <img src="./vue/evenement/image/couverture_event.jpeg" alt="Image par défaut">
                <h3><?= htmlspecialchars($evenement['nom']); ?></h3>
                <p>Date : <?= htmlspecialchars($evenement['date_evenement']); ?></p>
            </div>
        <?php endforeach; ?>

    </section>

    <div id="eventModal" class="modal">
    <div class="modal-content">
        <span class="close">&times;</span>
        <p>Some text in the Modal..</p>
    </div>
</div>

    <script>
    document.getElementById('btnAfficherEvenements').addEventListener('click', function() {
        fetch('index.php?controle=evenement&action=afficherEvenements')
            .then(response => response.text())
            .then(html => {
                console.log(html); // Pour tester la réponse
                document.getElementById('contenuEvenements').innerHTML = html;
                document.getElementById('contenuEvenements').style.display = 'block';
            })

            .catch(error => console.error('Erreur:', error));
    });
    
</script>

</body>
</html>
