<?php

function forum(){
    require("./controle/function.php");
    require("./vue/navbar/navbar.tpl");
    require("./vue/forum/forum.tpl");
    require("./vue/footer/footer.tpl");
}
require_once('./modele/forumBD.php');

function getAllTopics() {
    $topics = getAllTopicsBD();
    echo json_encode($topics);
}

function getMessagesByTopic() {
    $topicId = isset($_GET['topicId']) ? $_GET['topicId'] : 0;
    $messages = getMessagesByTopicBD($topicId);
    echo json_encode($messages);
}

function getInfoSpecificTopic() {
    $topicId = isset($_GET['topicId']) ? $_GET['topicId'] : 0;
    $topicInfo = getInfoSpecificTopicBD($topicId);
    echo json_encode($topicInfo);
}

function createTopic() {
    $title = isset($_POST['title']) ? $_POST['title'] : '';
    $userId = isset($_SESSION['id']) ? $_SESSION['id'] : 0; // Assurez-vous que l'utilisateur est connecté
    $message = isset($_POST['message']) ? $_POST['message'] : '';
    $topicId = createTopicBD($title, $userId);
    postMessageBD($topicId, $userId, $message);
    echo json_encode(['success' => $topicId !== false, 'topicId' => $topicId]);
}

function postMessage() {
    $topicId = isset($_POST['topicId']) ? $_POST['topicId'] : 0;
    $content = isset($_POST['content']) ? $_POST['content'] : '';
    $userId = isset($_SESSION['id']) ? $_SESSION['id'] : 0; // Assurez-vous que l'utilisateur est connecté
    $success = postMessageBD($topicId, $userId, $content);
    echo json_encode(['success' => $success]);
}

?>