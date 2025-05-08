<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8" %>
<%
    String userName = (String) session.getAttribute("user_name");
    if (userName == null) {
        response.sendRedirect("login.action");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>OneDayLog - 메인페이지</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #f9f9f9;
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 800px;
            margin: 100px auto;
            padding: 40px;
            background-color: white;
            border-radius: 16px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
            text-align: center;
        }
        h1 { margin-bottom: 10px; }
        .user-info {
            text-align: right;
            margin-bottom: 30px;
            font-size: 15px;
            color: #333;
        }
        .user-info a {
            margin-left: 10px;
            color: #007bff;
            text-decoration: none;
        }
        .user-info a:hover { text-decoration: underline; }
        .menu {
            display: flex;
            justify-content: space-around;
        }
        .menu a {
            display: block;
            padding: 20px;
            width: 180px;
            text-decoration: none;
            background-color: #007bff;
            color: white;
            border-radius: 10px;
            font-size: 18px;
            transition: background-color 0.3s;
        }
        .menu a:hover { background-color: #0056b3; }
        .dday-summary {
            margin-top: 50px;
            padding: 20px;
            background-color: #fff3cd;
            border: 1px solid #ffeeba;
            border-radius: 10px;
            text-align: left;
        }
        .dday-summary h3 { margin-bottom: 15px; color: #856404; }
        .dday-item { margin-bottom: 10px; font-size: 16px; }
        .dday-count { font-weight: bold; color: #dc3545; }
    </style>
</head>
<body>

<div class="container">
    <h1>OneDayLog</h1>
    <div class="user-info">
        👤 <strong><%= userName %></strong> 님 환영합니다!
        <a href="logout.action">[로그아웃]</a>
    </div>

    <div class="menu">
        <a href="diaryList.action">📘 일기장</a>
        <a href="todoList.action">📝 할 일 리스트</a>
        <a href="ddayList.action">📆 D-Day</a>
    </div>

    <div class="dday-summary">
        <h3>📆 가까운 D-Day</h3>
        <div class="dday-item">🧑‍💼 면접일 <span class="dday-count">D-12</span></div>
        <div class="dday-item">✈️ 여행 출발 <span class="dday-count">D-24</span></div>
    </div>
</div>

</body>
</html>
