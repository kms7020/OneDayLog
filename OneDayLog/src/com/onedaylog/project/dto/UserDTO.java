package com.onedaylog.project.dto;

import java.util.Date;

public class UserDTO
{
    private int userId;
    private String email, loginId, password, name, profileImage, isDeleted;
    private Date createdAt, withdrawnAt;
    
    public UserDTO() {}

    public UserDTO(int userId, String email, String password, String name,
    				Date createdAt, Date withdrawnAt, String loginId, String profileImage, String isDeleted) {
        this.userId = userId;
        this.email = email;
        this.password = password;
        this.name = name;
        this.createdAt = createdAt;
        this.withdrawnAt = withdrawnAt;
        this.loginId = loginId;
        this.profileImage = profileImage;
        this.isDeleted = isDeleted;
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

	public String getProfileImage()
	{
		return profileImage;
	}

	public void setProfileImage(String profileImage)
	{
		this.profileImage = profileImage;
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
