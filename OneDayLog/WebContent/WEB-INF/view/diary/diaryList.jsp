<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>OneDayLog - 일기장</title>
    <link rel="stylesheet" href="css/main.css">
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #f2f2f2;
            padding: 30px;
        }

        .container {
            max-width: 800px;
            margin: 0 auto;
            background-color: white;
            border-radius: 12px;
            padding: 40px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
        }

        h2 {
            margin-bottom: 30px;
            text-align: center;
        }

        .diary-entry {
            padding: 20px;
            border-bottom: 1px solid #ccc;
        }

        .diary-entry:last-child {
            border-bottom: none;
        }

        .diary-date {
            font-weight: bold;
            margin-bottom: 10px;
        }

        .diary-content {
            color: #555;
        }

        .btn-write {
            display: block;
            margin: 30px auto 0;
            width: 200px;
            padding: 15px;
            background-color: #007bff;
            color: white;
            text-align: center;
            text-decoration: none;
            border-radius: 8px;
            font-size: 16px;
        }

        .btn-write:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>📘 일기 목록</h2>

    <!-- 예시로 넣은 일기들, 실제로는 DB 연동 -->
    <div class="diary-entry">
        <div class="diary-date">2025-05-08</div>
        <div class="diary-content">오늘은 프로젝트를 시작한 날이다. 이름은 OneDayLog로 정했다.</div>
    </div>

    <div class="diary-entry">
        <div class="diary-date">2025-05-07</div>
        <div class="diary-content">요즘 애니와 게임에 흥미가 줄어들고 있다. 이유가 뭘까?</div>
    </div>

    <a class="btn-write" href="diaryWrite.jsp">✍ 새 일기 작성</a>
</div>

</body>
</html>
