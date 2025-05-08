<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8" %>
<%@ page import="java.util.*, java.text.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>OneDayLog - D-Day 목록</title>
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

        .dday-entry {
            padding: 20px;
            border-bottom: 1px solid #ccc;
        }

        .dday-title {
            font-weight: bold;
            font-size: 18px;
        }

        .dday-date {
            color: #666;
            margin-top: 5px;
        }

        .dday-count {
            margin-top: 10px;
            font-size: 20px;
            color: #dc3545;
        }

        .btn-add {
            display: block;
            margin: 30px auto 0;
            width: 200px;
            padding: 15px;
            background-color: #ffc107;
            color: black;
            text-align: center;
            text-decoration: none;
            border-radius: 8px;
            font-size: 16px;
        }

        .btn-add:hover {
            background-color: #e0a800;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>📆 D-Day 목록</h2>

    <%
        class DdayItem {
            String title;
            String date;

            DdayItem(String title, String date) {
                this.title = title;
                this.date = date;
            }
        }

        // 테스트용 D-Day 목록
        List<DdayItem> ddayList = new ArrayList<>();
        ddayList.add(new DdayItem("면접일", "2025-05-20"));
        ddayList.add(new DdayItem("여행 출발", "2025-06-01"));

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date today = new Date();

        for (DdayItem item : ddayList) {
            Date ddayDate = sdf.parse(item.date);
            long diffMillis = ddayDate.getTime() - today.getTime();
            long diffDays = diffMillis / (1000 * 60 * 60 * 24);
    %>

    <div class="dday-entry">
        <div class="dday-title"><%= item.title %></div>
        <div class="dday-date">일정일: <%= item.date %></div>
        <div class="dday-count">
            <%
                if (diffDays > 0) {
                    out.print("D-" + diffDays);
                } else if (diffDays == 0) {
                    out.print("🎉 오늘!");
                } else {
                    out.print("D+" + Math.abs(diffDays));
                }
            %>
        </div>
    </div>

    <%
        }
    %>

    <a class="btn-add" href="ddayWrite.jsp">➕ D-Day 추가</a>
</div>

</body>
</html>
