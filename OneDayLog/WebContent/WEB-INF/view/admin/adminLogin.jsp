<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/view/common/header.jsp"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>관리자 로그인 - OneDayLog</title>

  <%-- 스타일 시트 --%>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login-style.css">
  <link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Noto+Sans+KR&display=swap" rel="stylesheet">

  <%-- 스크립트 --%>
  <script src="${pageContext.request.contextPath}/js/main.js" defer></script>
  <script src="${pageContext.request.contextPath}/js/onedaylog-script.js" defer></script>
</head>
<body>
    <div class="login-wrapper">
        <div class="container">
	        <%-- 홈으로 이동 버튼 --%>
			<a href="preLoginMain.action" class="back-button" title="홈으로">&#x21A9;</a>
            <h2>관리자 로그인</h2>
            <form action="${pageContext.request.contextPath}/adminLogin.action" method="post">
                <input type="text" name="adminId" placeholder="관리자 ID" required>
                <input type="password" name="adminPw" placeholder="비밀번호" required>
                <button type="submit" class="btn">로그인</button>
            </form>
            <c:if test="${not empty error}">
                <div style="color:red; margin-top: 10px;">${error}</div>
            </c:if>
        </div>
    </div>
</body>
</html>
