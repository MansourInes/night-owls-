<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Forum</title>
    <link rel="stylesheet" href="./vue/forum/assets/forum.css">
</head>
<body>
    <div id="forum">
        <button id="createTopic">Créer un sujet</button>
        <div id="topics-container">
            <!-- Les sujets seront chargés ici -->
        </div>
        <div id="topic-detail" style="display:none;">
            <button id="backToForum">Retour au Forum</button>
            <div id="topic-messages">
                <!-- Les messages du sujet sélectionné seront chargés ici -->
            </div>
            <textarea id="newMessage" placeholder="Votre message..."></textarea>
            <button id="postMessage">Envoyer le Message</button>
        </div>
        
        <!-- Pop-up pour créer un sujet -->
        <div id="createTopicPopup" class="popupForum">
            <div class="popup-contentForum">
                <span class="closeForum">&times;</span>
                <h2>Créer un nouveau sujet</h2>
                <input type="text" id="newTopicTitle" placeholder="Titre du sujet">
                <textarea id="newTopicMessage" maxlength=5000 cols="10" rows=10  placeholder="Message"></textarea>
                <button id="submitNewTopic">Créer le Sujet</button>
            </div>
        </div>

    </div>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="./vue/forum/assets/forum.js"></script>
</body>
</html>
