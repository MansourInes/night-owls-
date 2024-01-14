$(document).ready(function() {
    loadTopics();

    $('#createTopic').click(function() {
        $('#createTopicPopup').show();
    });

    $('.closeForum').click(function() {
        $('#createTopicPopup').hide();
    });


    $('#backToForum').click(function() {
        $('#topic-detail').hide();
        $('#topics-container').show();
        $('#createTopic').show();
    });
    
    $('#submitNewTopic').click(function() {
        var title = $('#newTopicTitle').val();
        var message = $('#newTopicMessage').val();
        if(title && message) {
            createTopic(title, message);
            $('#createTopicPopup').hide();
        } else {
            alert("Veuillez remplir tous les champs.");
        }
    });

    $("#postMessage").click(function(){
// Sélectionner l'élément par son ID et récupérer la valeur de data-id
    var dataId = $('#topic-messages').data('id');
    postMessage(dataId);
    });
    function loadTopics() {
        $.ajax({
            type: 'GET',
            url: './index.php?controle=forum&action=getAllTopics',
            dataType: 'json',
            success: function(topics) {
                $('#topics-container').empty();

                topics.forEach(function(topic) {
                    $('#topics-container').append(
                        `<div class="topic-container" data-id="${topic.id_sujet}">
                            <h4>${topic.titre} - par ${topic.prenom} ${topic.nom} - créé le: ${convertirDate(topic.date_creation)}</h4>
                            <p>${topic.first_message}</p>
                        </div>`
                    );
                });
    
                $('.topic-container').click(function() {
                    var topicId = $(this).data('id');
                    loadTopicDetail(topicId);
                    $('#createTopic').hide(); // Cacher le bouton Créer un Sujet
                });
            }
        });
    }
    
    function loadTopicDetail(topicId) {
        $.ajax({
            type: 'GET',
            url: `./index.php?controle=forum&action=getInfoSpecificTopic&topicId=${topicId}`,
            dataType: 'json',
            success: function(messages) {
                console.log(messages);
                $('#topic-messages').empty();
                $('#topic-messages').data('id', topicId);
                $('#topic-messages').append(
                   `<h4>${messages[0].titre} - par ${messages[0].prenom} ${messages[0].nom} - créé le: ${convertirDate(messages[0].date_creation)}`
                );
                loadMessagesTopicDetail(topicId);
                $('#topics-container').hide();
                $('#topic-detail').show();
            }
        });
    }
    function loadMessagesTopicDetail(topicId) {
        $.ajax({
            type: 'GET',
            url: `./index.php?controle=forum&action=getMessagesByTopic&topicId=${topicId}`,
            dataType: 'json',
            success: function(messages) {
                console.log(messages);
                messages.forEach(function(message, index) {
                    let messageClass = index === 0 ? 'first-message' : 'message-item';
                    $('#topic-messages').append(
                        `<div class="${messageClass}">
                            <h5>${message.prenom} ${message.nom} : ${convertirDate(message.date_creation)}</h5>
                            <p>${message.contenu}</p>
                        </div>`
                    );
                });
            }
        });
    }

    // Poste un nouveau message dans un sujet
    function postMessage(topicId) {
        var messageContent = $('#newMessage').val();
        if (messageContent.trim() !== '') {
            $.ajax({
                type: 'POST',
                url: './index.php?controle=forum&action=postMessage',
                data: { content: messageContent, topicId: topicId },
                dataType: 'json',
                success: function(response) {
                    if (response.success) {
                        $('#newMessage').val('');
                        loadTopicDetail(topicId);
                    } else {
                        alert('Erreur lors de l\'envoi du message.');
                    }
                }
            });
        } else {
            alert('Veuillez saisir un message.');
        }
    }

    // Crée un nouveau sujet
    function createTopic(title, message) {
        $.ajax({
            type: 'POST',
            url: './index.php?controle=forum&action=createTopic',
            data: { title: title, message: message },
            dataType: 'json',
            success: function(response) {
                if (response.success) {
<<<<<<< Updated upstream
=======
                    $('#newTopicTitle').val('');
                    $('#newTopicMessage').val('');
>>>>>>> Stashed changes
                    loadTopics();

                } else {
                    alert('Erreur lors de la création du sujet.');
                }
            }
        });
    }
});

function convertirDate(dateSQL){
    // Exemple de date au format MySQL

// Convertir en objet Date JavaScript
var date = new Date(dateSQL);

// Convertir en format souhaité
var formattedDate = date.toLocaleString('fr-FR', {
    year: 'numeric',
    month: '2-digit',
    day: '2-digit',
    hour: '2-digit',
    minute: '2-digit',
    second: '2-digit'
}).replace(/\//g, '-'); // Remplacer les / par
return formattedDate;
}