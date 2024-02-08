package com.epa.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.epa.entity.epa;
import com.epa.mapper.memberMapper;

@Controller
public class memberController {
	
	
	@Autowired
	private memberMapper mmapper;
	
	
	@RequestMapping("/")
	public String memJoinForm() {
		return "login/join";
	}
	
	
	@PostMapping("/Join.do")
	public String memberJoin(@ModelAttribute("mvo") epa mvo, HttpSession session) {
		// 회원가입 처리
		mmapper.memberJoin(mvo);	
		// 가입 후 자동 로그인 (세션에 저장)
		session.setAttribute("loginMember", mvo);
		
		System.out.println("회원탈퇴는 없다...");
		return "redirect:/boardAjaxMain.do";
	}
	
	
	@PostMapping("/Login.do")
	public String memLogin(epa mvo, HttpSession session) {
		
		epa loginMember = mmapper.memberLogin(mvo);
		// 세션에 저장
		// HttpSession session = request.getSession();
		// request 사용하려면 매개변수 HttpServletRequest request
		if(loginMember != null) {
			session.setAttribute("loginMember", loginMember);
		}
		
		// 로그인하고 나면 basic.jsp가 실행되도록
		// 이미 bloardController에서 만듦
		// 다른 요청으로 가야함
		return "redirect:/boardAjaxMain.do";
	}
	
	@RequestMapping("/Logout.do")
	public String memberLogout(HttpSession session) {
		session.removeAttribute("loginMember");
		return "redirect:/boardAjaxMain.do";
	}
	
	
	
}
