<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>OneDayLog - 할 일 리스트</title>
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

        ul.todo-list {
            list-style: none;
            padding: 0;
        }

        ul.todo-list li {
            padding: 15px 10px;
            border-bottom: 1px solid #ddd;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        ul.todo-list li:last-child {
            border-bottom: none;
        }

        .task-text {
            flex-grow: 1;
            margin-left: 10px;
            font-size: 16px;
        }

        .task-completed {
            text-decoration: line-through;
            color: gray;
        }

        .btn-add {
            display: block;
            margin: 30px auto 0;
            width: 200px;
            padding: 15px;
            background-color: #28a745;
            color: white;
            text-align: center;
            text-decoration: none;
            border-radius: 8px;
            font-size: 16px;
        }

        .btn-add:hover {
            background-color: #1e7e34;
        }
    </style>
    <script>
        function toggleTask(checkbox) {
            const textElement = checkbox.parentElement.querySelector('.task-text');
            if (checkbox.checked) {
                textElement.classList.add('task-completed');
            } else {
                textElement.classList.remove('task-completed');
            }
        }
    </script>
</head>
<body>

<div class="container">
    <h2>📝 오늘의 할 일</h2>

    <ul class="todo-list">
        <li>
            <input type="checkbox" onclick="toggleTask(this)">
            <span class="task-text">일기 쓰기</span>
        </li>
        <li>
            <input type="checkbox" onclick="toggleTask(this)">
            <span class="task-text">포트폴리오 정리</span>
        </li>
        <li>
            <input type="checkbox" onclick="toggleTask(this)">
            <span class="task-text">운동 30분 하기</span>
        </li>
    </ul>

    <a class="btn-add" href="todoWrite.jsp">➕ 새 할 일 추가</a>
</div>

</body>
</html>
