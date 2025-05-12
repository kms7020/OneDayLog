package com.onedaylog.project.dao;

import java.util.List;
import java.util.Map;

import com.onedaylog.project.dto.DiaryDTO;

public interface DiaryDAO {
	
	// 일기 추가
    public void insertDiary(DiaryDTO diary);
    
    // 일기 조회
    public List<DiaryDTO> getDiaryListByUserId(int userId);
    
    // 일기 삭제
    public void deleteDiary(int diaryId);
    
    // 일기 조회 (수정폼용)
    DiaryDTO findById(int diaryId);

    // 일기 수정 처리
    int updateDiary(DiaryDTO dto);
    
    // 일기 날짜 정렬
    List<DiaryDTO> getDiaryListSorted(Map<String, Object> paramMap);

}
