document.addEventListener("DOMContentLoaded", function () {
    // 저장된 테마 상태 가져와 적용
    const savedTheme = localStorage.getItem("theme");
    if (savedTheme === "dark") {
        document.body.classList.add("dark-mode");
    }

    // 다크모드 토글 버튼 기능
    const toggleBtn = document.getElementById("darkModeToggle");
    if (toggleBtn) {
        toggleBtn.addEventListener("click", function () {
            document.body.classList.toggle("dark-mode");
            const isDark = document.body.classList.contains("dark-mode");
            localStorage.setItem("theme", isDark ? "dark" : "light");
        });
    }

    // 현재 메뉴 강조 (선택된 링크에 active 클래스 부여)
    const currentPath = window.location.pathname;
    const navLinks = document.querySelectorAll(".nav-link");
    navLinks.forEach(link => {
        if (link.href.includes(currentPath)) {
            link.classList.add("active");
        }
    });
});

// 일기 삭제 요청 처리
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

// 리스트 삭제 요청 처리
function confirmTodoDelete(todoId) {
	  if (confirm("정말 삭제하시겠습니까?")) {
	    const form = document.createElement("form");
	    form.method = "POST";
	    form.action = "todoDelete.action"; // 실제 요청 경로로 수정

	    const input = document.createElement("input");
	    input.type = "hidden";
	    input.name = "todoId"; // 컨트롤러가 받을 파라미터 이름과 일치시켜야 함
	    input.value = todoId;

	    form.appendChild(input);
	    document.body.appendChild(form);
	    form.submit();
	  }
	}
