package com.epa.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


import com.epa.entity.Member;
import com.epa.entity.calendar;
import com.epa.mapper.CalendarMapper;

@Controller
public class CalendarController {

	@Autowired
	private CalendarMapper calmapper;

	/* 캘린더화면 */
	@RequestMapping("/calendar.do")
	public String calendar(HttpSession session, Model model, calendar vo) {
		Member loginMember = (Member) session.getAttribute("loginMember");
		// System.out.println(loginMember.toString());
		List<calendar> list = calmapper.calendar(loginMember.getMEM_ID());
//		for(calendar vo : list) {
//			System.out.println(vo.toString()); 
//			}
		calmapper.calInsert(vo);

		
		 model.addAttribute("list", list);
		  
		return "calendar";
	}

	
	  
	 
	
	
	 

}
