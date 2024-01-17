
<!DOCTYPE html>
<html>
<head>
    <title>FAQ Page</title>
    <link rel="stylesheet" type="text/css" href="./vue/faq/assets/faq.css">
    <script src="./vue/faq/assets/faq_script.js"></script>
</head>
<body>

    <div id="faq-search-box">
        <input type="text" id="faq-search-input" placeholder="Barre de recherche FAQ">
        <button id="faq-search-button">Rechercher</button>
    </div>

<div id="no-results-message" style="display: none;">
  Désolé, je ne trouve rien qui correspond à votre recherche.
</div>

<div class="faq-container">
    <h1>Question fréquentes</h1>

    <div class="faq">
        <div class="question" onclick="toggleAnswer(this)">
            <h2>Qu'est-ce qu'Innov Tech et en quoi consiste votre service pour les boîtes de nuit?</h2>
        </div>
        <div class="answer" style="display:none;">
            <p>Innov Tech est une startup spécialisée dans la création de sites web personnalisés pour les boîtes de nuit. Nous proposons des fonctionnalités avancées, notamment une analyse sonore pour traiter le niveau sonore le plus influent lors des événements.</p>
        </div>
    </div>

    <div class="faq">
        <div class="question" onclick="toggleAnswer(this)">
            <h2>Comment fonctionne l'analyse sonore de votre système?</h2>
        </div>
        <div class="answer" style="display:none;">
            <p>Notre système utilise des technologies avancées d'analyse sonore pour évaluer et traiter le niveau sonore lors des événements. Il peut ajuster automatiquement le volume en temps réel pour créer une expérience sonore optimale.</p>
        </div>
    </div>

    <div class="faq">
        <div class="question" onclick="toggleAnswer(this)">
            <h2>Quels avantages notre boîte de nuit peut-elle tirer de l'analyse sonore proposée par Innov Tech?</h2>
        </div>
        <div class="answer" style="display:none;">
            <p>L'analyse sonore d'Innov Tech permet d'optimiser l'expérience sonore pour les clients tout en respectant les normes de sécurité acoustique. Cela peut contribuer à améliorer l'ambiance générale de la boîte de nuit.</p>
        </div>
    </div>

    <div class="faq">
        <div class="question" onclick="toggleAnswer(this)">
            <h2>Pouvons-nous personnaliser le site web créé par Innov Tech pour refléter l'identité de notre boîte de nuit?</h2>
        </div>
        <div class="answer" style="display:none;">
            <p>Absolument. Nous travaillons en étroite collaboration avec chaque client pour créer un site web qui correspond à l'identité unique de leur boîte de nuit. Des fonctionnalités personnalisées et des designs uniques sont disponibles.</p>
        </div>
    </div>

    <div class="faq">
        <div class="question" onclick="toggleAnswer(this)">
            <h2>Quels types d'événements inédits pouvez-vous aider à promouvoir sur notre site web?</h2>
        </div>
        <div class="answer" style="display:none;">
            <p>Innov Tech peut aider à promouvoir divers événements, tels que des soirées à thème, des performances artistiques, des DJ sets exclusifs, et bien plus encore. Nous adaptons le site web en fonction des besoins spécifiques de chaque événement.</p>
        </div>
    </div>

    <div class="faq">
        <div class="question" onclick="toggleAnswer(this)">
            <h2>Comment puis-je contacter le support client d'Innov Tech en cas de besoin?</h2>
        </div>
        <div class="answer" style="display:none;">
            <p>Vous pouvez nous contacter à tout moment par e-mail à night.owls.isep@gmail.com ou en utilisant le formulaire de contact sur notre site web. Notre équipe de support est là pour vous aider.</p>
        </div>
    </div>

</div>
<script src="./modele/theme-switcher.js"></script>
</body>
</html>
