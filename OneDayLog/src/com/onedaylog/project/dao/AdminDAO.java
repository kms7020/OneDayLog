package com.onedaylog.project.dao;

import java.util.List;
import java.util.Map;

import com.onedaylog.project.dto.AdminDTO;
import com.onedaylog.project.dto.AdminUserStatsDTO;

public interface AdminDAO {

    // 관리자 로그인
    AdminDTO loginAdmin(Map<String, Object> param);  // ✅ 사용 중인 것만 남기기

    // 통계
    int getTotalUserCount();
    int getWithdrawnUserCount();

    // 사용자 리스트
    List<AdminUserStatsDTO> getUserListWithStats(Map<String, String> paramMap);

    // 탈퇴 회원 검색 포함 리스트
    List<AdminUserStatsDTO> getWithdrawnUserList(Map<String, String> paramMap);

    // 탈퇴 처리
    int withdrawUser(int userId);

    // 계정 복구
    int recoverUser(int userId);

    // 영구 삭제
    void deleteWithdrawnUser(int userId);
}
