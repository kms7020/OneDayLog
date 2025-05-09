package com.onedaylog.project.controller;

import java.util.List;
import javax.servlet.http.HttpSession;

import com.onedaylog.project.dao.DiaryDAO;
import com.onedaylog.project.dto.DiaryDTO;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class DiaryController {

    @Autowired
    private SqlSession sqlSession;
    @Autowired
    private DiaryDAO diaryDAO;
    
    @GetMapping("/diaryList.action")
    public String diaryList(HttpSession session, Model model) {
        Integer userId = (Integer) session.getAttribute("user_id");
        if (userId == null) return "redirect:/login.action";

        DiaryDAO dao = sqlSession.getMapper(DiaryDAO.class);
        List<DiaryDTO> diaryList = dao.getDiaryListByUserId(userId);
        model.addAttribute("diaryList", diaryList);

        return "/diary/diaryList";
    }

    @GetMapping("/diaryWrite.action")
    public String diaryWriteForm() {
        return "/diary/diaryWrite";
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


}
