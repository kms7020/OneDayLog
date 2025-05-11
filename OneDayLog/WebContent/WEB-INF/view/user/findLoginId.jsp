<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/view/common/header.jsp"%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>아이디 찾기 - OneDayLog</title>

  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login-style.css">
  <link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Noto+Sans+KR&display=swap" rel="stylesheet">
  <script src="${pageContext.request.contextPath}/js/main.js" defer></script>
  <script src="${pageContext.request.contextPath}/js/onedaylog-script.js" defer></script>
</head>

<body>
  <div class="login-wrapper">
    <div class="container">

      <%-- 로그인페이지 이동 버튼 --%>
      <a href="login.action" class="back-button" title="로그인 페이지">&#x21A9;</a>

      <%-- 제목 --%>
      <h2>아이디 찾기</h2>

      <%-- 입력 폼 --%>
      <form action="${pageContext.request.contextPath}/findLoginId.action" method="post">
        <input type="email" name="email" placeholder="가입한 이메일을 입력하세요." required>
        <button type="submit" class="btn">아이디 찾기</button>
      </form>

      <%-- 결과 메시지 --%>
      <c:if test="${not empty loginId}">
        <div class="result-msg">✅ 회원님의 아이디는 <strong>${loginId}</strong>입니다.</div>
      </c:if>

      <c:if test="${not empty error}">
        <div class="error-msg" style="color: red; margin-top: 10px;">⚠️ ${error}</div>
      </c:if>

      <%-- 하단 이동 링크 --%>
      <div style="text-align: center; margin-top: 20px;">
        <a href="${pageContext.request.contextPath}/login.action" class="btn-back">로그인 페이지로 이동</a>
        <a href="${pageContext.request.contextPath}/findPasswordForm.action" class="btn-back">비밀번호 찾기</a>
      </div>

    </div>
  </div>
</body>
</html>
