package com.onedaylog.project.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import com.onedaylog.project.dao.DiaryDAO;
import com.onedaylog.project.dto.DiaryDTO;
import com.onedaylog.project.dto.UserDTO;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;

@Controller
public class DiaryController {

    @Autowired
    private SqlSession sqlSession;
    @Autowired
    private DiaryDAO diaryDAO;
    
    @GetMapping("/diaryList.action")
    public String diaryList(@RequestParam(value = "order", defaultValue = "desc") String order,
                            HttpSession session,
                            Model model) {
        UserDTO user = (UserDTO) session.getAttribute("loginUser");
        if (user == null) {
            return "redirect:/login.action";
        }

        int userId = user.getUserId();
        DiaryDAO dao = sqlSession.getMapper(DiaryDAO.class);

        // 정렬 기준 전달
        Map<String, Object> paramMap = new HashMap<>();
        paramMap.put("userId", userId);
        paramMap.put("order", order);

        List<DiaryDTO> diaryList = dao.getDiaryListSorted(paramMap);
        model.addAttribute("diaryList", diaryList);
        return "diary/diaryList";
    }


    @PostMapping("/diaryWrite.action")
    public String diaryWriteSubmit(@RequestParam("content") String content, HttpSession session) {
        Integer userId = (Integer) session.getAttribute("user_id");
        if (userId == null) return "redirect:/login.action";

        DiaryDTO dto = new DiaryDTO();
        dto.setUserId(userId);
        dto.setContent(content);

        DiaryDAO dao = sqlSession.getMapper(DiaryDAO.class);
        dao.insertDiary(dto);

        return "redirect:/diaryList.action";
    }
    

    
    @PostMapping("/diaryDelete.action")
    public String deleteDiary(@RequestParam("diaryId") int diaryId) {
    	System.out.println("📌 삭제 요청 도착 - diaryId: " + diaryId);
        diaryDAO.deleteDiary(diaryId);
        return "redirect:/diaryList.action";
    }
    
    @GetMapping("/diaryUpdateForm.action")
    public String showUpdateForm(@RequestParam("diaryId") int diaryId, Model model) {
        DiaryDAO dao = sqlSession.getMapper(DiaryDAO.class);
        DiaryDTO diary = dao.findById(diaryId);
        
        // 👇 확인용 로그
        System.out.println("📋 수정 진입 DTO ID: " + diary.getDiaryId());
        System.out.println("📋 날짜: " + diary.getDiaryDate());

        model.addAttribute("diary", diary);  // JSP로 전달
        return "diary/diaryUpdateForm";
    }


    @PostMapping("/diaryUpdate.action")
    public String updateDiary(DiaryDTO dto) {
        System.out.println("🛠 일기 수정 요청 들어옴");
        System.out.println("ID: " + dto.getDiaryId());
        System.out.println("내용: " + dto.getContent());
        System.out.println("날짜: " + dto.getDiaryDate()); // ← 여기에 찍히는지 꼭 확인

        DiaryDAO dao = sqlSession.getMapper(DiaryDAO.class);
        dao.updateDiary(dto);
        return "redirect:/diaryList.action";
    }

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        sdf.setLenient(false);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(sdf, true));
    }


}
