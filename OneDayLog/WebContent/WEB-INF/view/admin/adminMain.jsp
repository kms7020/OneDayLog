<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/view/common/header.jsp" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>OneDayLog - 관리자 대시보드</title>

    <!-- CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/onedaylog-style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin.css">

    <!-- JS -->
    <script src="${pageContext.request.contextPath}/js/onedaylog-script.js?v=1" defer></script>
    <script src="js/todo.js"></script>
    <script src="${pageContext.request.contextPath}/js/user.js" defer></script>
</head>
<body>
<div class="admin-dashboard">
    <h2>🛠 관리자 대시보드</h2>

    <!-- 요약 정보 -->
    <div class="admin-overview">
        <div class="admin-stats-text">
            <p><strong>전체 사용자 :</strong> ${totalUsers}명</p>
            <p><strong>탈퇴 회원 :</strong> ${withdrawnUsers}명</p>
        </div>
        <div class="admin-menu-group">
            <a href="adminUserList.action" class="admin-menu-btn">사용자 조회</a>
            <a href="adminWithdrawnList.action" class="admin-menu-btn">탈퇴 회원 관리</a>
            
        </div>
    </div>
    
    <!-- 홈화면 버튼 -->
    <div class="admin-home-btn-wrap">
	    <a href="main.action" class="admin-home-btn">홈 화면</a>
	</div>

    <!-- 로그아웃 버튼 -->
    <div class="admin-logout-box">
        <a href="adminLogout.action" class="admin-logout-btn">로그아웃</a>
    </div>
</div>
</body>
</html>
