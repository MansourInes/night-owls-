<?php

function getMostPopularSong() {
    // URL de l'API Deezer
    $url = "https://deezerdevs-deezer.p.rapidapi.com/playlist/3155776842"; // Exemple de playlist, vous pouvez ajuster l'URL selon vos besoins

    // Paramètres de l'en-tête de la requête
    $headers = [
        "X-RapidAPI-Key: fad45f9feemsh48d5cab0adddc42p1d9b10jsnad61a7ac0749",
        "X-RapidAPI-Host: deezerdevs-deezer.p.rapidapi.com",
    ];

    // Configuration des options pour stream_context_create
    $options = [
        "http" => [
            "header" => implode("\r\n", $headers),
            "method" => "GET",
        ],
    ];

    // Création du contexte pour la requête
    $context = stream_context_create($options);

    // Récupération des données JSON depuis l'API Deezer
    $response = file_get_contents($url, false, $context);

    // Vérification des erreurs de la requête
    if ($response === false) {
        die('Erreur lors de la requête vers l\'API Deezer.');
    }

    // Conversion de la réponse JSON en tableau associatif
    $data = json_decode($response, true);

    // Obtention des informations sur la première piste de la playlist
    if (isset($data['tracks']['data'][0])) {
        $mostPopularSong = $data['tracks']['data'][0];

        // Récupération des informations nécessaires
        $songTitle = $mostPopularSong['title'];
        $songCover = $mostPopularSong['album']['cover'];
        
        // Retourne les informations au lieu de les afficher
        return [
            "title" => $songTitle,
            "cover" => $songCover,
        ];
    } else {
        // Retourne une indication qu'aucune piste n'a été trouvée
        return ["error" => "Aucune piste trouvée dans la playlist."];
    }
}
function getMostPopularSongCover(): string {
    $result = getMostPopularSong();

    if (isset($result["error"])) {
        return "<p>Error: " . $result["error"] . "</p>";
    } else {
        $html = "<div class='song-info'>";
        $html .= "<img src='" . $result["cover"] . "' alt='Song Cover'>";
        $html .= "<p>Title: " . $result["title"] . "</p>";
        $html .= "</div>";
        return $html;
    }
}
/**
 * Increments a counter stored in a text file and returns the updated value.
 *
 * @return int The updated value of the counter.
 */
function incrementerCompteur(): int {
    $fichier = "compteur.txt";
    $compteur = file_exists($fichier) ? (int)file_get_contents($fichier) : 0;
    $compteur++;
    file_put_contents($fichier, $compteur);
    return $compteur;
}

/*Fonction pour récuperer les evenement avec API */
define("SKIDDLE_API_KEY", "8c3ebc2e4824e41ee330d1512cb56b07"); 

function getNightClubEvents() {
    $url = "https://www.skiddle.com/api/v1/events/search/?api_key=" . SKIDDLE_API_KEY . "&eventcode=CLUB";

    $ch = curl_init();
    curl_setopt($ch, CURLOPT_URL, $url);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
    $response = curl_exec($ch);
    curl_close($ch);

    if ($response === false) {
        return ["error" => "Erreur lors de la requête vers l'API Skiddle."];
    }

    $data = json_decode($response, true);

    if (!empty($data['results'])) {
        return $data['results'];
    } else {
        return ["error" => "Aucun événement trouvé."];
    }
}

function showNightClubEvents(): string {
    $events = getNightClubEvents();

    if (isset($events["error"])) {
        return "<p>Error: " . $events["error"] . "</p>";
    } else {
        $html = "<section class='columns'>";

        foreach ($events as $event) {
            $eventName = $event['eventname'];
            $eventDate = $event['date']; // Vérifiez et formatez la date selon vos besoins
            $eventImage = $event['largeimageurl']; // URL de l'image
    
            // Mise en forme de chaque événement
            $html .= "<div class='ligne'>";
            $html .= "<a href='" . $event['link'] . "' target='_blank'>"; // Lien vers l'événement
            $html .= "<img src='" . $eventImage . "' alt='" . $eventName . "' />";
            $html .= "<p>" . $eventName . "</p>";
            $html .= "<button class='btn-reserver'>Plus d'infos</button>";
            $html .= "</a>";
            $html .= "</div>";
        }
    
        $html .= "</section>";
        return $html;
    }
}    

/*Fonction pour rechercher des soirée */
function rechercheEvenements(): string {
    // Récupérer les critères de recherche de l'utilisateur
    $nomEvenement = $_GET['nomEvenement'] ?? '';
    $ville = $_GET['ville'] ?? '';
    $date = $_GET['date'] ?? ''; // Format attendu: YYYY-MM-DD

    // Construire l'URL de l'API Skiddle avec les paramètres de recherche
    $url = "https://www.skiddle.com/api/v1/events/search/?api_key=" . SKIDDLE_API_KEY 
           . "&eventcode=CLUB&city=" . urlencode($ville) 
           . "&date=" . $date
           . "&keyword=" . urlencode($nomEvenement); // Ajout du paramètre de recherche par nom d'événement

    // Effectuer la requête à l'API Skiddle
    $ch = curl_init();
    curl_setopt($ch, CURLOPT_URL, $url);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
    $response = curl_exec($ch);
    curl_close($ch);

    if ($response === false) {
        return "<p>Erreur lors de la requête vers l'API Skiddle.</p>";
    }

    $data = json_decode($response, true);
    $result = "";

    // Vérifier si des événements sont disponibles et correspondant aux critères
    if (!empty($data['results'])) {
        foreach ($data['results'] as $event) {
            $eventName = $event['eventname'];
            $eventDate = $event['date']; // Vérifiez et formatez la date
            $eventImage = $event['largeimageurl'];

            // Mise en forme HTML pour chaque événement
            $result .= "<div class='event-container'>";
            $result .= "<img src='" . $eventImage . "' alt='Event Cover'>";
            $result .= "<p><strong>" . $eventName . "</strong></p>";
            $result .= "<p>Date: " . $eventDate . "</p>";
            $result .= "</div>";
        }
    } else {
        $result = "<p>Aucun événement trouvé pour les critères sélectionnés.</p>";
    }

    return $result;
}

?>



