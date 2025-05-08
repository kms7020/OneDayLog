package com.onedaylog.project.controller;

import javax.servlet.http.HttpSession;

import com.onedaylog.project.dao.UserDAO;
import com.onedaylog.project.dto.UserDTO;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class UserController {

    @Autowired
    private SqlSession sqlSession;

    // 메인 페이지
    @GetMapping("/main.action")
    public String mainPage(HttpSession session) {
        if (session.getAttribute("user_name") == null) {
            return "redirect:/login.action";
        }
        return "/main/MainPage";
    }

    // 로그인 폼
    @GetMapping("/login.action")
    public String loginForm() {
        return "/user/login";
    }

    // 로그인 처리
    @PostMapping("/login.action")
    public String loginSubmit(@RequestParam("email") String email,
                              @RequestParam("password") String password,
                              HttpSession session,
                              Model model) {
        UserDAO dao = sqlSession.getMapper(UserDAO.class);
        UserDTO user = new UserDTO();
        user.setEmail(email);
        user.setPassword(password);

        try {
            UserDTO result = dao.findUserByEmailAndPassword(user);

            if (result != null) {
                session.setAttribute("user_id", result.getUserId());
                session.setAttribute("user_name", result.getName());
                session.setAttribute("user_email", result.getEmail());
                return "redirect:/main.action";
            } else {
                model.addAttribute("error", "이메일 또는 비밀번호가 일치하지 않습니다.");
                return "/user/login";
            }

        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("error", "로그인 중 오류가 발생했습니다.");
            return "/user/login";
        }
    }

    // 로그아웃 처리
    @GetMapping("/logout.action")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/login.action";
    }

    // 회원가입 폼
    @GetMapping("/signup.action")
    public String signupForm() {
        return "/user/signup";
    }

    // 회원가입 처리
    @PostMapping("/signup.action")
    public String signupSubmit(UserDTO user, Model model) {
        UserDAO dao = sqlSession.getMapper(UserDAO.class);

        try {
            if (dao.findUserByEmail(user.getEmail()) != null) {
                model.addAttribute("error", "이미 사용 중인 이메일입니다.");
                return "/user/signup";
            }

            dao.insertUser(user);
            return "redirect:/login.action";
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("error", "회원가입 중 오류가 발생했습니다.");
            return "/user/signup";
        }
    }
}
