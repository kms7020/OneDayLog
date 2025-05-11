package com.onedaylog.project.controller;

import com.onedaylog.project.dto.AdminDTO;
import com.onedaylog.project.dto.AdminUserStatsDTO;
import com.onedaylog.project.dao.AdminDAO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

@Controller
public class AdminController {

    @Autowired
    private SqlSession sqlSession;

    @Autowired
    private AdminDAO adminDAO;
    
    private static final String ACCESS_KEY = "letmein123";
    
    // 관리자 로그인 폼 진입 
    @GetMapping("/adminLoginForm.action")
    public String adminLoginForm() {
        return "admin/adminLogin";
    }

    // 관리자 로그인
    @PostMapping("/adminLogin.action")
    public String adminLogin(@RequestParam("adminId") String adminId,
                             @RequestParam("adminPw") String adminPw,
                             HttpSession session,
                             Model model) {

        // 하드코딩된 관리자 정보
        String fixedId = "kms7262";
        String fixedPw = "135724"; // 실제 운영시에는 암호화된 값을 비교하는 게 안전함

        if (adminId.equals(fixedId) && adminPw.equals(fixedPw)) {
            session.setAttribute("adminLogin", true); // 로그인 상태 저장
            return "redirect:/adminMain.action"; // 관리자 메인 페이지로 이동
        } else {
            model.addAttribute("errorMsg", "아이디 또는 비밀번호가 일치하지 않습니다.");
            return "admin/adminLogin"; // 다시 로그인 폼으로
        }
    }
    
    // 관리자 로그아웃 처리
    @GetMapping("/adminLogout.action")
    public String adminLogout(HttpSession session) {
        session.removeAttribute("adminLogin");
        return "redirect:/preLoginMain.action";
    }
    
    // 관리자 페이지 진입
    @GetMapping("/adminMain.action")
    public String adminMain(HttpSession session, Model model) {
        Boolean isAdmin = (Boolean) session.getAttribute("adminLogin");

        if (isAdmin != null && isAdmin) {
            // ✅ 예시 DAO 또는 Service로부터 데이터 가져오기
            int totalUsers = adminDAO.getTotalUserCount();
            int withdrawnUsers = adminDAO.getWithdrawnUserCount();

            // ✅ 모델에 담기
            model.addAttribute("totalUsers", totalUsers);
            model.addAttribute("withdrawnUsers", withdrawnUsers);

            return "admin/adminMain";
        } else {
            return "redirect:/preLoginMain.action";
        }
    }


    
    @PostMapping("/admin-access-check.action")
    @ResponseBody
    public String checkAdminAccessKey(@RequestParam("accessKey") String accessKey) {
        if (ACCESS_KEY.equals(accessKey)) {
            return "success";
        }
        return "fail";
    }
    
    // 사용자 조회
    @RequestMapping("/adminUserList.action")
    public String adminUserList(
        @RequestParam(value = "searchField", required = false) String searchField,
        @RequestParam(value = "searchKeyword", required = false) String searchKeyword,
        Model model) {

        AdminDAO dao = sqlSession.getMapper(AdminDAO.class);

        Map<String, String> paramMap = new HashMap<>();
        paramMap.put("searchField", searchField);
        paramMap.put("searchKeyword", searchKeyword);

        List<AdminUserStatsDTO> userList = dao.getUserListWithStats(paramMap);

        model.addAttribute("userList", userList);
        model.addAttribute("searchField", searchField);
        model.addAttribute("searchKeyword", searchKeyword);

        return "admin/adminUserList";
    }

    	// 탈퇴회원 관리
	    @RequestMapping("/adminWithdrawnList.action")
	    public String withdrawnUserList(
	        @RequestParam(value = "searchField", required = false) String searchField,
	        @RequestParam(value = "searchKeyword", required = false) String searchKeyword,
	        Model model) {
	
	        Map<String, String> paramMap = new HashMap<>();
	        paramMap.put("searchField", searchField);
	        paramMap.put("searchKeyword", searchKeyword);
	
	        List<AdminUserStatsDTO> withdrawnUsers = adminDAO.getWithdrawnUserList(paramMap);
	
	        model.addAttribute("withdrawnUsers", withdrawnUsers);
	        model.addAttribute("searchField", searchField);
	        model.addAttribute("searchKeyword", searchKeyword);
	
	        return "admin/withdrawnUserList";
	    }

        
        // 탈퇴일 확인
        @PostMapping("/withdraw.action")
        public String withdrawUser(@RequestParam("userId") int userId) {
        	System.out.println("✅ withdraw.action 진입 확인"); 
            System.out.println("🧩 탈퇴 대상 userId: " + userId);

            AdminDAO dao = sqlSession.getMapper(AdminDAO.class);
            dao.withdrawUser(userId);

            // 명시적 커밋 (트랜잭션 관리가 없다면 필수)
            sqlSession.commit(); // ✅ 이 줄 추가해보고 반영되는지 확인

            return "redirect:/adminUserList.action";
        }



        
        // 회원 복구
        @PostMapping("recoverUser.action")
        public String recoverUser(@RequestParam("userId") int userId) {
        	System.out.println("복구 대상 userId: " + userId); 
            AdminDAO dao = sqlSession.getMapper(AdminDAO.class);
            dao.recoverUser(userId);
            return "redirect:adminWithdrawnList.action";
        }

        
        // 회원 영구 삭제
        @PostMapping("/deleteWithdrawnUser.action")
        public String deleteWithdrawnUser(@RequestParam("userId") int userId) {
            AdminDAO dao = sqlSession.getMapper(AdminDAO.class);
            dao.deleteWithdrawnUser(userId);
            return "redirect:/adminWithdrawnList.action";
        }

    
}
