<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/view/common/header.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>OneDayLog - 메인페이지</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/onedaylog-style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
<script src="${pageContext.request.contextPath}/js/onedaylog-script.js" defer></script>
<script src="${pageContext.request.contextPath}/js/main.js" defer></script>
</head>
<body>

	<div class="container">
		<div class="menu-grid">
			<a href="diaryList.action" class="menu-button">📘 일기장</a> <a
				href="todoList.action" class="menu-button">📝 오늘의 리스트</a> <a
				href="ddayList.action" class="menu-button">📆 D-Day</a>
		</div>

		<div class="dday-box">
			<h3>📅 가까운 D-Day</h3>
			<div class="dday-item">
				🧑‍💼 면접일 <span class="dday-count">D-12</span>
			</div>
			<div class="dday-item">
				✈️ 여행 출발 <span class="dday-count">D-24</span>
			</div>
		</div>
	</div>

</body>
</html>
