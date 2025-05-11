<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*, java.text.*" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/view/common/header.jsp" %>

<%
    // 오늘 날짜를 자정 기준으로 설정하여 D-Day 계산용 기준일 생성
    Calendar cal = Calendar.getInstance();
    cal.set(Calendar.HOUR_OF_DAY, 0);
    cal.set(Calendar.MINUTE, 0);
    cal.set(Calendar.SECOND, 0);
    cal.set(Calendar.MILLISECOND, 0);
    Date now = cal.getTime();
    request.setAttribute("now", now);
%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>OneDayLog - 메인페이지</title>

    <!-- 스타일 & 폰트 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
    <link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Noto+Sans+KR&display=swap" rel="stylesheet">

    <!-- 스크립트 -->
    <script src="${pageContext.request.contextPath}/js/onedaylog-script.js" defer></script>
    <script src="${pageContext.request.contextPath}/js/main.js" defer></script>
</head>

<body>
<div class="container">

    <%-- 상단 메뉴 버튼 --%>
    <div class="menu-grid">
        <a href="diaryList.action" class="menu-button">📘 일기장</a>
        <a href="todoList.action" class="menu-button">📝 리스트</a>
        <a href="ddayList.action" class="menu-button">📆 D-Day</a>
    </div>

    <%-- D-Day 박스 --%>
    <div class="dday-box">
        <h3>
            <i class="fa-solid fa-calendar-week" style="color: #5c7cfa;"></i>
            D-Day
        </h3>

        <c:choose>
            <c:when test="${not empty upcomingDdays}">
                <c:forEach var="item" items="${upcomingDdays}">

                    <%-- 날짜 차이 계산 및 표시 라벨 생성 --%>
                    <c:set var="rawDiff" value="${(item.targetDate.time - now.time) / (1000 * 60 * 60 * 24)}" />
                    <c:set var="diffDays" value="${fn:substringBefore(rawDiff, '.')}" />

                    <c:choose>
                        <c:when test="${diffDays == 0}">
                            <c:set var="label" value="D-DAY" />
                            <c:set var="color" value="#d6336c" />
                        </c:when>
                        <c:when test="${diffDays > 0}">
                            <c:set var="label" value="D-${diffDays}" />
                            <c:set var="color" value="#d9480f" />
                        </c:when>
                        <c:otherwise>
                            <c:set var="label" value="D+${0 - diffDays}" />
                            <c:set var="color" value="#868e96" />
                        </c:otherwise>
                    </c:choose>

                    <%-- 중요도에 따라 애니메이션 클래스 지정 --%>
                    <c:set var="moveClass" value="${item.important ? 'important-move' : 'unimportant-move'}" />

                    <%-- D-Day 항목 출력 --%>
                    <a href="ddayDetail.action?ddayId=${item.ddayId}" class="dday-item-link">
                        <div class="dday-item ${moveClass}">
                            <div class="title-group">
                                <i class="fa-solid fa-calendar-day" style="color: #f59f00;"></i>
                                ${item.title}
                            </div>

                            <div class="dday-controls" style="display: flex; align-items: center; gap: 10px;">
                                <form action="toggleImportant.action" method="post" style="margin: 0;">
                                    <input type="hidden" name="ddayId" value="${item.ddayId}" />
                                    <button type="submit" class="star-btn" style="border: none; background: transparent; cursor: pointer;">
                                        <i class="${item.important ? 'fa-solid' : 'fa-regular'} fa-star" style="color: gold;"></i>
                                    </button>
                                </form>
                                <span class="dday-count" style="color: ${color};">${label}</span>
                            </div>
                        </div>
                    </a>
                </c:forEach>
            </c:when>

            <c:otherwise>
                <%-- 예정된 D-Day가 없는 경우 --%>
                <div class="dday-item">
                    <div class="title-group">
                        <i class="fa-solid fa-calendar-xmark" style="color: #adb5bd;"></i>
                        예정된 D-Day가 없습니다.
                    </div>
                </div>
            </c:otherwise>
        </c:choose>
    </div>

</div>
</body>
</html>
