package com.onedaylog.project.dao;

import java.util.List;
import java.util.Map;

import com.onedaylog.project.dto.AdminDTO;
import com.onedaylog.project.dto.AdminUserStatsDTO;


public interface AdminDAO
{
	AdminDTO loginAdmin(AdminDTO admin);

	AdminDTO login(String adminId, String adminPw);
	
    int getTotalUserCount();
    int getWithdrawnUserCount();
    
    List<AdminUserStatsDTO> getUserListWithStats(Map<String, String> paramMap);
    public List<AdminUserStatsDTO> getWithdrawnUserList();
    
    // 회원 영구 삭제
    void deleteWithdrawnUser(int userId);
    
    // 탈퇴일 조회
    public int withdrawUser(int userId);
    
    // 회원 계정 복구
    public int recoverUser(int userId);
    
    // 탈퇴 회원 관리 검색기능
    List<AdminUserStatsDTO> getWithdrawnUserList(Map<String, String> paramMap);


}
