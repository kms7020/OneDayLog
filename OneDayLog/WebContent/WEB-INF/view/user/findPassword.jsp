<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/view/common/header.jsp"%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>비밀번호 찾기 - OneDayLog</title>

  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login-style.css">
  <link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Noto+Sans+KR&display=swap" rel="stylesheet">
  <script src="${pageContext.request.contextPath}/js/main.js" defer></script>
  <script src="${pageContext.request.contextPath}/js/onedaylog-script.js" defer></script>
</head>

<body>
  <div class="login-wrapper">
    <div class="container">

      <a href="login.action" class="back-button" title="로그인 페이지">&#x21A9;</a>

      <h2>비밀번호 찾기</h2>

      <form action="${pageContext.request.contextPath}/resetPassword.action" method="post">
        <input type="text" name="loginId" placeholder="아이디" required>
        <input type="email" name="email" placeholder="이메일" required>
        <button type="submit" class="btn">임시 비밀번호 발송</button>
      </form>

      <c:if test="${not empty success}">
        <div class="result-msg" style="color: green;">✅ ${success}</div>
      </c:if>

      <c:if test="${not empty error}">
        <div class="error-msg" style="color: red;">⚠️ ${error}</div>
      </c:if>

      <div style="text-align: center; margin-top: 20px;">
        <a href="${pageContext.request.contextPath}/login.action" class="btn-back">로그인 페이지</a>
      </div>

    </div>
  </div>
</body>
</html>
