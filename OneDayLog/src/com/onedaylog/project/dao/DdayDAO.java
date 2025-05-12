package com.onedaylog.project.dao;

import com.onedaylog.project.dto.DdayDTO;
import java.util.List;

public interface DdayDAO {
    int insertDday(DdayDTO dto);
    List<DdayDTO> selectUpcomingDdayByUserId(int userId);  // ASC 정렬
    List<DdayDTO> selectUpcomingDdayDesc(int userId);      // DESC 정렬
    int deleteDday(int ddayId);
    List<DdayDTO> selectTop3UpcomingDday(int userId);
    
    // 중요도 토글
    void toggleImportant(int ddayId);

    // 상세 조회
    DdayDTO selectDdayById(int ddayId);
    
    // 가져오기
    DdayDTO getDdayById(int ddayId);
    
    // 수정
    int updateDday(DdayDTO dto);

}
