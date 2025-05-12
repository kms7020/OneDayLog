<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/view/common/header.jsp" %>
<%@ page session="true" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>OneDayLog - 마이페이지</title>

    <!-- CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/onedaylog-style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">

    <!-- 웹폰트 -->
    <link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Noto+Sans+KR&display=swap" rel="stylesheet">
	
    <!-- JS -->
    <script src="${pageContext.request.contextPath}/js/onedaylog-script.js?v=1" defer></script>
    <script src="js/todo.js"></script>
    <script src="${pageContext.request.contextPath}/js/user.js" defer></script>
</head>
<body>
<div class="container mypage-container">
    <h2 class="mypage-title">📄 마이페이지</h2>

    <div class="mypage-card custom-rounded-card" style="max-width: 700px; margin: 0 auto; display: flex; gap: 48px; align-items: flex-start; padding: 48px;">
        <!-- 프로필 이미지 영역 -->
<!-- 프로필 이미지 + 클릭 시 확대 -->
<div class="profile-wrapper">
    
    <!-- 프로필 이미지 출력 (클릭 시 모달) -->
    <div class="profile-image" id="profileImageTrigger">
<c:choose>
    <c:when test="${not empty sessionScope.user.profileImage}">
        <img src="${pageContext.request.contextPath}/profile-image/${sessionScope.user.profileImage}" />
    </c:when>
    <c:otherwise>
        <img src="/profile-image/default.jpg" />
    </c:otherwise>
</c:choose>


    </div>

    <!-- 🔁 프로필 수정 업로드 form (input + label만 감쌈) -->
    <form action="updateProfile.action" method="post" enctype="multipart/form-data" style="margin-top: 8px; text-align: center;">
        <input type="file" id="profileUpload" name="profileUpload" accept="image/*" style="display:none;" onchange="this.form.submit();" />
        <label for="profileUpload" class="profile-edit-btn">프로필 수정</label>
    </form>
</div>


<!-- 🖼️ 프로필 이미지 확대 모달 -->
<div id="profileModal" class="modal" style="display:none;">
    <span class="close">&times;</span>
    <img class="modal-content" id="modalImage">
</div>




        <!-- 사용자 정보 -->
        <div class="mypage-info" style="flex: 1;">
            <p class="mypage-line">이름 : <strong>${user.name}</strong></p>
            <p class="mypage-line">아이디 : <strong>${user.loginId}</strong></p>
            <p class="mypage-line">이메일 : <strong>${user.email}</strong></p>
            <p class="mypage-line">가입일 : <strong><fmt:formatDate value="${user.createdAt}" pattern="yyyy-MM-dd"/></strong></p>

            <div class="btn-group" style="display: flex; flex-wrap: wrap; justify-content: flex-start; gap: 16px; margin-top: 32px;">
                <a href="checkPassword.action" class="btn btn-yellow">개인정보 수정</a>
                <a href="main.action" class="btn btn-gray">홈으로</a>
            </div>
                <div style="margin-top: 24px; text-align: right; max-width: 700px; margin-left: auto; margin-right: auto;">
			        <a href="withdrawUserForm.action" class="btn-danger" style="min-width: 90px;">회원탈퇴</a>
			    </div>
        </div>
    </div>


</div>
</body>
</html>
