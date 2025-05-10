<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/view/common/header.jsp" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>OneDayLog - 일기 목록</title>

    <!-- 자바스크립트 파일 -->
    <script src="${pageContext.request.contextPath}/js/main.js" defer></script>
    <script src="${pageContext.request.contextPath}/js/onedaylog-script.js" defer></script>

    <!-- 공통 스타일시트 -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/onedaylog-style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">

    <!-- 웹폰트 -->
    <link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Noto+Sans+KR&display=swap" rel="stylesheet">
</head>

<body>

    <div class="container">
        <!-- 페이지 제목 -->
        <h2>📘 일기 목록</h2>

        <!-- 일기 리스트 반복 출력 -->
        <c:forEach var="diary" items="${diaryList}">
            <div class="diary-entry">
                <!-- 삭제 버튼 -->
                <button class="delete-btn" onclick="confirmDelete('${diary.diaryId}')">×</button>

                <!-- 일기 날짜 -->
                <div class="diary-date">${diary.diaryDate}</div>

                <!-- 일기 내용 -->
                <div class="diary-content">${diary.content}</div>
            </div>
        </c:forEach>

        <!-- 새 일기 작성 및 홈으로 이동 버튼 -->
        <div class="btn-group">
            <a class="btn" href="diaryWrite.action">✍ 새 일기 작성</a>
            <a class="btn btn-back" href="main.action">홈으로</a>
        </div>
    </div>

</body>
</html>
