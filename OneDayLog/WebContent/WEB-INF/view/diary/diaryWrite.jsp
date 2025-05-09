<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/view/common/header.jsp"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>OneDayLog - 새 일기 작성</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/onedaylog-style.css">
<script src="${pageContext.request.contextPath}/js/onedaylog-script.js" defer></script>
</head>
<body>

	<div class="container">
		<h2>✍ 오늘의 일기 작성</h2>
		<form action="diaryWrite.action" method="post">
			<textarea name="content" placeholder="오늘 하루를 기록해보세요."></textarea>
			<div class="btn-group">
				<button type="submit" class="btn">저장</button>
				<a href="diaryList.action" class="btn btn-back">← 목록으로</a>
			</div>
		</form>
	</div>

</body>
</html>
