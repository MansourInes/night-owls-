// theme-switcher.js
function toggleTheme() {
    const body = document.body;
    body.classList.toggle('dark-theme');

    // Stockez l'état du thème dans le stockage local
    const isDarkTheme = body.classList.contains('dark-theme');
    localStorage.setItem('darkTheme', isDarkTheme);
}

// Recherchez tous les liens avec la classe "a-header" et href contenant "action=switch"
const themeSwitchLinks = document.querySelectorAll('a.a-header[href*="action=switch"]');

// Récupérez l'état du thème dans le stockage local
const isDarkThemeStored = localStorage.getItem('darkTheme');
if (isDarkThemeStored === 'true') {
    // Si le thème sombre est stocké, ajoutez la classe
    document.body.classList.add('dark-theme');
}

// Ajoutez un gestionnaire d'événements à chaque lien
themeSwitchLinks.forEach(link => {
    link.addEventListener('click', (event) => {
        event.preventDefault(); // Empêche le comportement par défaut du lien
        toggleTheme();
    });
});
