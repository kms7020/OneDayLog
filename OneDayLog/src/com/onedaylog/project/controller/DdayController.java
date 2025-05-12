package com.onedaylog.project.controller;

import com.onedaylog.project.dao.DdayDAO;
import com.onedaylog.project.dto.DdayDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
public class DdayController
{

	@Autowired
	private SqlSession sqlSession;

	@InitBinder
	public void initBinder(WebDataBinder binder) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		sdf.setLenient(false);
		binder.registerCustomEditor(Date.class, new org.springframework.beans.propertyeditors.CustomDateEditor(sdf, false));
	}

	
    @GetMapping("/ddayList.action")
    public String getDdayList(@RequestParam(value = "order", defaultValue = "asc") String order,
                              HttpSession session, Model model) {
        int userId = (int) session.getAttribute("user_id");
        DdayDAO dao = sqlSession.getMapper(DdayDAO.class);
        List<DdayDTO> list = order.equals("desc")
                ? dao.selectUpcomingDdayDesc(userId)
                : dao.selectUpcomingDdayByUserId(userId);
        model.addAttribute("ddayList", list);
        return "dday/ddayList";
    }

	@GetMapping("/ddayWrite.action")
	public String writeDdayForm()
	{
		return "dday/ddayWrite";
	}
	
	@PostMapping("/ddayInsert.action")
	public String insertDday(@ModelAttribute DdayDTO dto, HttpSession session)
	{
		int userId = (int) session.getAttribute("user_id");
		dto.setUserId(userId);
		DdayDAO dao = sqlSession.getMapper(DdayDAO.class);
		dao.insertDday(dto);
		return "redirect:/ddayList.action";
	}

	@PostMapping("/ddayDelete.action")
	public String deleteDday(@RequestParam("ddayId") int ddayId)
	{
		DdayDAO dao = sqlSession.getMapper(DdayDAO.class);
		dao.deleteDday(ddayId);
		return "redirect:/ddayList.action";
	}

	// 상세 보기
	@GetMapping("/ddayDetail.action")
	public String ddayDetail(@RequestParam("ddayId") int ddayId, Model model) {
	    DdayDAO dao = sqlSession.getMapper(DdayDAO.class);
	    DdayDTO dto = dao.selectDdayById(ddayId);
	    model.addAttribute("dday", dto);
	    return "dday/ddayDetail"; // → /WEB-INF/view/dday/ddayDetail.jsp
	}

	// 중요 표시 토글
	@PostMapping("/toggleImportant.action")
	public String toggleImportant(@RequestParam("ddayId") int ddayId,
	                              HttpServletRequest request) {
	    DdayDAO dao = sqlSession.getMapper(DdayDAO.class);
	    dao.toggleImportant(ddayId);
	    
	    // referer로 돌아가기 (예: main.action)
	    String referer = request.getHeader("Referer");
	    return "redirect:" + referer;
	}

	// 수정 폼 진입
	@GetMapping("/ddayEdit.action")
	public String ddayEditForm(@RequestParam("ddayId") int ddayId, Model model) {
	    System.out.println("✅ 수정 폼 진입 - ID: " + ddayId);
	    DdayDAO dao = sqlSession.getMapper(DdayDAO.class);
	    DdayDTO dto = dao.getDdayById(ddayId);
	    System.out.println("→ DAO로부터 받은 DTO ID: " + dto.getDdayId());  // 👈 이거 꼭 찍기
	    model.addAttribute("dday", dto);
	    return "dday/ddayEdit";
	}

	// 수정 처리
	@PostMapping("/ddayEdit.action")
	public String ddayEditSubmit(DdayDTO dto) {
	    System.out.println("🛠 수정 요청 들어옴");
	    System.out.println("ID: " + dto.getDdayId());
	    System.out.println("제목: " + dto.getTitle());
	    System.out.println("날짜: " + dto.getTargetDate());

	    DdayDAO dao = sqlSession.getMapper(DdayDAO.class);
	    dao.updateDday(dto);
	    return "redirect:/ddayList.action";
	}



}
