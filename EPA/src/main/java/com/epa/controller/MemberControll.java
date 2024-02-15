package com.epa.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.epa.entity.Member;
import com.epa.mapper.MemberMapper;

@Controller
public class MemberControll {

	@Autowired
	private MemberMapper mapper;

	/* 회원등록화면 */

	@RequestMapping("/joinInsert.do")
	public String joinInsert(Member vo) {
		mapper.joinInsert(vo);
		return "redirect:/boardList.do";
	}

	@PostMapping("/Login.do")
	public String loginMember(Member vo, HttpSession session) {

		Member loginMember = mapper.loginMember(vo);
		// 세션에 저장
		// HttpSession session = request.getSession();
		// request 사용하려면 매개변수 HttpServletRequest request
		if (loginMember != null) {
			session.setAttribute("loginMember", loginMember);
		}
		System.out.println("로그인");
		return "mainLogin";
	}
	
	
	@RequestMapping("/Logout.do")
	public String memberLogout(HttpSession session) {
		session.removeAttribute("loginMember");
		System.out.println("로그아웃");
		return "main";
	}
	
//	@RequestMapping("/googleLogin")
//	public void joinMemberByGoogle(Member vo) {
//		System.out.println("dd");
//		mapper.joinInsert(vo);
//		System.out.println("ㅊㅊ");
//	}
//
//	// 구글 로그인
//	@PostMapping("/Login.do")
//	public Member loginMemberByGoogle(Member vo) {
//		try {
//			return mapper.readMemberWithIDPW(vo.getMEM_ID(), vo.getMEM_PW());
//		} catch (Exception e) {
//		}
//	}

}
