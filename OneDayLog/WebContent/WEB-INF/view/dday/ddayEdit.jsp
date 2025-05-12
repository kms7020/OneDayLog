<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/view/common/header.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>OneDayLog - D-Day 수정</title>

  <!-- 내부 JS & CSS -->
  <script src="${pageContext.request.contextPath}/js/main.js" defer></script>
  <script src="${pageContext.request.contextPath}/js/onedaylog-script.js" defer></script>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/onedaylog-style.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">

  <!-- 폰트 -->
  <link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Noto+Sans+KR&display=swap" rel="stylesheet">

  <!-- Flatpickr 날짜 선택기 -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
  <script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
  <script src="https://npmcdn.com/flatpickr/dist/l10n/ko.js"></script>
</head>

<body>
  <div class="container">
    <h2>✏️ D-Day 수정</h2>

    <form action="ddayEdit.action" method="post">
      <!-- ID 숨김 -->
      <input type="hidden" name="ddayId" value="<c:out value='${dday.ddayId}'/>" />

      <!-- 제목 -->
      <div class="field-group">
        <label for="title">제목</label>
        <input type="text" name="title" value="${dday.title}" required />
      </div>

      <!-- 날짜 -->
		<div class="field-group">
		  <label for="targetDate">목표 날짜</label>
			<input 
			  type="text" 
			  id="targetDate" 
			  name="targetDate" 
			  class="styled-date flatpickr-input"
			  value="<fmt:formatDate value='${dday.targetDate}' pattern='yyyy-MM-dd' />"
			  data-default-date="<fmt:formatDate value='${dday.targetDate}' pattern='yyyy-MM-dd' />"
			  required 
			  readonly
			/>
		</div>

      <!-- 버튼 -->
      <div class="btn-group" style="justify-content: center;">
        <button type="submit" class="btn">수정 완료</button>
        <a href="ddayList.action" class="btn-back">취소</a>
      </div>
    </form>
  </div>
</body>
</html>
