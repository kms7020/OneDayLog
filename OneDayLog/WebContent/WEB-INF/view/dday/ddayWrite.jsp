<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/common/header.jsp"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>OneDayLog - D-Day 등록</title>

  <!-- 내부 JS & CSS -->
  <script src="${pageContext.request.contextPath}/js/main.js" defer></script>
  <script src="${pageContext.request.contextPath}/js/onedaylog-script.js" defer></script>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/onedaylog-style.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">

  <!-- 폰트 -->
  <link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Noto+Sans+KR&display=swap" rel="stylesheet">

  <!-- Flatpickr 날짜 선택기 -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
  <script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
  <script src="https://npmcdn.com/flatpickr/dist/l10n/ko.js"></script>
</head>

<body>
  <div class="container">
    <h2>📌 D-Day 등록</h2>

    <form action="ddayInsert.action" method="post">
      <!-- 제목 입력 -->
      <div class="field-group ">
        <label for="title">제목</label>
        <input type="text" id="title" name="title" required>
      </div>

      <!-- 날짜 입력 -->
      <div class="field-group">
        <label for="targetDate">목표 날짜</label>
        <input type="text" id="targetDate" name="targetDate" class="styled-date" placeholder="날짜 선택" required>
      </div>

      <!-- 버튼 그룹 -->
      <div class="btn-group" style="justify-content: center;">
        <button type="submit" class="btn">등록하기</button>
        <a href="ddayList.action" class="btn-back">취소</a>
      </div>
    </form>
  </div>

</body>
</html>
