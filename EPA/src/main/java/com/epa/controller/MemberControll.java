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

	       if (loginMember != null) {
	           // 입력한 비밀번호와 저장된 비밀번호를 비교
	           if (vo.getMEM_PW().equals(loginMember.getMEM_PW())) {
	               // 비밀번호가 일치하면 세션 속성 설정
	               session.setAttribute("loginMember", loginMember);
	               return "mainLogin";
	           } else {
	               // 비밀번호가 일치하지 않으면 오류 처리 (예: 오류 메시지 표시)
	               System.out.println("비밀번호가 틀렸습니다");
	               // 여기서 로그인 오류 페이지로 리다이렉트하거나 다른 조치를 취할 수 있습니다
	               return "login";
	           }
	       } else {
	           // 사용자를 찾을 수 없으면 오류 처리 (예: 오류 메시지 표시)
	           System.out.println("사용자를 찾을 수 없습니다");
	           // 여기서 로그인 오류 페이지로 리다이렉트하거나 다른 조치를 취할 수 있습니다
	           return "login";
	       }
	   }
	
	@RequestMapping("/Logout.do")
	public String memberLogout(HttpSession session) {
		session.removeAttribute("loginMember");
		System.out.println("로그아웃");
		return "main";
	}
	
	@RequestMapping("/update.do")
	public void mypage() {
	}
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

