document.addEventListener('DOMContentLoaded', function () {
    const loginIdInput = document.getElementById('loginId');
    const emailInput = document.getElementById('email');
    const loginIdMsg = document.getElementById('loginIdMsg');
    const emailMsg = document.getElementById('emailMsg');
    const passwordInput = document.getElementById('password');
    const confirmPasswordInput = document.getElementById('confirmPassword');
    const passwordError = document.getElementById('passwordError');
    
    const profileUpload = document.getElementById("profileUpload");
    const modal = document.getElementById("profileModal");
    const modalImg = document.getElementById("modalImage");
    const closeBtn = document.querySelector(".modal .close");
    const profileTrigger = document.getElementById("profileImageTrigger");

    // ✅ 프로필 이미지 클릭 시 모달 열기 (이벤트 위임 방식)
    if (profileTrigger && modal && modalImg && closeBtn != null) {
        profileTrigger.addEventListener("click", function (event) {
            const img = event.target.closest("img");
            if (img) {
                console.log("이미지 클릭됨", img.src);
                modal.style.display = "block";
                modalImg.src = img.src;
            }
        });

        closeBtn.addEventListener("click", function () {
            modal.style.display = "none";
        });

        window.addEventListener("click", function (event) {
            if (event.target === modal) {
                modal.style.display = "none";
            }
        });
    }

    // ✅ 프로필 미리보기
    if (profileUpload) {
        profileUpload.addEventListener("change", function (e) {
            const file = e.target.files[0];
            if (!file) return;

            const reader = new FileReader();
            reader.onload = function (event) {
                const box = document.querySelector(".profile-image");
                box.innerHTML = `<img src="${event.target.result}" alt="미리보기">`;
                // ❌ 이제 여기서 따로 addEventListener 안 걸어도 됨
            };
            reader.readAsDataURL(file);
        });
    }

    // 로그인 아이디 입력 시 메시지 안내
    if (loginIdInput) {
        loginIdInput.addEventListener('input', () => {
            if (loginIdInput.value.trim() === '') {
                loginIdMsg.textContent = '';
                loginIdMsg.style.display = 'none';
            } else {
                loginIdMsg.textContent = '⚠️ 중복확인을 해주세요.';
                loginIdMsg.style.color = 'orange';
                loginIdMsg.style.display = 'block';
            }
        });
    }

    // 이메일 입력 시 메시지 안내
    if (emailInput) {
        emailInput.addEventListener('input', () => {
            if (emailInput.value.trim() === '') {
                emailMsg.textContent = '';
                emailMsg.style.display = 'none';
            } else {
                emailMsg.textContent = '⚠️ 중복확인을 해주세요.';
                emailMsg.style.color = 'orange';
                emailMsg.style.display = 'block';
            }
        });
    }

    // 비밀번호 유효성 + 일치 여부 확인
    function validatePasswords() {
        const password = passwordInput.value.trim();
        const confirmPassword = confirmPasswordInput.value.trim();

        if (!password || !confirmPassword) {
            passwordError.textContent = '';
            passwordError.style.display = 'none';
            return;
        }

        if (password.length < 6) {
            passwordError.textContent = '❌ 비밀번호는 최소 6자 이상이어야 합니다.';
            passwordError.style.color = 'red';
            passwordError.style.display = 'block';
            return;
        }

        if (password !== confirmPassword) {
            passwordError.textContent = '❌ 비밀번호가 일치하지 않습니다.';
            passwordError.style.color = 'red';
            passwordError.style.display = 'block';
        } else {
            passwordError.textContent = '✅ 비밀번호가 일치합니다.';
            passwordError.style.color = 'green';
            passwordError.style.display = 'block';
        }
    }

    if (passwordInput && confirmPasswordInput && passwordError) {
        passwordInput.addEventListener('input', validatePasswords);
        confirmPasswordInput.addEventListener('input', validatePasswords);
    }

    // 최종 제출 시에도 유효성 체크
    const signupForm = document.getElementById('signupForm');
    if (signupForm) {
        signupForm.addEventListener('submit', function (e) {
            const password = passwordInput.value.trim();
            const confirmPassword = confirmPasswordInput.value.trim();

            if (password.length < 6) {
                e.preventDefault();
                passwordError.textContent = '❌ 비밀번호는 최소 6자 이상이어야 합니다.';
                passwordError.style.color = 'red';
                passwordError.style.display = 'block';
                return;
            }

            if (password !== confirmPassword) {
                e.preventDefault();
                passwordError.textContent = '❌ 비밀번호가 일치하지 않습니다.';
                passwordError.style.color = 'red';
                passwordError.style.display = 'block';
            }
        });
    }
});

// 아이디 중복 확인
function checkLoginId() {
    const loginId = document.getElementById('loginId').value.trim();
    const loginIdMsg = document.getElementById('loginIdMsg');

    if (!loginId) {
        loginIdMsg.textContent = '⚠️ 아이디를 입력해주세요.';
        loginIdMsg.style.color = 'orange';
        loginIdMsg.style.display = 'block';
        return;
    }

    fetch(`${contextPath}/checkLoginId.action?loginId=${encodeURIComponent(loginId)}`)
        .then(res => res.text())
        .then(data => {
        	if (data === 'withdrawn') {
        	    loginIdMsg.textContent = '⚠️ 탈퇴한 계정의 아이디는 재사용할 수 없습니다.';
        	    loginIdMsg.style.color = 'orange';
        	}else if (data === 'duplicate') {
                loginIdMsg.textContent = '❌ 이미 사용 중인 아이디입니다.';
                loginIdMsg.style.color = 'red';
            } else {
                loginIdMsg.textContent = '✅ 사용 가능한 아이디입니다.';
                loginIdMsg.style.color = 'green';
            }
            loginIdMsg.style.display = 'block';
        });
}

// 이메일 중복 확인
function checkEmail() {
    const email = document.getElementById('email').value.trim();
    const emailMsg = document.getElementById('emailMsg');
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

    if (!email) {
        emailMsg.textContent = '⚠️ 이메일을 입력해주세요.';
        emailMsg.style.color = 'orange';
        emailMsg.style.display = 'block';
        return;
    }

    if (!emailRegex.test(email)) {
        emailMsg.textContent = '❌ 올바른 이메일 형식이 아닙니다.';
        emailMsg.style.color = 'red';
        emailMsg.style.display = 'block';
        return;
    }

    fetch(`${contextPath}/checkEmail.action?email=${encodeURIComponent(email)}`)
        .then(res => res.text())
        .then(data => {
        	if (data === 'withdrawn') {
        		emailMsg.textContent = '⚠️ 탈퇴한 계정의 이메일는 재사용할 수 없습니다.';
        		emailMsg.style.color = 'orange';
        	}
        	else if (data === 'duplicate') {
                emailMsg.textContent = '❌ 이미 사용 중인 이메일입니다.';
                emailMsg.style.color = 'red';
            } else {
                emailMsg.textContent = '✅ 사용 가능한 이메일입니다.';
                emailMsg.style.color = 'green';
            }
            emailMsg.style.display = 'block';
        });
}






