<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/view/common/header.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>OneDayLog - 탈퇴 회원 관리</title>

    <!-- CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/onedaylog-style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin.css">

    <!-- JS -->
    <script src="${pageContext.request.contextPath}/js/onedaylog-script.js?v=1" defer></script>
    <script src="${pageContext.request.contextPath}/js/todo.js"></script>
    <script src="${pageContext.request.contextPath}/js/user.js" defer></script>
</head>
<body>

<div class="user-list-container">
    <h2 class="admin-title">🗑️ 탈퇴한 사용자</h2>
	
	<!-- 검색 폼 -->
	<form method="get" action="adminWithdrawnList.action" class="user-search-form">
	    <select name="searchField">
	        <option value="loginId" ${searchField == 'loginId' ? 'selected' : ''}>아이디</option>
	        <option value="name" ${searchField == 'name' ? 'selected' : ''}>이름</option>
	    </select>
	    <input type="text" name="searchKeyword" value="${searchKeyword}" placeholder="검색어 입력">
	    <button type="submit">검색</button>
	</form>
	
    <!-- 사용자 목록 헤더 -->
    <div class="user-list-header">
        <div>번호</div>
        <div>이름</div>
        <div>아이디</div>
        <div>이메일</div>
        <div>가입일</div>
        <div>탈퇴일</div>
        <div>일기</div>
        <div>할 일</div>
        <div>D-Day</div>
        <div>상태</div>
    </div>

    <!-- 사용자 항목 -->
    <c:forEach var="user" items="${withdrawnUsers}" varStatus="status">
        <div class="user-list-item">
            <div>${status.index + 1}</div>
            <div>${user.name}</div>
            <div>${user.loginId}</div>
            <div>${user.email}</div>
            <div><fmt:formatDate value="${user.createdAt}" pattern="yyyy-MM-dd" /></div>
            <div><fmt:formatDate value="${user.withdrawnAt}" pattern="yyyy-MM-dd" /></div>
            <div>${user.diaryCount}</div>
            <div>${user.todoCount}</div>
            <div>${user.ddayCount}</div>
            <div>
                <span class="status-tag deleted">탈퇴</span>
            </div>
            <c:if test="${user.isDeleted eq 'Y'}">
			    <form method="post" action="recoverUser.action" onsubmit="return confirm('복구 처리하시겠습니까?');">
			        <input type="hidden" name="userId" value="${user.userId}" />
			        <button type="submit" class="recover-btn">복구</button>
			    </form>
			</c:if>
            <div>
	            <form method="post" action="deleteWithdrawnUser.action" onsubmit="return confirm('정말 영구탈퇴 처리를 하시겠습니까?');">
	                <input type="hidden" name="userId" value="${user.userId}" />
	                <button type="submit" class="delete-btn">영구탈퇴</button>
	            </form>
	        </div>
        </div>
    </c:forEach>

    <!-- 뒤로가기 버튼 -->
    <div class="admin-back">
        <a href="adminMain.action" class="admin-home-btn">뒤로</a>
    </div>
</div>

</body>
</html>
