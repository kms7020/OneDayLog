<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/view/common/header.jsp"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>OneDayLog - 일기 수정</title>

    <!-- 스타일시트 -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/onedaylog-style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">

    <!-- 웹폰트 -->
    <link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Noto+Sans+KR&display=swap" rel="stylesheet">

    <!-- 공통 스크립트 -->
    <script src="${pageContext.request.contextPath}/js/onedaylog-script.js" defer></script>
    
	<!-- Flatpickr 날짜 선택기 -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
	<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
	<script src="https://npmcdn.com/flatpickr/dist/l10n/ko.js"></script>
</head>
<body>

<div class="container">
    <!-- 일기 수정 제목 -->
    <h2>📝 일기 수정</h2>

    <!-- 일기 수정 폼 -->
    <form action="diaryUpdate.action" method="post">
        	
        <!-- 숨겨진 일기 ID -->
        <input type="hidden" name="diaryId" value="${diary.diaryId}" />

        <!-- 작성일 표시 -->
		<div class="field-group">
		    <label for="diaryDate">작성일</label>
			<input 
			  type="text"
			  id="diaryDate"
			  name="diaryDate"
			  class="styled-date"
			  value="<fmt:formatDate value='${diary.diaryDate}' pattern='yyyy-MM-dd HH:mm:ss' />"
			  data-default-date="<fmt:formatDate value='${diary.diaryDate}' pattern='yyyy-MM-dd HH:mm:ss' />"
			  placeholder="날짜 및 시간 선택"
			  required
			/>
		</div>

        <!-- 일기 내용 수정 -->
        <div class="field-group">
            <label for="content">내용</label>
            <textarea id="content" name="content" placeholder="오늘 하루를 기록해보세요.">${diary.content}</textarea>
        </div>

        <!-- 저장 & 취소 버튼 -->
        <div class="btn-group">
            <button type="submit" class="btn">저장</button>
            <a href="diaryList.action" class="btn btn-back">취소</a>
        </div>
    </form>
</div>

</body>
</html>
