document.addEventListener('DOMContentLoaded', function() {
    var deconnexionButton = document.getElementById('deconnexion-button');
    var openConnexionPopup = document.getElementById('connexion-button');
    var openInscriptionPopup = document.getElementById('inscription');
    var openConnexionPopup2 = document.getElementById('connexion');
    var closeButtons = document.getElementsByClassName('close');
    var connexionPopup = document.getElementById('connexion-popup');
    var inscriptionPopup = document.getElementById('inscription-popup');

    var isAdminCheckbox = document.getElementById('siestAdmin');
    var isSuperAdminCheckbox = document.getElementById('siestSuperAdmin');
    var verificationCodeInput = document.getElementById('verificationCode');
    function toggleVerificationCodeInput() {
        var isAdminCheckbox = document.getElementById('siestAdmin');
        var isSuperAdminCheckbox = document.getElementById('siestSuperAdmin');
        var verificationCodeInput = document.getElementById('verificationCode');
    
        if (isAdminCheckbox.checked || isSuperAdminCheckbox.checked) {
            verificationCodeInput.classList.remove('hidden');
        } else {
            verificationCodeInput.classList.add('hidden');
        }
    }

    // Initialiser l'état du champ de code de vérification
    toggleVerificationCodeInput();

    // Ajouter des écouteurs d'événements aux cases à cocher
    isAdminCheckbox.addEventListener('change', toggleVerificationCodeInput);
    isSuperAdminCheckbox.addEventListener('change', toggleVerificationCodeInput);

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

    var isAdminCheckbox = document.getElementById('siestDJ');
    var isSuperAdminCheckbox = document.getElementById('siestSuperAdmin');
    var verificationCodeInput = document.getElementById('verificationCode');

    if (isAdminCheckbox && isSuperAdminCheckbox && verificationCodeInput) {
        function toggleVerificationCodeInput() {
            if (isAdminCheckbox.checked || isSuperAdminCheckbox.checked) {
                verificationCodeInput.style.display = 'block';
            } else {
                verificationCodeInput.style.display = 'none';
            }
        }

        // Initialiser l'état du champ de code de vérification
        toggleVerificationCodeInput();

        // Ajouter des écouteurs d'événements aux cases à cocher
        isAdminCheckbox.addEventListener('change', toggleVerificationCodeInput);
        isSuperAdminCheckbox.addEventListener('change', toggleVerificationCodeInput);
    }

    $('#togglePassword').click(function() {
        togglePasswordVisibility('simotdepasse', 'togglePassword');
    });

    $('#toggleConfirmPassword').click(function() {
        togglePasswordVisibility('simotdepasseConfirm', 'toggleConfirmPassword');
    });
});

$(document).ready(function() {
    $('#connexion-popup form').submit(function(e) {
        e.preventDefault(); // Empêche la soumission normale du formulaire
        var data = $(this).serialize(); // Récupère les données du formulaire

        $.ajax({
            type: "POST",
            url: "./index.php?controle=connexion&action=ident",
            data: data,
            dataType: "json", // Assurez-vous de traiter la réponse en tant que JSON
            success: function(response) {
                if (response.success) {
                    window.location.href = response.redirect; // Redirige vers l'URL fournie
                } else {
                    // Affiche le message d'erreur
                    $('#msgConnexionImportant').text(response.message); // Ou affichez-le dans l'interface utilisateur
                }
            },
            error: function(jqXHR, textStatus, errorThrown) {
                console.log("Erreur AJAX :", textStatus, errorThrown);
            }            
        });        
    });
});



$(document).ready(function() {
    $('#inscription-popup form').submit(function(e) {
        e.preventDefault();

        var isValid = true;

        // Validation de l'email
        var email = $('#siemail').val();
        if (!validateEmail(email)) {
            $('#emailErrorMsg').text('Adresse email invalide.');
            isValid = false;
        } else {
            $('#emailErrorMsg').text('');
        }

        // Validation du nom
        var nom = $('#sinom').val();
        if (!validateText(nom, 20)) {
            $('#nomErrorMsg').text('Le nom ne doit contenir que des lettres et moins de 20 caractères.');
            isValid = false;
        } else {
            $('#nomErrorMsg').text('');
        }

        // Validation du prénom
        var prenom = $('#siprenom').val();
        if (!validateText(prenom, 20)) {
            $('#prenomErrorMsg').text('Le prénom ne doit contenir que des lettres et moins de 20 caractères.');
            isValid = false;
        } else {
            $('#prenomErrorMsg').text('');
        }

        // Validation de l'âge
        var age = $('#siage').val();
        if (age < 18) {
            $('#ageErrorMsg').text('Vous devez avoir au moins 18 ans.');
            isValid = false;
        } else {
            $('#ageErrorMsg').text('');
        }

        // Validation du code admin/super admin
        var isAdmin = $('#siestAdmin').is(':checked');
        var isSuperAdmin = $('#siestSuperAdmin').is(':checked');
        var code = $('#verificationCode').val();
        if ((isAdmin || isSuperAdmin) && code !== "0000") {
            $('#codeErrorMsg').text('Code de vérification incorrect.');
            isValid = false;
        } else {
            $('#codeErrorMsg').text('');
        }

        // Validation du mot de passe
        var password = $('#simotdepasse').val();
        if (!validatePassword(password)) {
            $('#passwordErrorMsg').text('Le mot de passe doit contenir au moins 8 caractères, dont une majuscule, une minuscule et un caractère spécial.');
            isValid = false;
        } else {
            $('#passwordErrorMsg').text('');
        }

        // Validation que les mots de passe correspondent
        var passwordConfirm = $('#simotdepasseConfirm').val();
        if (password !== passwordConfirm) {
            $('#passwordConfirmErrorMsg').text('Les mots de passe ne correspondent pas.');
            isValid = false;
        } else {
            $('#passwordConfirmErrorMsg').text('');
        }

        var isGenderSelected = $("input[name='sexe']:checked").length > 0;
        if (!isGenderSelected) {
            $('#genderErrorMsg').text('Veuillez sélectionner un genre.');
            isValid = false;
        } else {
            $('#genderErrorMsg').text('');
        }

        // Nettoyage et formatage des champs prénom, nom et ville
        var prenom = capitalizeFirstLetter($('#siprenom').val());
        $('#siprenom').val(prenom);

        var nom = capitalizeFirstLetter($('#sinom').val());
        $('#sinom').val(nom);

        var ville = capitalizeFirstLetter($('#siville').val());
        $('#siville').val(ville);

        // Soumission du formulaire si toutes les validations sont passées
        if (isValid) {
            var data = $(this).serialize();
            $.ajax({
                type: "POST",
                url: "./index.php?controle=inscription&action=inscription",
                data: data,
                dataType: "json", // Assurez-vous de traiter la réponse en tant que JSON
                success: function(response) {
                    if (response.success) {
                        window.location.href = response.redirect; // Redirige vers l'URL fournie
                    } else {
                        // Affiche le message d'erreur
                        $('#msgInscriptionImportant').text(response.message); // Ou affichez-le dans l'interface utilisateur
                    }
                },
                error: function(jqXHR, textStatus, errorThrown) {
                    console.log("Erreur AJAX :", textStatus, errorThrown);
                }            
            }); 
        }
    });
});

function togglePasswordVisibility(fieldId) {
    var field = document.getElementById(fieldId);
    var icon = $("label[for='" + fieldId + "']");
    
    if (field.type === 'password') {
        field.type = 'text';
        icon.removeClass('fa-eye').addClass('fa-eye-slash');
    } else {
        field.type = 'password';
        icon.removeClass('fa-eye-slash').addClass('fa-eye');
    }
}


function capitalizeFirstLetter(string) {
    return string.charAt(0).toUpperCase() + string.slice(1).toLowerCase();
}

function validateEmail(email) {
    var re = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
    return re.test(email);
}

function validateText(text, maxLength) {
    return /^[A-Za-z\s]+$/.test(text) && text.length <= maxLength;
}

function validatePassword(password) {
    var re = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,30}$/;
    return re.test(password);
}
