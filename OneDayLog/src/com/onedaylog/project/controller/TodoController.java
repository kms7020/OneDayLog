package com.onedaylog.project.controller;

import com.onedaylog.project.dao.DiaryDAO;
import com.onedaylog.project.dao.TodoDAO;
import com.onedaylog.project.dto.TodoDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class TodoController {

    @Autowired
    private SqlSession sqlSession;
    @Autowired
    private TodoDAO todoDAO;
    
    @GetMapping("/todoList.action")
    public String todoList(HttpSession session, Model model) {
        Integer userId = (Integer) session.getAttribute("user_id");
        if (userId == null) return "redirect:/login.action";

        TodoDAO todoDao = sqlSession.getMapper(TodoDAO.class);
        List<TodoDTO> todoList = todoDao.getTodoList(userId);
        model.addAttribute("todoList", todoList);

        return "/todo/todoList";
    }

    @GetMapping("/todoWrite.action")
    public String todoWriteForm() {
        return "/todo/todoWrite";
    }

    @PostMapping("/todoWrite.action")
    public String addTodo(@RequestParam("task") String task,
                          @RequestParam("category") String category,
                          HttpSession session) {
        Integer userId = (Integer) session.getAttribute("user_id");
        if (userId == null) return "redirect:/login.action";

        TodoDTO todo = new TodoDTO();
        todo.setUserId(userId);
        todo.setTask(task);
        todo.setCategory(category);

        TodoDAO dao = sqlSession.getMapper(TodoDAO.class);
        dao.insertTodo(todo);

        return "redirect:/todoList.action";
    }

    @PostMapping("/updateTodoCompleted.action")
    @ResponseBody
    public String updateTodoCompleted(@RequestParam("todoId") int todoId,
                                      @RequestParam("completed") boolean completed) {
        TodoDAO dao = sqlSession.getMapper(TodoDAO.class);
        TodoDTO dto = new TodoDTO();
        dto.setTodoId(todoId);
        dto.setCompleted(completed);
        dao.updateTodoCompleted(dto);
        return "success";
    }

    @PostMapping("/todoDelete.action")
    public String deleteTodo(@RequestParam("todoId") int todoId) {
    	System.out.println("📌 삭제 요청 도착 - todoId: " + todoId);
        todoDAO.deleteTodo(todoId);
        return "redirect:/todoList.action";
        
    }
    
    @PostMapping("/todoUpdate.action")
    public String updateTodo(TodoDTO dto) {
        TodoDAO dao = sqlSession.getMapper(TodoDAO.class);
        dao.updateTodo(dto);
        return "redirect:/todoList.action"; 
    }
    

}