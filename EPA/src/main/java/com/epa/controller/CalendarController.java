package com.epa.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.epa.entity.Member;
import com.epa.entity.calendar;
import com.epa.mapper.CalendarMapper;

@Controller
public class CalendarController {

	@Autowired
	private CalendarMapper calmapper;

	/* 캘린더화면 */
	@RequestMapping("/calendar.do")
	public String calendar(HttpSession session, Model model) {
		Member loginMember = (Member) session.getAttribute("loginMember");
		// System.out.println(loginMember.toString());
		List<calendar> list = calmapper.calendar(loginMember.getMEM_ID());
		
		
		 model.addAttribute("list", list);
		  
		return "calendar";
	}
	
	@RequestMapping("/calendarRest") // 캘린더 데이터 비동기 방식으로 응답
	public @ResponseBody List<calendar> calendarRest(HttpSession session, Model model) {
		Member loginMember = (Member) session.getAttribute("loginMember");
		// System.out.println(loginMember.toString());
		List<calendar> list = calmapper.calendar(loginMember.getMEM_ID());
		return list;
	}
	@RequestMapping("/myScDelete.do")
	public String calendarDelete(@RequestParam("pl_BUNHO")int thePL_BUNHO) {
		
		System.out.println(thePL_BUNHO);
		calmapper.calendarDelete(thePL_BUNHO);
	
		return "redirect:/calendar.do";
		
	}
	
	/* 운동루틴 추가 */
	@RequestMapping("/calInsert.do")
	public String calInsert(calendar vo) {
		calmapper.calInsert(vo);
		return "redirect:/calendar.do";
	}
	 

}
