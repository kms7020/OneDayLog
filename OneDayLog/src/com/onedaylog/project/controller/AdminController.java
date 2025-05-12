package com.onedaylog.project.controller;

import com.onedaylog.project.dto.AdminDTO;
import com.onedaylog.project.dto.AdminUserStatsDTO;
import com.onedaylog.project.dao.AdminDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class AdminController {

    @Autowired
    private AdminDAO adminDAO;

    // 관리자 로그인 폼 진입
    @GetMapping("/adminLoginForm.action")
    public String adminLoginForm() {
        System.out.println("✅ adminLoginForm 접근됨");
        return "admin/adminLogin";
    }


    // 관리자 로그인
    @PostMapping("/adminLogin.action")
    public String adminLogin(@RequestParam("adminId") String adminId,
                             @RequestParam("adminPw") String adminPw,
                             HttpSession session,
                             Model model) {

        System.out.println("입력 ID: " + adminId);
        System.out.println("입력 PW: " + adminPw);

        Map<String, Object> param = new HashMap<>();
        param.put("adminId", adminId);
        param.put("adminPw", adminPw);
        AdminDTO admin = adminDAO.loginAdmin(param);
        
        if (admin != null) {
            System.out.println("✅ 관리자 이름: " + admin.getAdminName());
        }

        System.out.println("💡 adminId: " + param.get("adminId"));
        System.out.println("💡 adminPw: " + param.get("adminPw"));

        System.out.println("조회 결과: " + (admin != null ? "성공" : "실패"));

        if (admin != null) {
            session.setAttribute("adminLogin", true);
            return "redirect:/adminMain.action";
        } else {
            model.addAttribute("errorMsg", "아이디 또는 비밀번호가 일치하지 않습니다.");
            return "admin/adminLogin";
        }
    }

    // 관리자 로그아웃
    @GetMapping("/adminLogout.action")
    public String adminLogout(HttpSession session) {
        session.removeAttribute("adminLogin");
        return "redirect:/preLoginMain.action";
    }

    // 관리자 메인
    @GetMapping("/adminMain.action")
    public String adminMain(HttpSession session, Model model) {
        Boolean isAdmin = (Boolean) session.getAttribute("adminLogin");

        if (isAdmin != null && isAdmin) {
            int totalUsers = adminDAO.getTotalUserCount();
            int withdrawnUsers = adminDAO.getWithdrawnUserCount();

            model.addAttribute("totalUsers", totalUsers);
            model.addAttribute("withdrawnUsers", withdrawnUsers);

            return "admin/adminMain";
        } else {
            return "redirect:/preLoginMain.action";
        }
    }

    // 사용자 조회
    @RequestMapping("/adminUserList.action")
    public String adminUserList(@RequestParam(value = "searchField", required = false) String searchField,
                                @RequestParam(value = "searchKeyword", required = false) String searchKeyword,
                                Model model) {

        Map<String, String> paramMap = new HashMap<>();
        paramMap.put("searchField", searchField);
        paramMap.put("searchKeyword", searchKeyword);

        List<AdminUserStatsDTO> userList = adminDAO.getUserListWithStats(paramMap);

        model.addAttribute("userList", userList);
        model.addAttribute("searchField", searchField);
        model.addAttribute("searchKeyword", searchKeyword);

        return "admin/adminUserList";
    }

    // 탈퇴회원 조회
    @RequestMapping("/adminWithdrawnList.action")
    public String withdrawnUserList(@RequestParam(value = "searchField", required = false) String searchField,
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

    // 회원 탈퇴 처리
    @PostMapping("/withdraw.action")
    public String withdrawUser(@RequestParam("userId") int userId) {
        System.out.println("✅ withdraw.action 진입 확인");
        System.out.println("🧩 탈퇴 대상 userId: " + userId);

        adminDAO.withdrawUser(userId);
        return "redirect:/adminUserList.action";
    }

    // 회원 복구
    @PostMapping("/recoverUser.action")
    public String recoverUser(@RequestParam("userId") int userId) {
        System.out.println("복구 대상 userId: " + userId);
        adminDAO.recoverUser(userId);
        return "redirect:/adminWithdrawnList.action";
    }

    // 회원 영구 삭제
    @PostMapping("/deleteWithdrawnUser.action")
    public String deleteWithdrawnUser(@RequestParam("userId") int userId) {
        adminDAO.deleteWithdrawnUser(userId);
        return "redirect:/adminWithdrawnList.action";
    }
}
