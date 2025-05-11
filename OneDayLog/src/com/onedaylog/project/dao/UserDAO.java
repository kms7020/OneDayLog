package com.onedaylog.project.dao;

import org.apache.ibatis.annotations.Param;

import com.onedaylog.project.dto.UserDTO;

public interface UserDAO
{
	 // 회원가입 (회원 추가)
    int insertUser(UserDTO user) throws Exception;

    // 로그인 (아이디 + 비밀번호로 사용자 찾기)
    UserDTO findUserByLoginIdAndPassword(UserDTO user);
    
    // 아이디 중복 확인 
    UserDTO findUserByLoginId(String loginId);
    
    // 이메일 중복 확인
    UserDTO findUserByEmail(String email);
    
    // 사용자 아이디 조회
    UserDTO selectUserById(@Param("userId") int userId);
    
    // 사용자 비밀번호 확인
    String selectPasswordById(int userId);
    
    // 사용자 정보 수정
    void updateUser(UserDTO userDto);
    
    // 프로필사진 수정
    void updateProfileImage(String loginId, String profileImage);
    
    // 프로필 사진 수정 받기
    public void updateProfileImageById(@Param("userId") int userId, @Param("fileName") String fileName);
    
    // 사용자 삭제    
    void markUserAsDeleted(@Param("userId") int userId);
    
    // 임시 비밀번호
    void updatePasswordById(@Param("userId") int userId, @Param("newPassword") String newPassword);


}
