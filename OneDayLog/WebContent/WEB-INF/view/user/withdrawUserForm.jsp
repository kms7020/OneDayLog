<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/view/common/header.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>OneDayLog - 회원탈퇴</title>

    <!-- 공통 CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/onedaylog-style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">

    <!-- 웹폰트 -->
    <link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Noto+Sans+KR&display=swap" rel="stylesheet">

    <!-- JS -->
    <script src="${pageContext.request.contextPath}/js/onedaylog-script.js" defer></script>
    <script src="${pageContext.request.contextPath}/js/user.js" defer></script>
</head>
<body>

<div class="container mypage-container">
    <h2 class="mypage-title">❗ 회원 탈퇴 확인</h2>

    <div class="mypage-card custom-rounded-card" style="max-width: 700px; margin: 0 auto; padding: 48px; display: flex; flex-direction: column; align-items: center; justify-content: center; gap: 24px;">
        <p style="text-align: center;">정말로 <strong>회원 탈퇴</strong>를 진행하시겠습니까?</p>
        <p style="text-align: center;"><strong>탈퇴 후 복구는 불가능합니다.</strong></p>

        <form action="withdrawUser.action" method="post" style="display: flex; gap: 16px;">
            <button type="submit" class="btn btn-danger">탈퇴하기</button>
            <a href="mypage.action" class="btn btn-gray">취소</a>
        </form>
    </div>
</div>

</body>
</html>
