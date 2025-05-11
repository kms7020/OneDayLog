<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/WEB-INF/view/common/header.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>OneDayLog - 비밀번호 확인</title>

    <!-- 자바스크립트 파일 -->
    <script src="${pageContext.request.contextPath}/js/main.js" defer></script>
    <script src="${pageContext.request.contextPath}/js/onedaylog-script.js" defer></script>

    <!-- 공통 스타일시트 -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/onedaylog-style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">

    <!-- 웹폰트 -->
    <link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Noto+Sans+KR&display=swap" rel="stylesheet">
</head>
<body>
<div class="container">
    <h2 style="text-align: center;">🔐 개인정보 수정 - 비밀번호 확인</h2>
    <form action="checkPassword.action" method="post">
        <c:if test="${not empty error}">
            <div class="error">${error}</div>
        </c:if>
        <label for="password">현재 비밀번호 입력</label>
        <input type="password" name="password" id="password" required>
        <button type="submit" class="btn">확인</button>
    </form>
</div>
</body>
</html>
