<?php

// Fonction pour afficher la page du forum
function forum() {
    require("./controle/function.php");
    require("./vue/navbar/navbar.tpl");
    require("./vue/forum/forum.tpl");
    require("./vue/footer/footer.tpl");
}

// Inclusion du modèle du forum
require_once('./modele/forumBD.php');

// Fonction pour récupérer tous les sujets
function getAllTopics() {
    $topics = getAllTopicsBD();
    echo json_encode($topics);
}

// Fonction pour récupérer les messages d'un sujet spécifique
function getMessagesByTopic() {
    $topicId = isset($_GET['topicId']) ? $_GET['topicId'] : 0;
    $messages = getMessagesByTopicBD($topicId);
    echo json_encode($messages);
}

// Fonction pour récupérer les informations d'un sujet spécifique
function getInfoSpecificTopic() {
    $topicId = isset($_GET['topicId']) ? $_GET['topicId'] : 0;
    $topicInfo = getInfoSpecificTopicBD($topicId);
    echo json_encode($topicInfo);
}

// Fonction pour créer un nouveau sujet
function createTopic() {
    $title = isset($_POST['title']) ? $_POST['title'] : '';
    $userId = isset($_SESSION['id']) ? $_SESSION['id'] : 0; // Assurez-vous que l'utilisateur est connecté
    $message = isset($_POST['message']) ? $_POST['message'] : '';
    $topicId = createTopicBD($title, $userId);
    postMessageBD($topicId, $userId, $message);
    echo json_encode(['success' => $topicId !== false, 'topicId' => $topicId]);
}

// Fonction pour poster un message dans un sujet
function postMessage() {
    $topicId = isset($_POST['topicId']) ? $_POST['topicId'] : 0;
    $content = isset($_POST['content']) ? $_POST['content'] : '';
    $userId = isset($_SESSION['id']) ? $_SESSION['id'] : 0; // Assurez-vous que l'utilisateur est connecté
    $success = postMessageBD($topicId, $userId, $content);
    echo json_encode(['success' => $success]);
}

?>
