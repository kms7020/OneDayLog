package com.onedaylog.project.dto;

import java.util.Date;

public class DdayDTO
{
    private int ddayId, userId;
    private String title;
    private Date targetDate, createdAt;
    private boolean important;
    
    // getter/setter
	public int getDdayId()
	{
		return ddayId;
	}
	public void setDdayId(int ddayId)
	{
		this.ddayId = ddayId;
	}
	public int getUserId()
	{
		return userId;
	}
	public void setUserId(int userId)
	{
		this.userId = userId;
	}
	public String getTitle()
	{
		return title;
	}
	public void setTitle(String title)
	{
		this.title = title;
	}
	public Date getTargetDate()
	{
		return targetDate;
	}
	public void setTargetDate(Date targetDate)
	{
		this.targetDate = targetDate;
	}
	public Date getCreatedAt()
	{
		return createdAt;
	}
	public void setCreatedAt(Date createdAt)
	{
		this.createdAt = createdAt;
	}
	public boolean isImportant()
	{
		return important;
	}
	public void setImportant(boolean important)
	{
		this.important = important;
	}
    
}
