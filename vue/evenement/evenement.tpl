<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Métadonnées et CSS -->
    <link rel="stylesheet" href="./vue/accueil/assets/accueil.css">
    <title>Événements</title>
</head>
<body>
    <section class="columns">
        <?php foreach ($evenements as $evenement) : ?>
            <div class="ligne">
                <img src="./vue/evenement/couverture_event.jpeg" alt="Image par défaut">
                <h3><?= htmlspecialchars($evenement['nom']); ?></h3>
                <p>Date : <?= htmlspecialchars($evenement['date_evenement']); ?></p>
            </div>
        <?php endforeach; ?>

    </section>
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
