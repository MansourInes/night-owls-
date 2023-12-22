document.addEventListener('DOMContentLoaded', function() {
    var deconnexionButton = document.getElementById('deconnexion-button');
    var openConnexionPopup = document.getElementById('connexion-button');
    var openInscriptionPopup = document.getElementById('inscription');
    var openConnexionPopup2 = document.getElementById('connexion');
    var closeButtons = document.getElementsByClassName('close');
    var connexionPopup = document.getElementById('connexion-popup');
    var inscriptionPopup = document.getElementById('inscription-popup');

    if (deconnexionButton) {
        var originalText = deconnexionButton.innerHTML; // Stocker le texte original

        deconnexionButton.addEventListener('mouseover', function() {
            deconnexionButton.innerHTML = 'Déconnexion'; // Changer le texte au survol
        });

        deconnexionButton.addEventListener('mouseout', function() {
            deconnexionButton.innerHTML = originalText; // Rétablir le texte original lorsque la souris sort
        });
    }

    function closePopup(popup) {
        if (popup.classList.contains('open')) {
            popup.classList.remove('open');
        }
    }

    function openPopup(popup) {
        closePopup(connexionPopup); // Ferme l'autre popup si elle est ouverte
        closePopup(inscriptionPopup); // Ferme l'autre popup si elle est ouverte
        popup.classList.add('open');
    }

    if (openConnexionPopup) {
        openConnexionPopup.addEventListener('click', function() {
            openPopup(connexionPopup);
        });
    }

    if (openConnexionPopup2) {
        openConnexionPopup2.addEventListener('click', function() {
            openPopup(connexionPopup);
        });
    }

    if (openInscriptionPopup) {
        openInscriptionPopup.addEventListener('click', function() {
            openPopup(inscriptionPopup);
        });
    }

    Array.from(closeButtons).forEach(button => {
        button.addEventListener('click', function() {
            closePopup(this.closest('.popup')); // Ferme le popup le plus proche
        });
    });
});

window.addEventListener("load", function() {
    const eye = document.getElementById("eye");
    const eyeoff = document.getElementById("eyeoff");
    const inputmdp = document.getElementById("inputmdp");

    if (eye && eyeoff && inputmdp) {
        eye.addEventListener("click", function() {
            eye.style.display = "none";
            eyeoff.style.display = "block";
            inputmdp.type = "text";
        });

        eyeoff.addEventListener("click", function() {
            eyeoff.style.display = "none";
            eye.style.display = "block";
            inputmdp.type = "password";
        });
    }
});
