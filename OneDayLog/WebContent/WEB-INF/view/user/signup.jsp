<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/view/common/header.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>회원가입 - OneDayLog</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login-style.css">
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/js/onedaylog-script.js" defer></script>
    <script src="${pageContext.request.contextPath}/js/user.js" defer></script>
    <script src="${pageContext.request.contextPath}/js/main.js" defer></script>
</head>
<body>

<div class="login-wrapper">
    <div class="container">
        <h2>회원가입</h2>
        <form id="signupForm"
              action="${pageContext.request.contextPath}/signup.action"
              method="post" onsubmit="return validatePassword();">

            <!-- 이름 -->
            <input type="text" name="name" placeholder="이름" required>

            <!-- 아이디 + 중복확인 -->
            <div class="field-group">
                <div class="input-check">
                    <input type="text" id="loginId" name="loginId" placeholder="아이디" required>
                    <button type="button" class="btn-check" onclick="checkLoginId()">중복확인</button>
                </div>
                <p id="loginIdMsg" class="check-msg"></p>
            </div>

            <!-- 비밀번호 -->
            <input type="password" id="password" name="password" placeholder="비밀번호" required>
            <input type="password" id="confirmPassword" placeholder="비밀번호 확인" required>
            <p id="passwordError" class="check-msg" style="color: red;">❌ 비밀번호가 일치하지 않습니다.</p>

            <!-- 이메일 + 중복확인 -->
            <div class="field-group">
                <div class="input-check">
                    <input type="email" id="email" name="email" placeholder="이메일" required>
                    <button type="button" class="btn-check" onclick="checkEmail()">중복확인</button>
                </div>
                <p id="emailMsg" class="check-msg"></p>
            </div>

            <!-- 제출 -->
            <button type="submit" class="btn">가입하기</button>
        </form>

        <!-- 로그인 링크 -->
        <div style="text-align: center; margin-top: 20px;">
            <a href="${pageContext.request.contextPath}/login.action" class="btn-back">이미 계정이 있으신가요? 로그인</a>
        </div>
    </div>
</div>

</body>
</html>
