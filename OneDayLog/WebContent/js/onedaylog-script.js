document.addEventListener("DOMContentLoaded", function () {
    // 🌙 저장된 테마 적용
    const savedTheme = localStorage.getItem("theme");
    if (savedTheme === "dark") {
        document.body.classList.add("dark-mode");
    }

    // 🌙 다크모드 토글 버튼
    const toggleBtn = document.getElementById("darkModeToggle");
    if (toggleBtn) {
        toggleBtn.addEventListener("click", function () {
            document.body.classList.toggle("dark-mode");
            const isDark = document.body.classList.contains("dark-mode");
            localStorage.setItem("theme", isDark ? "dark" : "light");
        });
    }

    // ✅ 현재 메뉴 강조
    const currentPath = window.location.pathname;
    const navLinks = document.querySelectorAll(".nav-link");
    navLinks.forEach(link => {
        if (link.href.includes(currentPath)) {
            link.classList.add("active");
        }
    });

    // ✅ Flatpickr 초기화 (서버 날짜 연동 포함)
    ["#targetDate", "#diaryDate"].forEach(selector => {
        const input = document.querySelector(selector);
        if (input) {
            const defaultDate = input.dataset.defaultDate || 'today';

            const fp = flatpickr(input, {
            	dateFormat: 'Y-m-d H:i',
                enableTime: true,
                time_24hr: true,
                locale: 'ko',
                defaultDate: defaultDate,
                disableMobile: true
            });

            let isOpen = false;
            input.addEventListener('click', function () {
                isOpen ? fp.close() : fp.open();
                isOpen = !isOpen;
            });
        }
    });
}); 

// ✅ 일기 삭제 처리
function confirmDelete(diaryId) {
    console.log("📌 삭제 버튼 클릭됨. 전달된 diaryId:", diaryId);

    if (confirm("정말 삭제하시겠습니까?")) {
        const form = document.createElement('form');
        form.method = 'POST';
        form.action = 'diaryDelete.action';

        const input = document.createElement('input');
        input.type = 'hidden';
        input.name = 'diaryId';
        input.value = diaryId;

        form.appendChild(input);
        document.body.appendChild(form);
        form.submit();
    }
}

// ✅ 할일 삭제 처리
function confirmTodoDelete(todoId) {
    if (confirm("정말 삭제하시겠습니까?")) {
        const form = document.createElement("form");
        form.method = "POST";
        form.action = "todoDelete.action";

        const input = document.createElement("input");
        input.type = "hidden";
        input.name = "todoId";
        input.value = todoId;

        form.appendChild(input);
        document.body.appendChild(form);
        form.submit();
    }
}


function openEditModal(todoId, task) {
    document.getElementById("editTodoId").value = todoId;
    document.getElementById("editTaskInput").value = task;
    document.getElementById("editModal").style.display = "flex";
}

function closeEditModal() {
    document.getElementById("editModal").style.display = "none";
}
