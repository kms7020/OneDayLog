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

//애니메이션 효과 동적 적용 
document.addEventListener("DOMContentLoaded", function () {
	const importantItems = document.querySelectorAll(".important-move");
	const unimportantItems = document.querySelectorAll(".unimportant-move");

	importantItems.forEach(el => {
		el.classList.add("move-up");
	});
	unimportantItems.forEach(el => {
		el.classList.add("move-down");
	});
});
