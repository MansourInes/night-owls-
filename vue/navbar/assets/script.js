document.addEventListener('DOMContentLoaded', function() {
    var deconnexionButton = document.getElementById('deconnexion-button');

    if (deconnexionButton) {
        var originalText = deconnexionButton.innerHTML; // Stocker le texte original

        deconnexionButton.addEventListener('mouseover', function() {
            deconnexionButton.innerHTML = 'Déconnexion'; // Changer le texte au survol
        });

        deconnexionButton.addEventListener('mouseout', function() {
            deconnexionButton.innerHTML = originalText; // Rétablir le texte original lorsque la souris sort
        });
    }
});
