<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/view/common/header.jsp"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>OneDayLog - 새 일기 작성</title>

    <!-- 스타일시트 -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/onedaylog-style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">

    <!-- 웹폰트 -->
    <link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Noto+Sans+KR&display=swap" rel="stylesheet">

    <!-- 공통 스크립트 -->
    <script src="${pageContext.request.contextPath}/js/onedaylog-script.js" defer></script>
</head>
<body>

    <div class="container">
        <!-- 일기 작성 제목 -->
        <h2>✍ 오늘의 일기 작성</h2>

        <!-- 일기 저장 폼 -->
        <form action="diaryWrite.action" method="post">
            
            <!-- 일기 입력 영역 -->
            <textarea name="content" placeholder="오늘 하루를 기록해보세요."></textarea>
            
            <!-- 저장 & 취소 버튼 -->
            <div class="btn-group">
                <button type="submit" class="btn">저장</button>
                <a href="diaryList.action" class="btn btn-back">취소</a>
            </div>
        </form>
    </div>

</body>
</html>
