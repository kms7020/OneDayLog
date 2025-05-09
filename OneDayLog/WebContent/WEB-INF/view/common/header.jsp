<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8" %>
<%
    String userName = (String) session.getAttribute("user_name");
    if (userName == null) {
        response.sendRedirect("login.action");
        return;
    }
%>

<header style="background-color:#fff; border-bottom:1px solid #e5e7eb; padding:20px 40px; display:flex; justify-content:space-between; align-items:center;">
    <h1 style="margin:0; font-size:24px; color:#111827;">
        <a href="main.action" style="text-decoration: none; color: inherit;">OneDayLog</a>
    </h1>
    <div class="user-info" style="font-size:14px; color:#374151;">
        <span>👤 <strong><%= userName %></strong> 님 환영합니다!</span>
        <a href="logout.action" style="margin-left:12px; color:#4f8dfd; text-decoration:none;">[로그아웃]</a>
        <button id="darkModeToggle" class="toggle-mode" style="margin-left:12px; background:none; border:none; cursor:pointer; font-size:14px;">🌗 다크모드 전환</button>
    </div>
</header>
