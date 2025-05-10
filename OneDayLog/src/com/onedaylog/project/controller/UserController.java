package com.onedaylog.project.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.onedaylog.project.dao.DdayDAO;
import com.onedaylog.project.dao.UserDAO;
import com.onedaylog.project.dto.DdayDTO;
import com.onedaylog.project.dto.UserDTO;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class UserController
{

	@Autowired
	private SqlSession sqlSession;

	// 메인 페이지
	@GetMapping("/main.action")
	public String mainPage(HttpSession session, Model model)
	{
		if (session.getAttribute("user_name") == null)
		{
			return "redirect:/preLoginMain.action";
		}

		int userId = (int) session.getAttribute("user_id");
		DdayDAO dao = sqlSession.getMapper(DdayDAO.class);
		List<DdayDTO> upcomingDdays = dao.selectTop3UpcomingDday(userId);

		model.addAttribute("upcomingDdays", upcomingDdays);
		return "/main/MainPage";
	}

	@GetMapping("/preLoginMain.action")
	public String preLoginMain()
	{
		return "/main/preLoginMain";
	}

	// 로그인 폼
	@GetMapping("/login.action")
	public String loginForm()
	{
		return "/user/login";
	}

	// 로그인 처리
	@PostMapping("/login.action")
	public String loginSubmit(@RequestParam("loginId") String loginId, @RequestParam("password") String password,
			HttpSession session, Model model)
	{
		UserDAO dao = sqlSession.getMapper(UserDAO.class);
		UserDTO user = new UserDTO();
		user.setLoginId(loginId);
		user.setPassword(password);

		try
		{
			UserDTO result = dao.findUserByLoginIdAndPassword(user);

			if (result != null)
			{
				session.setAttribute("user_id", result.getUserId());
				session.setAttribute("user_name", result.getName());
				session.setAttribute("user_email", result.getEmail());
				session.setAttribute("login_id", result.getLoginId());
				return "redirect:/main.action";
			} else
			{
				model.addAttribute("error", "아이디 또는 비밀번호가 일치하지 않습니다.");
				return "/user/login";
			}

		} catch (Exception e)
		{
			e.printStackTrace();
			model.addAttribute("error", "로그인 중 오류가 발생했습니다.");
			return "/user/login";
		}
	}

	// 로그아웃 처리
	@GetMapping("/logout.action")
	public String logout(HttpSession session)
	{
		session.invalidate();
		return "redirect:/preLoginMain.action";
	}

	// 회원가입 폼
	@GetMapping("/signup.action")
	public String signupForm()
	{
		return "/user/signup";
	}

	// 회원가입 처리
	@PostMapping("/signup.action")
	public String signupSubmit(UserDTO user, Model model)
	{
		UserDAO dao = sqlSession.getMapper(UserDAO.class);

		try
		{
			// 아이디 중복 체크
			if (dao.findUserByLoginId(user.getLoginId()) != null)
			{
				model.addAttribute("error", "이미 사용 중인 아이디입니다.");
				return "/user/signup";
			}

			// 이메일 중복 체크
			if (dao.findUserByEmail(user.getEmail()) != null)
			{
				model.addAttribute("error", "이미 등록된 이메일입니다.");
				return "/user/signup";
			}

			dao.insertUser(user); // 회원 등록
			return "redirect:/login.action";

		} catch (Exception e)
		{
			e.printStackTrace();
			model.addAttribute("error", "회원가입 중 오류가 발생했습니다.");
			return "/user/signup";
		}
	}
	
	// 아이디 중복 확인
	@GetMapping("/checkLoginId")
	@ResponseBody
	public String checkLoginId(@RequestParam("loginId") String loginId) {
		if (loginId == null || loginId.trim().isEmpty()) {
	        return "empty"; // 프론트에서 이걸 구분해도 됨
	    }
	    UserDAO dao = sqlSession.getMapper(UserDAO.class);
	    return (dao.findUserByLoginId(loginId) == null) ? "usable" : "duplicate";
	}

	// 이메일 중복 확인
	@GetMapping("/checkEmail")
	@ResponseBody
	public String checkEmail(@RequestParam("email") String email) throws Exception {
	    UserDAO dao = sqlSession.getMapper(UserDAO.class);
	    return (dao.findUserByEmail(email) == null) ? "usable" : "duplicate";
	}

}
