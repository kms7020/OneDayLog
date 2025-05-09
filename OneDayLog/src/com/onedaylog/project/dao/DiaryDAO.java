package com.onedaylog.project.dao;

import java.util.List;
import com.onedaylog.project.dto.DiaryDTO;

public interface DiaryDAO {
	
	// 일기 추가
    public void insertDiary(DiaryDTO diary);
    
    // 일기 조회
    public List<DiaryDTO> getDiaryListByUserId(int userId);
    
    // 일기 삭제
    public void deleteDiary(int diaryId);

}
