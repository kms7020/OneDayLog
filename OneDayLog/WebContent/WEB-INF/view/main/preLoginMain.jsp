<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/view/common/header.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>OneDayLog - 환영합니다</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/onedaylog-style.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
	<link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Noto+Sans+KR&display=swap" rel="stylesheet">
	<script src="${pageContext.request.contextPath}/js/onedaylog-script.js" defer></script>
	<script src="${pageContext.request.contextPath}/js/main.js" defer></script>
</head>
<body>
    <div class="container">
        <header style="padding: 20px 0; text-align: center;">
            <h1 style="font-size: 28px; color: #333;">OneDayLog</h1>
        </header>

        <div class="intro-box" style="text-align: center; margin-top: 80px;">
            <h2>하루를 기록하고, 관리하는 습관</h2>
            <p style="margin: 16px 0;">D-Day, 할 일, 일기를 간편하게 기록하세요.</p>
            <p style="margin-bottom: 24px;">회원가입 없이 둘러볼 수 있고, 로그인 후 저장도 가능합니다.</p>
            <a href="login.action" class="btn">로그인 하러가기</a>
        </div>
    </div>
</body>
</html>
