<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/view/common/header.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 - OneDayLog</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/login-style.css">
	<link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Noto+Sans+KR&display=swap" rel="stylesheet">
<script src="${pageContext.request.contextPath}/js/onedaylog-script.js"
	defer></script>
<script src="${pageContext.request.contextPath}/js/main.js" defer></script>
</head>
<body>

	<div class="login-wrapper">
		<div class="container">
			<h2>로그인</h2>
			<form action="${pageContext.request.contextPath}/login.action"
				method="post">
				<input type="text" name="loginId" placeholder="아이디" required>
				<input type="password" name="password" placeholder="비밀번호" required>
				<button type="submit" class="btn">로그인</button>
			</form>

			<div style="text-align: center;">
				<a href="${pageContext.request.contextPath}/signup.action"
					class="btn-back">계정이 없으신가요? 회원가입</a>
			</div>
		</div>
	</div>

</body>
</html>
