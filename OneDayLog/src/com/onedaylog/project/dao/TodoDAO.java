package com.onedaylog.project.dao;

import java.util.List;
import com.onedaylog.project.dto.TodoDTO;

public interface TodoDAO {
    void insertTodo(TodoDTO todo);
    List<TodoDTO> getTodoList(int userId);
    void updateTodoStatus(int todoId, boolean completed);
    void deleteTodo(int todoId);
    void updateTodoCompleted(TodoDTO todo);
    void updateTodo(TodoDTO dto);
}
