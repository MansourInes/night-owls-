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


?>
