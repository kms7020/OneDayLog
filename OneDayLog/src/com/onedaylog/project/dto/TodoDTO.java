package com.onedaylog.project.dto;

public class TodoDTO {
    private int todoId, userId;
    private String task, category; // "today", "tomorrow", "someday" 중 하나
    private boolean completed;
    
    // Getter/Setter
	public int getTodoId()
	{
		return todoId;
	}
	public void setTodoId(int todoId)
	{
		this.todoId = todoId;
	}
	public int getUserId()
	{
		return userId;
	}
	public void setUserId(int userId)
	{
		this.userId = userId;
	}
	public String getTask()
	{
		return task;
	}
	public void setTask(String task)
	{
		this.task = task;
	}
	public String getCategory()
	{
		return category;
	}
	public void setCategory(String category)
	{
		this.category = category;
	}
	public boolean isCompleted()
	{
		return completed;
	}
	public void setCompleted(boolean completed)
	{
		this.completed = completed;
	}

    
}
