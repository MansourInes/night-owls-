// theme-switcher.js
function toggleTheme() {
    const body = document.body;
    body.classList.toggle('dark-theme');

    // Stockez l'état du thème dans le stockage local
    const isDarkTheme = body.classList.contains('dark-theme');
    localStorage.setItem('darkTheme', isDarkTheme);
}

// Récupérez l'état du thème dans le stockage local
const isDarkThemeStored = localStorage.getItem('darkTheme');
const themeSwitch = document.getElementById('themeSwitch');

if (isDarkThemeStored === 'true') {
    // Si le thème sombre est stocké, activez le switch
    themeSwitch.checked = true;
    document.body.classList.add('dark-theme');
}

// Ajoutez un gestionnaire d'événements au switch
themeSwitch.addEventListener('change', () => {
    toggleTheme();
});
