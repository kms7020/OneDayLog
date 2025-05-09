package com.onedaylog.project.dto;

import java.util.Date;

public class DiaryDTO {
    private int diaryId, userId;
    private String content, diaryDate;
    
    // Getter/Setter
	public int getDiaryId()
	{
		return diaryId;
	}
	public void setDiaryId(int diaryId)
	{
		this.diaryId = diaryId;
	}
	public int getUserId()
	{
		return userId;
	}
	public void setUserId(int userId)
	{
		this.userId = userId;
	}
	public String getContent()
	{
		return content;
	}
	public void setContent(String content)
	{
		this.content = content;
	}
	public String getDiaryDate()
	{
		return diaryDate;
	}
	public void setDiaryDate(String diaryDate)
	{
		this.diaryDate = diaryDate;
	}
    

	


    
}
