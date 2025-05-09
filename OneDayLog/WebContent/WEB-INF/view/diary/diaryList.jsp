<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/view/common/header.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>OneDayLog - 일기 목록</title>
<script src="${pageContext.request.contextPath}/js/main.js" defer></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/onedaylog-style.css">
<script src="${pageContext.request.contextPath}/js/onedaylog-script.js" defer></script>
</head>
<body>

	<div class="container">
		<h2>📘 일기 목록</h2>

		<c:forEach var="diary" items="${diaryList}">
			<div class="diary-entry">
				<button class="delete-btn" onclick="confirmDelete('${diary.diaryId}')">×</button>
				<div class="diary-date">${diary.diaryDate}</div>
				<div class="diary-content">${diary.content}</div>
			</div>
		</c:forEach>


		<div class="btn-group">
			<a class="btn" href="diaryWrite.action">✍ 새 일기 작성</a> <a
				class="btn btn-back" href="main.action">← 메인으로</a>
		</div>
	</div>

</body>
</html>
