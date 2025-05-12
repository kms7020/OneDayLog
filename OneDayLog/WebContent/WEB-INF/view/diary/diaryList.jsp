<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
        
        <!-- 정렬 방식 드롭다운 -->
		<form action="diaryList.action" method="get" style="text-align: right; margin-bottom: 20px;">
		    <select name="order" onchange="this.form.submit()" style="padding: 6px; font-size: 14px;">
		        <option value="asc" ${param.order == 'asc' ? 'selected' : ''}>날짜 빠른 순</option>
		        <option value="desc" ${param.order == 'desc' ? 'selected' : ''}>날짜 늦은 순</option>
		    </select>
		</form>

        <!-- 일기 리스트 반복 출력 -->
        <c:forEach var="diary" items="${diaryList}">
            <div class="diary-entry">
                <!-- 삭제 버튼 -->
                <button class="delete-btn" title="삭제하기" onclick="confirmDelete('${diary.diaryId}')">×</button>

				<!-- 수정 버튼 -->
				<a class="edit-btn" title="수정하기" href="diaryUpdateForm.action?diaryId=${diary.diaryId}">✏</a>

                <!-- 일기 날짜 -->
                <div class="diary-date">
				    <fmt:formatDate value="${diary.diaryDate}" pattern="yyyy년 M월 d일 (E) a h:mm" />
				</div>

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
