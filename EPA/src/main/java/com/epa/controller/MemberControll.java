package com.epa.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.epa.entity.Member;
import com.epa.mapper.MemberMapper;

@Controller
public class MemberControll {
	
	@Autowired
	private MemberMapper mapper;

	/* 회원등록화면 */
	
	@RequestMapping("/join.do")
	public void join() {
		
	}
	
	@RequestMapping("/joinInsert.do")
	public String joinInsert(Member vo) {
		mapper.joinInsert(vo);
		return "redirect:/boardList.do";
	}
}
