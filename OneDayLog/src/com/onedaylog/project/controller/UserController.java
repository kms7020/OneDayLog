package com.onedaylog.project.controller;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.onedaylog.project.dao.DdayDAO;
import com.onedaylog.project.dao.UserDAO;
import com.onedaylog.project.dto.DdayDTO;
import com.onedaylog.project.dto.UserDTO;
import com.onedaylog.project.service.MailService;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;

@Controller
public class UserController
{

	@Autowired
	private SqlSession sqlSession;
	@Autowired
	private MailService mailService;

	// 메인 페이지
	@GetMapping("/main.action")
	public String mainPage(HttpSession session, Model model)
	{
	    // ✅ user_name 체크 → 로그인 상태 확인
	    if (session.getAttribute("user_name") == null)
	    {
	        return "redirect:/preLoginMain.action";
	    }

	    // ✅ loginUser가 세션에 없으면 user_id 기준으로 다시 조회해서 넣어줌
	    if (session.getAttribute("loginUser") == null) {
	        Integer userId = (Integer) session.getAttribute("user_id");
	        if (userId != null) {
	            UserDAO userDAO = sqlSession.getMapper(UserDAO.class);
	            UserDTO loginUser = userDAO.selectUserById(userId);
	            session.setAttribute("loginUser", loginUser);
	        }
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
	public String loginForm(HttpSession session, Model model)
	{    
		session.removeAttribute("error");
		model.addAttribute("error", null);
		return "/user/login";
	}

	// 로그인 처리
	@PostMapping("/login.action")
	public String loginSubmit(@RequestParam("loginId") String loginId,
	                          @RequestParam("password") String password,
	                          HttpSession session, Model model) {
	    UserDAO dao = sqlSession.getMapper(UserDAO.class);
	    UserDTO user = new UserDTO();
	    user.setLoginId(loginId);
	    user.setPassword(password);

	    try {
	        UserDTO result = dao.findUserByLoginIdAndPassword(user);

	        if (result != null && !"Y".equals(result.getIsDeleted())) {
	            // 로그인 허용
	            session.setAttribute("user_id", result.getUserId());
	            session.setAttribute("user_name", result.getName());
	            session.setAttribute("user_email", result.getEmail());
	            session.setAttribute("login_id", result.getLoginId());
	            session.setAttribute("loginUser", result);
	            session.setAttribute("user", result); 
	            return "redirect:/main.action";
	        } else {
	            model.addAttribute("error", "탈퇴한 회원이거나 비밀번호가 일치하지 않습니다.");
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
	        // 탈퇴 회원 포함하여 조회
	        UserDTO loginIdUser = dao.findUserByLoginId(user.getLoginId());
	        if (loginIdUser != null) {
	            if ("Y".equals(loginIdUser.getIsDeleted())) {
	                model.addAttribute("error", "탈퇴한 계정의 아이디는 재사용할 수 없습니다.");
	                return "/user/signup";
	            } else {
	                model.addAttribute("error", "이미 사용 중인 아이디입니다.");
	                return "/user/signup";
	            }
	        }

	        UserDTO emailUser = dao.findUserByEmail(user.getEmail());
	        if (emailUser != null) {
	            if ("Y".equals(emailUser.getIsDeleted())) {
	                model.addAttribute("error", "탈퇴한 계정의 이메일은 재사용할 수 없습니다.");
	                return "/user/signup";
	            } else {
	                model.addAttribute("error", "이미 등록된 이메일입니다.");
	                return "/user/signup";
	            }
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
	@GetMapping("/checkLoginId.action")
	@ResponseBody
	public String checkLoginId(@RequestParam("loginId") String loginId) {
	    UserDAO dao = sqlSession.getMapper(UserDAO.class);
	    UserDTO user = dao.findUserByLoginId(loginId);  // 탈퇴 여부 포함
	    if (user != null) {
	        if ("Y".equals(user.getIsDeleted())) {
	            return "withdrawn";  // 탈퇴한 아이디
	        } else {
	            return "duplicate";  // 사용 중인 아이디
	        }
	    }
	    return "available";
	}

	// 이메일 중복 확인
	@GetMapping("/checkEmail.action")
	@ResponseBody
	public String checkEmail(@RequestParam("email") String email) {
	    UserDAO dao = sqlSession.getMapper(UserDAO.class);
	    UserDTO user = dao.findUserByEmail(email);
	    if (user != null) {
	        if ("Y".equals(user.getIsDeleted())) {
	            return "withdrawn";  // 탈퇴한 이메일
	        } else {
	            return "duplicate";  // 사용 중인 이메일
	        }
	    }
	    return "available";
	}
	
	// 마이페이지 비밀번호 확인 진입
	@GetMapping("/checkPassword.action")
	public String checkPasswordForm() {
	    return "user/checkPassword"; // → /WEB-INF/view/user/checkPassword.jsp
	}
	
	// 마이페이지 비밀번호 확인
	@PostMapping("/checkPassword.action")
	public String checkPasswordSubmit(@RequestParam("password") String password,
	                                   @RequestParam(value = "target", required = false) String target,
	                                   HttpSession session,
	                                   Model model) {
	    Integer userId = (Integer) session.getAttribute("user_id");
	    if (userId == null) {
	        return "redirect:/login.action";
	    }

	    UserDAO dao = sqlSession.getMapper(UserDAO.class);
	    String storedPassword = dao.selectPasswordById(userId);

	    if (storedPassword != null && storedPassword.equals(password)) {
	        // 목적에 따라 분기
	        if ("withdraw".equals(target)) {
	            return "redirect:/withdrawUserForm.action";
	        } else {
	            return "redirect:/updateUserForm.action";
	        }
	    } else {
	        model.addAttribute("error", "비밀번호가 일치하지 않습니다.");
	        model.addAttribute("target", target);  // 다시 넘겨주기
	        return "user/checkPassword";
	    }
	}
	
	// 회원탈퇴 확인 페이지 진입
	@GetMapping("/withdrawUserForm.action")
	public String withdrawUserForm(HttpSession session) {
	    Integer userId = (Integer) session.getAttribute("user_id");
	    if (userId == null) {
	        return "redirect:/login.action";
	    }
	    return "user/withdrawUserForm"; // → /WEB-INF/view/user/withdrawUserForm.jsp
	}
	
	// 탈퇴 처리 POST
	@PostMapping("/withdrawUser.action")
	public String withdrawUser(HttpSession session) {
	    Integer userId = (Integer) session.getAttribute("user_id");
	    if (userId == null) {
	        return "redirect:/login.action";
	    }

	    UserDAO dao = sqlSession.getMapper(UserDAO.class);
	    dao.markUserAsDeleted(userId);  // 🔁 상태값 변경

	    session.invalidate();  // 세션 제거 (로그아웃)
	    return "redirect:/preLoginMain.action";
	}
	
	
	// 개인정보 수정 진입
	@GetMapping("/updateUserForm.action")
	public String updateUserForm(HttpSession session, Model model) {
	    Integer userId = (Integer) session.getAttribute("user_id");
	    if (userId == null) {
	        return "redirect:/login.action";
	    }

	    UserDAO dao = sqlSession.getMapper(UserDAO.class);
	    UserDTO user = dao.selectUserById(userId);
	    model.addAttribute("user", user);
	    return "user/updateUserForm";  // → /WEB-INF/view/user/updateUserForm.jsp
	}
	
	// 개인정보 수정
	@PostMapping("/updateUser.action")
	public String updateUserSubmit(@ModelAttribute UserDTO userDto,
	                               HttpSession session,
	                               Model model) {
	    Integer userId = (Integer) session.getAttribute("user_id");
	    if (userId == null) {
	        return "redirect:/login.action";
	    }

	    userDto.setUserId(userId);
	    UserDAO dao = sqlSession.getMapper(UserDAO.class);
	    dao.updateUser(userDto);

	    // 세션 이름도 최신화
	    session.setAttribute("user_name", userDto.getName());

	    return "redirect:/mypage.action";
	}

	@PostMapping("/updateProfile.action")
	public String updateProfile(@RequestParam("profileUpload") MultipartFile file,
	                            HttpSession session) {
	    try {
	        UserDTO user = (UserDTO) session.getAttribute("loginUser");
	        if (user == null) {
	            System.out.println("❌ 세션에 로그인 정보 없음");
	            return "redirect:/login.action";
	        }

	        if (!file.isEmpty()) {
	            // 1. 저장 디렉토리 설정
	            String uploadDir = "C:/upload/profile/";
	            File dir = new File(uploadDir);
	            if (!dir.exists()) dir.mkdirs();

	            // 2. 저장 파일명 생성
	            String fileName = UUID.randomUUID() + "_" + file.getOriginalFilename();
	            File dest = new File(uploadDir, fileName);
	            file.transferTo(dest);

	            // 3. DB 업데이트
	            UserDAO dao = sqlSession.getMapper(UserDAO.class);
	            dao.updateProfileImageById(user.getUserId(), fileName);

	            // 4. 세션 갱신
	            UserDTO updatedUser = dao.selectUserById(user.getUserId());
	            session.setAttribute("loginUser", updatedUser);
	            System.out.println("✔ 유저 객체 저장: " + updatedUser.getProfileImage());
	            session.setAttribute("user", updatedUser);


	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return "redirect:/mypage.action";
	}

	@GetMapping("/profile-image/{fileName:.+}")
	@ResponseBody
	public ResponseEntity<Resource> serveImage(@PathVariable String fileName) {
	    File file = new File("C:/upload/profile/" + fileName);

	    if (!file.exists())
	        return ResponseEntity.notFound().build();

	    String ext = fileName.substring(fileName.lastIndexOf(".") + 1).toLowerCase();
	    MediaType mediaType;

	    switch (ext) {
	        case "png": mediaType = MediaType.IMAGE_PNG; break;
	        case "gif": mediaType = MediaType.IMAGE_GIF; break;
	        case "jpg":
	        case "jpeg": mediaType = MediaType.IMAGE_JPEG; break;
	        default: mediaType = MediaType.APPLICATION_OCTET_STREAM; break;
	    }

	    return ResponseEntity.ok()
	            .contentType(mediaType)
	            .body(new FileSystemResource(file));
	}

	// 아이디 찾기 진입
	@GetMapping("/findLoginIdForm.action")
	public String findLoginIdForm() {
	    return "user/findLoginId";
	}
	
	// 아이디 찾기 
	@PostMapping("/findLoginId.action")
	public String findLoginId(@RequestParam("email") String email, Model model) {
	    UserDAO dao = sqlSession.getMapper(UserDAO.class);
	    UserDTO user = dao.findUserByEmail(email);
	    if (user != null && "N".equals(user.getIsDeleted())) {
	        model.addAttribute("loginId", user.getLoginId());
	    } else {
	        model.addAttribute("error", "해당 이메일로 가입된 계정을 찾을 수 없습니다.");
	    }
	    return "user/findLoginId";
	}
	
	// 비밀번호 찾기 폼 진입
	@GetMapping("/findPasswordForm.action")
	public String findPasswordForm() {
	    return "user/findPassword";
	}
	
	// 비밀번호 찾기
	@PostMapping("/resetPassword.action")
	public String resetPassword(@RequestParam("loginId") String loginId,
	                            @RequestParam("email") String email,
	                            Model model) {
	    UserDAO dao = sqlSession.getMapper(UserDAO.class);
	    UserDTO user = dao.findUserByLoginId(loginId);

	    if (user != null && "N".equals(user.getIsDeleted()) && email.equals(user.getEmail())) {
	        // 1. 임시 비밀번호 생성
	        String tempPassword = UUID.randomUUID().toString().substring(0, 8);

	        // 2. DB에 업데이트
	        dao.updatePasswordById(user.getUserId(), tempPassword);

	        // 3. 이메일 전송
	        try {
	            mailService.send(
	                email,
	                "[OneDayLog] 임시 비밀번호 안내",
	                "<p>안녕하세요, OneDayLog입니다.</p>" +
	                "<p>임시 비밀번호는 <strong>" + tempPassword + "</strong> 입니다.</p>" +
	                "<p>로그인 후 마이페이지에서 반드시 비밀번호를 변경해 주세요.</p>"
	            );
	            model.addAttribute("success", "임시 비밀번호가 이메일로 발송되었습니다.");
	        } catch (Exception e) {
	            e.printStackTrace();
	            model.addAttribute("error", "이메일 전송에 실패했습니다. 관리자에게 문의하세요.");
	        }

	    } else {
	        model.addAttribute("error", "아이디 또는 이메일이 올바르지 않습니다.");
	    }

	    return "user/findPassword";
	}




}
