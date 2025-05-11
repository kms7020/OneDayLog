package com.onedaylog.project.dto;

import java.util.Date;

public class AdminUserStatsDTO
{
    private int userId, diaryCount, todoCount, ddayCount;
    private String loginId, email, name, isDeleted;
    private Date createdAt, withdrawnAt;

    // 기본 생성자
    public AdminUserStatsDTO() {}


    // getter/setter
	public int getUserId()
	{
		return userId;
	}

	public void setUserId(int userId)
	{
		this.userId = userId;
	}

	public int getDiaryCount()
	{
		return diaryCount;
	}

	public void setDiaryCount(int diaryCount)
	{
		this.diaryCount = diaryCount;
	}

	public int getTodoCount()
	{
		return todoCount;
	}

	public void setTodoCount(int todoCount)
	{
		this.todoCount = todoCount;
	}

	public int getDdayCount()
	{
		return ddayCount;
	}

	public void setDdayCount(int ddayCount)
	{
		this.ddayCount = ddayCount;
	}

	public String getLoginId()
	{
		return loginId;
	}

	public void setLoginId(String loginId)
	{
		this.loginId = loginId;
	}

	public String getEmail()
	{
		return email;
	}

	public void setEmail(String email)
	{
		this.email = email;
	}

	public String getName()
	{
		return name;
	}

	public void setName(String name)
	{
		this.name = name;
	}

	public String getIsDeleted()
	{
		return isDeleted;
	}

	public void setIsDeleted(String isDeleted)
	{
		this.isDeleted = isDeleted;
	}

	public Date getCreatedAt()
	{
		return createdAt;
	}

	public void setCreatedAt(Date createdAt)
	{
		this.createdAt = createdAt;
	}

	public Date getWithdrawnAt()
	{
		return withdrawnAt;
	}

	public void setWithdrawnAt(Date withdrawnAt)
	{
		this.withdrawnAt = withdrawnAt;
	}

}
