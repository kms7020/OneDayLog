package com.onedaylog.project.dto;

import java.util.Date;

public class AdminDTO
{
    private int adminId;
    private String adminLoginId, adminPassword, adminName;
    private Date createdAt;
    
    // getter/setter
	public int getAdminId()
	{
		return adminId;
	}
	public void setAdminId(int adminId)
	{
		this.adminId = adminId;
	}
	public String getAdminLoginId()
	{
		return adminLoginId;
	}
	public void setAdminLoginId(String adminLoginId)
	{
		this.adminLoginId = adminLoginId;
	}
	public String getAdminPassword()
	{
		return adminPassword;
	}
	public void setAdminPassword(String adminPassword)
	{
		this.adminPassword = adminPassword;
	}
	public String getAdminName()
	{
		return adminName;
	}
	public void setAdminName(String adminName)
	{
		this.adminName = adminName;
	}
	public Date getCreatedAt()
	{
		return createdAt;
	}
	public void setCreatedAt(Date createdAt)
	{
		this.createdAt = createdAt;
	}
    
    
}
