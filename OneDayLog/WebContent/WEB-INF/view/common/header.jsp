<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<header style="background-color:#fff; border-bottom:1px solid #e5e7eb; padding:20px 40px; display:flex; justify-content:space-between; align-items:center;">
    <h1 style="margin:0; font-size:24px; color:#111827; font-family: 'Gowun Dodum', sans-serif;">
        <a href="main.action" style="text-decoration: none; color: inherit;">OneDayLog</a>
    </h1>
    <div class="user-info" style="display: flex; align-items: center; gap: 12px; font-size: 15px; color: #374151; font-family: 'Noto Sans KR', sans-serif;">
        <c:choose>
            <c:when test="${not empty sessionScope.user_name}">
                <a href="mypage.action" style="text-decoration: none; color: inherit;">
				    <span>👤 <strong style="color:#111;">${sessionScope.user_name}</strong> 님 환영합니다!</span>
				</a>
                <a href="logout.action" class="user-btn">로그아웃</a>
            </c:when>
            <c:otherwise>
                <a href="login.action" class="user-btn">로그인</a>
            </c:otherwise>
        </c:choose>
        <button id="darkModeToggle" class="toggle-mode user-btn secondary">🌗 다크모드</button>
    </div>
</header>
