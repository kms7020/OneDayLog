<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/view/common/header.jsp" %>
<%@ page import="java.text.SimpleDateFormat" %>

<%
    // 컨트롤러에서 전달받은 DdayDTO 객체를 가져옴
    com.onedaylog.project.dto.DdayDTO dday = 
        (com.onedaylog.project.dto.DdayDTO) request.getAttribute("dday");

    // 날짜 포맷 정의
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>D-Day 상세 보기</title>

    <!-- CSS 파일 -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/onedaylog-style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">

    <!-- 웹폰트 -->
    <link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Noto+Sans+KR&display=swap" rel="stylesheet">
    
    <!-- JS 파일 -->
    <script src="${pageContext.request.contextPath}/js/onedaylog-script.js" defer></script>
</head>

<body>

    <!-- D-Day 상세 내용 출력 영역 -->
    <div class="container task-text">

        <!-- D-Day 제목 -->
        <h2>📅 <%= dday.getTitle() %></h2>

        <!-- 목표 날짜 -->
        <p>
            <strong>일정 날짜:</strong> <%= sdf.format(dday.getTargetDate()) %>
        </p>

        <!-- 중요 여부 표시 -->
        <p>
            <strong>중요 표시:</strong> <%= dday.isImportant() ? "⭐" : "없음" %>
        </p>

        <!-- 버튼 그룹 -->
        <div class="btn-group">
            <a href="main.action" class="btn btn-back">홈으로</a>
            <a href="ddayList.action" class="btn">📋 목록으로</a>
        </div>

    </div>

</body>
</html>
