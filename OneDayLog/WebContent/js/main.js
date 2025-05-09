document.addEventListener('DOMContentLoaded', function () {
    const darkModeToggle = document.getElementById('darkModeToggle');
    const currentMode = localStorage.getItem('theme');

    if (currentMode === 'dark') {
        document.body.classList.add('dark');
    }

    if (darkModeToggle) {
        darkModeToggle.addEventListener('click', () => {
            document.body.classList.toggle('dark');
            const newMode = document.body.classList.contains('dark') ? 'dark' : 'light';
            localStorage.setItem('theme', newMode);
        });
    }
});
