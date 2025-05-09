<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/view/common/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>OneDayLog - 새 리스트 추가</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/onedaylog-style.css">
<script src="${pageContext.request.contextPath}/js/onedaylog-script.js" defer></script>
<script src="${pageContext.request.contextPath}/js/main.js" defer></script>
</head>
<body>

	<div class="container">
		<h2>🆕 새 리스트 추가</h2>
		<form action="todoWrite.action" method="post">
			<div class="form-group">
				<input type="text" name="task" placeholder="할 일을 입력해주세요." required />
			</div>

			<div class="form-group">
				<label for="category">카테고리 선택</label> <select name="category"
					id="category" required>
					<option value="">-- 선택해주세요 --</option>
					<option value="today">오늘 할 일</option>
					<option value="tomorrow">내일 할 일</option>
					<option value="later">나중에 할 일</option>
				</select>
			</div>

			<div class="btn-group">
				<button type="submit" class="btn btn-submit">저장</button>
				<a href="javascript:history.back();" class="btn btn-back">뒤로가기</a>
			</div>
		</form>
	</div>

</body>
</html>
