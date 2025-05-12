<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*, java.text.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/view/common/header.jsp" %>
<%
    // 컨트롤러로부터 전달된 Dday 리스트를 가져옴
    List<com.onedaylog.project.dto.DdayDTO> ddayList = 
        (List<com.onedaylog.project.dto.DdayDTO>) request.getAttribute("ddayList");

    // 날짜 포맷 정의
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

    // 오늘 날짜를 자정 기준으로 초기화
    Calendar cal = Calendar.getInstance();
    cal.set(Calendar.HOUR_OF_DAY, 0);
    cal.set(Calendar.MINUTE, 0);
    cal.set(Calendar.SECOND, 0);
    cal.set(Calendar.MILLISECOND, 0);
    Date today = cal.getTime();
%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>OneDayLog - D-Day 목록</title>

    <!-- 스타일 시트 -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/onedaylog-style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">

    <!-- 웹폰트 -->
    <link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Noto+Sans+KR&display=swap" rel="stylesheet">

    <!-- 자바스크립트 -->
    <script src="${pageContext.request.contextPath}/js/main.js" defer></script>
    <script src="${pageContext.request.contextPath}/js/onedaylog-script.js" defer></script>
</head>

<body>

<div class="container">
    <!-- 타이틀 -->
    <h2>📅 D-Day 목록</h2>

    <!-- 정렬 방식 드롭다운 -->
    <form action="ddayList.action" method="get" style="text-align: right; margin-bottom: 20px;">
        <select name="order" onchange="this.form.submit()" style="padding: 6px; font-size: 14px;">
            <option value="asc" ${param.order == 'asc' ? 'selected' : ''}>날짜 빠른 순</option>
            <option value="desc" ${param.order == 'desc' ? 'selected' : ''}>날짜 늦은 순</option>
        </select>
    </form>

    <!-- D-Day 항목 반복 출력 -->
    <%
        for (com.onedaylog.project.dto.DdayDTO item : ddayList) {
            Date ddayDate = item.getTargetDate();
            long diffMillis = ddayDate.getTime() - today.getTime();
            long diffDays = diffMillis / (1000 * 60 * 60 * 24);

            // 날짜 차이에 따라 강조 색상 설정
            String highlightStyle = "";
            if (diffDays == 0) {
                highlightStyle = "color: #28a745; font-weight: bold;"; // 오늘
            } else if (diffDays > 0 && diffDays <= 3) {
                highlightStyle = "color: #dc3545; font-weight: bold;"; // 임박
            } else if (diffDays < 0) {
                highlightStyle = "color: #888;"; // 지난 날짜
            }
    %>

    <!-- 각 D-Day 카드 -->
    <div class="diary-entry task-text">

        <!-- 제목 -->
        <div class="dday-title" title="수정하기"style="font-size: 18px; font-weight: bold; margin-bottom: 6px;">
			<a href="ddayEdit.action?ddayId=<%= item.getDdayId() %>" style="text-decoration: none; color: inherit;">
				<%= item.getTitle() %>
			</a>
        </div>

        <!-- 일정일 -->
        <div class="dday-date" style="color: var(--subtext); margin-bottom: 6px;">
            일정일: <%= sdf.format(ddayDate) %>
        </div>

        <!-- D-day 표시 -->
        <div class="dday-count" style="<%= highlightStyle %> font-size: 20px;">
            <%
                if (diffDays > 0) {
                    out.print("D-" + diffDays);
                } else if (diffDays == 0) {
                    out.print("D-DAY");
                } else {
                    out.print("D+" + Math.abs(diffDays));
                }
            %>
        </div>

        <!-- 삭제 버튼 -->
        <form action="ddayDelete.action" method="post">
            <input type="hidden" name="ddayId" value="<%= item.getDdayId() %>">
            <button type="submit" class="delete-btn" title="삭제하기">x</button>
        </form>
    </div>

    <%
        } // 반복 끝
    %>

    <!-- D-Day 추가 및 홈으로 이동 버튼 -->
    <div class="btn-group" style="justify-content: center; margin-top: 32px;">
        <a href="ddayWrite.action" class="btn">➕ D-Day 추가</a>
        <a href="main.action" class="btn btn-back">홈으로</a>
    </div>
</div>

</body>
</html>
