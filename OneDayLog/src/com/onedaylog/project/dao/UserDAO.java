package com.onedaylog.project.dao;

import org.apache.ibatis.annotations.Param;

import com.onedaylog.project.dto.UserDTO;

public interface UserDAO
{
	 // 회원가입 (회원 추가)
    int insertUser(UserDTO user) throws Exception;

    // 로그인 (아이디 + 비밀번호로 사용자 찾기)
    UserDTO findUserByLoginIdAndPassword(UserDTO user);

    // 이메일 중복 확인
    UserDTO findUserByEmail(@Param("email") String email);
    
    // 아이디 중복 확인
    UserDTO findUserByLoginId(@Param("loginId") String loginId);
    
    
    
    
}
