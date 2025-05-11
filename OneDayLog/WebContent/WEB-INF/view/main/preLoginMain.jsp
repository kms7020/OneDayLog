<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/view/common/header.jsp" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>OneDayLog - 환영합니다</title>

    <%-- 스타일 시트 링크 --%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">

    <%-- 웹 폰트: Gowun Dodum & Noto Sans KR --%>
    <link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Noto+Sans+KR&display=swap" rel="stylesheet">

    <%-- JavaScript: 기능 스크립트 --%>
    <script src="${pageContext.request.contextPath}/js/onedaylog-script.js" defer></script>
    <script src="${pageContext.request.contextPath}/js/main.js" defer></script>
    <script src="${pageContext.request.contextPath}/js/admin.js" defer></script>
</head>

<body>

    <%-- 인트로 페이지 전체 영역 --%>
    <div class="intro-page">

        <%-- 왼쪽 텍스트 영역 --%>
        <div class="intro-content">
            <h1 class="intro-logo">OneDayLog</h1>
            <h2 class="intro-title">하루를 남기는 습관</h2>
            <p class="intro-desc">D-Day부터 ToDoList, 나만의 한 줄 일기까지.</p>
            <p class="intro-desc">기억을 모으는 공간, 여기서 시작해보세요.</p>
            <a href="login.action" class="btn intro-btn">로그인 하러가기</a>
        </div>

        <%-- 오른쪽 이미지 영역 --%>
        <div class="intro-image">
            <img src="${pageContext.request.contextPath}/img/intro-visual.png" alt="intro" />
        </div>

    </div>
		<!-- 관리자 로그인 floating 버튼 -->
		<a href="#" class="admin-login-float" onclick="openAdminModal(); return false;">👑 관리자</a>
		<!-- 관리자 비밀번호 입력 모달 -->
<div id="adminPasswordModal" class="modal">
  <div class="modal-box">
    <h3 class="modal-title">👑 관리자 비밀번호 입력</h3>
    <input type="password" id="adminSecretInput" placeholder="비밀번호 입력" class="modal-input" />
    <div class="modal-buttons">
      <button class="btn btn-yellow" onclick="checkAdminSecret()">확인</button>
      <button class="btn btn-gray" onclick="closeAdminModal()">취소</button>
    </div>
  </div>
</div>

</body>
</html>
