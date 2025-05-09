<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/view/common/header.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>OneDayLog - 오늘의 약속</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/onedaylog-style.css">
<script src="${pageContext.request.contextPath}/js/onedaylog-script.js?v=1" defer></script>
<script src="js/todo.js"></script>
</head>
<body>
<div class="container">
	<div class="section">
		<h2><span class="emoji">📌</span> 오늘 할 일</h2>
		<ul class="todo-list">
			<c:forEach var="todo" items="${todoList}">
				<c:if test="${todo.category eq 'today'}">
					<li>
						<input type="checkbox" <c:if test="${todo.completed}">checked</c:if> onclick="toggleTaskAjax(this, ${todo.todoId})" />
						<span class="task-text <c:if test='${todo.completed}'>task-completed</c:if>">${todo.task}</span>
						<button class="delete-btn" onclick="confirmTodoDelete('${todo.todoId}')">×</button>
					</li>
				</c:if>
			</c:forEach>
		</ul>
	</div>
	<div class="section">
		<h2><span class="emoji">📅</span> 내일 할 일</h2>
		<ul class="todo-list">
			<c:forEach var="todo" items="${todoList}">
				<c:if test="${todo.category eq 'tomorrow'}">
					<li>
						<input type="checkbox" <c:if test="${todo.completed}">checked</c:if> onclick="toggleTaskAjax(this, ${todo.todoId})" />
						<span class="task-text <c:if test='${todo.completed}'>task-completed</c:if>">${todo.task}</span>
						<button class="delete-btn" onclick="confirmTodoDelete('${todo.todoId}')">×</button>
					</li>
				</c:if>
			</c:forEach>
		</ul>
	</div>
	<div class="section">
		<h2><span class="emoji">⏳</span> 나중에 할 일</h2>
		<ul class="todo-list">
			<c:forEach var="todo" items="${todoList}">
				<c:if test="${todo.category eq 'later'}">
					<li>
						<input type="checkbox" <c:if test="${todo.completed}">checked</c:if> onclick="toggleTaskAjax(this, ${todo.todoId})" />
						<span class="task-text <c:if test='${todo.completed}'>task-completed</c:if>">${todo.task}</span>
						<button class="delete-btn" onclick="confirmTodoDelete('${todo.todoId}')">×</button>
					</li>
				</c:if>
			</c:forEach>
		</ul>
	</div>
	<div class="btn-group">
		<a class="btn btn-add" href="todoWrite.action">➕ 새 리스트 추가</a>
		<a class="btn btn-back" href="main.action">← 메인으로</a>
	</div>
</div>
</body>
</html>
