package com.onedaylog.project.controller;

import com.onedaylog.project.dao.UserDAO;
import com.onedaylog.project.dto.UserDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpSession;

@Controller
public class MypageController {

    @Autowired
    private SqlSession sqlSession;

    @GetMapping("/mypage.action")
    public String mypage(HttpSession session, Model model) {
        Integer userId = (Integer) session.getAttribute("user_id"); // 로그인 시 저장된 user_id 기준
        if (userId == null) {
            return "redirect:/login.action";
        }

        UserDAO dao = sqlSession.getMapper(UserDAO.class);
        UserDTO user = dao.selectUserById(userId);
        model.addAttribute("user", user);
        session.setAttribute("loginUser", user);  // 🔁 JSP에서 JSTL용
        session.setAttribute("user", user);       // 🔁 JSTL ${user.xxx} 용도

        
        return "user/mypage";  
    }
}
