<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/view/common/header.jsp" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
    com.onedaylog.project.dto.DdayDTO dday = (com.onedaylog.project.dto.DdayDTO) request.getAttribute("dday");
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>D-Day 상세 보기</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/onedaylog-style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
	<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/js/onedaylog-script.js" defer></script>
</head>
<body>

<div class="container task-text">
    <h2>📅 <%= dday.getTitle() %></h2>

    <p><strong>일정 날짜:</strong> <%= sdf.format(dday.getTargetDate()) %></p>

    <p><strong>중요 표시:</strong> <%= dday.isImportant() ? "⭐" : "없음" %></p>

    <div class="btn-group">
        <a href="main.action" class="btn btn-back">← 홈으로</a>
        <a href="ddayList.action" class="btn">📋 목록으로</a>
    </div>
</div>

</body>
</html>
