package com.epa.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberLogin {

	/* 회원등록화면 */
	
	@RequestMapping("/login.do")
	public String memberWrite() {
		
		return "login";
	
}
}
