<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/view/common/header.jsp" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>OneDayLog - 리스트</title>

    <%-- CSS 스타일시트 --%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/onedaylog-style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">

    <%-- 웹 폰트 --%>
    <link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Noto+Sans+KR&display=swap" rel="stylesheet">

    <%-- JS 스크립트 --%>
    <script src="${pageContext.request.contextPath}/js/onedaylog-script.js?v=1" defer></script>
    <script src="js/todo.js"></script>
</head>

<body>
<div class="container">

    <%-- 오늘 할 일 리스트 --%>
    <div class="section">
        <h2><span class="emoji">📌</span> 오늘 할 일</h2>
        <ul class="todo-list">
            <c:forEach var="todo" items="${todoList}">
                <c:if test="${todo.category eq 'today'}">
                    <li>
                        <input type="checkbox" <c:if test="${todo.completed}">checked</c:if>
                               onclick="toggleTaskAjax(this, ${todo.todoId})" />
                        <span class="task-text <c:if test='${todo.completed}'>task-completed</c:if>">${todo.task}</span>
                        <button class="edit-btn" title="수정하기" onclick="openEditModal(${todo.todoId}, '${todo.task}')">✏</button>
                        <button class="delete-btn" title="삭제하기" onclick="confirmTodoDelete('${todo.todoId}')">×</button>
                    </li>
                </c:if>
            </c:forEach>
        </ul>
    </div>

    <%-- 내일 할 일 리스트 --%>
    <div class="section">
        <h2><span class="emoji">📅</span> 내일 할 일</h2>
        <ul class="todo-list">
            <c:forEach var="todo" items="${todoList}">
                <c:if test="${todo.category eq 'tomorrow'}">
                    <li>
                        <input type="checkbox" <c:if test="${todo.completed}">checked</c:if>
                               onclick="toggleTaskAjax(this, ${todo.todoId})" />
                        <span class="task-text <c:if test='${todo.completed}'>task-completed</c:if>">${todo.task}</span>
                        <button class="edit-btn" title="수정하기" onclick="openEditModal(${todo.todoId}, '${todo.task}')">✏</button>
                        <button class="delete-btn" title="삭제하기" onclick="confirmTodoDelete('${todo.todoId}')">×</button>
                    </li>
                </c:if>
            </c:forEach>
        </ul>
    </div>

    <%-- 나중에 할 일 리스트 --%>
    <div class="section">
        <h2><span class="emoji">⏳</span> 나중에 할 일</h2>
        <ul class="todo-list">
            <c:forEach var="todo" items="${todoList}">
                <c:if test="${todo.category eq 'later'}">
                    <li>
                        <input type="checkbox" <c:if test="${todo.completed}">checked</c:if>
                               onclick="toggleTaskAjax(this, ${todo.todoId})" />
                        <span class="task-text <c:if test='${todo.completed}'>task-completed</c:if>">${todo.task}</span>
                        <button class="edit-btn" title="수정하기" onclick="openEditModal(${todo.todoId}, '${todo.task}')">✏</button>
                        <button class="delete-btn" title="삭제하기" onclick="confirmTodoDelete('${todo.todoId}')">×</button>
                    </li>
                </c:if>
            </c:forEach>
        </ul>
    </div>

    <%-- 하단 버튼 그룹: 새 리스트 추가 / 홈으로 이동 --%>
    <div class="btn-group">
        <a class="btn btn-add" href="todoWrite.action">➕ 새 리스트 추가</a>
        <a class="btn btn-back" href="main.action">홈으로</a>
    </div>

</div>
</body>
<div id="editModal" class="modal" style="display: none;">
    <div class="modal-box">
        <h3>할 일 수정</h3>
        <form id="editForm" method="post" action="todoUpdate.action">
            <input type="hidden" name="todoId" id="editTodoId" />
            <input type="text" name="task" id="editTaskInput" required />
            <div class="btn-group" style="margin-top: 12px;">
                <button type="submit" class="btn btn-add">저장</button>
                <button type="button" class="btn btn-back" onclick="closeEditModal()">취소</button>
            </div>
        </form>
    </div>
</div>

</html>
