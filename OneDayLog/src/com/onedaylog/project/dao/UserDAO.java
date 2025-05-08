package com.onedaylog.project.dao;

import com.onedaylog.project.dto.UserDTO;

public interface UserDAO
{
	 // 회원가입 (회원 추가)
    int insertUser(UserDTO user) throws Exception;

    // 로그인 (이메일 + 비밀번호로 사용자 찾기)
    UserDTO findUserByEmailAndPassword(UserDTO user) throws Exception;

    // 이메일 중복 확인
    UserDTO findUserByEmail(String email) throws Exception;
}
