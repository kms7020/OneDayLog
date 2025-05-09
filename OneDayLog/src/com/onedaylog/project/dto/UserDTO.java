package com.onedaylog.project.dto;

public class UserDTO
{
    private int userId;
    private String email, loginId, password, name, createdAt;
    
    public UserDTO() {}

    public UserDTO(int userId, String email, String password, String name, String createdAt, String loginId) {
        this.userId = userId;
        this.email = email;
        this.password = password;
        this.name = name;
        this.createdAt = createdAt;
        this.loginId = loginId;
    }

    // Getter/Setter
	public int getUserId()
	{
		return userId;
	}

	public void setUserId(int userId)
	{
		this.userId = userId;
	}

	public String getEmail()
	{
		return email;
	}

	public void setEmail(String email)
	{
		this.email = email;
	}

	public String getLoginId()
	{
		return loginId;
	}

	public void setLoginId(String loginId)
	{
		this.loginId = loginId;
	}

	public String getPassword()
	{
		return password;
	}

	public void setPassword(String password)
	{
		this.password = password;
	}

	public String getName()
	{
		return name;
	}

	public void setName(String name)
	{
		this.name = name;
	}

	public String getCreatedAt()
	{
		return createdAt;
	}

	public void setCreatedAt(String createdAt)
	{
		this.createdAt = createdAt;
	}
      
}
