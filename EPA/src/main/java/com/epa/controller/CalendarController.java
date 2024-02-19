package com.epa.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.epa.entity.calendar;
import com.epa.mapper.CalendarMapper;

@Controller
public class CalendarController {

	@Autowired
	private CalendarMapper calmapper;

	/* 캘린더화면 */
    
	@RequestMapping("/calender.do")
	public String calender(Model model) {
		List<calendar> list = calmapper.calender();
		model.addAttribute("list", list);
		return "calender";

	}
	
	/* 운동루틴 추가 */
	@RequestMapping("/calInsert.do")
	public void calInsert() {
		//calmapper.calInsert(vo);
		//return "redirect:/calender";
	}
	@RequestMapping("/calenderDelete.do/{PL_NO}")
	public String calDelete(@PathVariable("PL_NO") int PL_NO) {

		calmapper.calDelete(PL_NO);

		return "redirect:/calenderList.do";
	}
	
	@RequestMapping("/calenderUpdate.do")
	public String calUpdate(calendar vo) {

		calmapper.calUpdate(vo);

		return "redirect:/calenderList.do";
	}
	
	

}


	