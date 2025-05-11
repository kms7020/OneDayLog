<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/view/common/header.jsp"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>OneDayLog - 회원정보 수정</title>

<!-- 자바스크립트 파일 -->
<script src="${pageContext.request.contextPath}/js/main.js" defer></script>
<script src="${pageContext.request.contextPath}/js/onedaylog-script.js"defer></script>
<script src="${pageContext.request.contextPath}/js/user.js"defer></script>

<!-- 공통 스타일시트 -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/onedaylog-style.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/main.css">

<!-- 웹폰트 -->
<link
	href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Noto+Sans+KR&display=swap"
	rel="stylesheet">
</head>
<body>
	<div class="container">
		<h2 style="text-align: center;">✏️ 회원 정보 수정</h2>
		<form id="signupForm" action="updateUser.action" method="post">
			<label for="email">이메일</label> <input type="text" name="email"
				id="email" value="${user.email}" required> <label for="name">이름</label>
			<input type="text" name="name" id="name" value="${user.name}"
				required> <label for="password">새 비밀번호</label> <input
				type="password" name="password" id="password" required> <label
				for="confirmPassword">비밀번호 확인</label> <input type="password"
				id="confirmPassword" required>

			<div id="passwordError" style="margin-bottom: 15px; font-size: 14px;"></div>

			<button type="submit" class="btn">수정 완료</button>
			<a href="mypage.action" class="btn"">뒤로가기</a>
		</form>

	</div>
</body>
</html>
