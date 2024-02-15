package com.epa.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;

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
	public String updateMember(Member vo, HttpSession session) {
	    try {
	        // 세션에서 현재 로그인한 사용자 정보를 가져옴
	        Member currentMember = (Member) session.getAttribute("loginMember");

	        // 현재 세션에 저장된 회원 정보의 MEM_ID를 가져와서 vo에 설정
	        vo.setMEM_ID(currentMember.getMEM_ID());

	        // 업데이트 수행
	        mapper.updateMember(vo);

	        // 업데이트된 정보를 세션에 반영 (선택적으로)
	        currentMember.setMEM_PW(vo.getMEM_PW());
	        currentMember.setMEM_NM(vo.getMEM_NM());
	        currentMember.setMEM_EMAIL(vo.getMEM_EMAIL());
	        currentMember.setMEM_H(vo.getMEM_H());
	        currentMember.setMEM_W(vo.getMEM_W());

	        // 콘솔에 업데이트된 정보 출력 (필요에 따라 로그를 사용하거나 생략 가능)
	        System.out.println("MEM_PW: " + vo.getMEM_PW());
	        System.out.println("MEM_EMAIL: " + vo.getMEM_EMAIL());
	        System.out.println("MEM_NM: " + vo.getMEM_NM());
	        System.out.println("MEM_H: " + vo.getMEM_H());
	        System.out.println("MEM_W: " + vo.getMEM_W());
	        System.out.println("update");
	        
	    } catch (Exception e) {
	        System.out.println("ㄲㅂ!");
	        e.printStackTrace();
	        // 여기서 예외 처리 페이지로 리다이렉트하거나 다른 조치를 취할 수 있습니다.
	        return "mypagecorrection";
	    }
	    return "main";
	}

	@RequestMapping("/delete.do")
	public String deleteMember(HttpSession session) {
	    try {
	        Member currentMember = (Member) session.getAttribute("loginMember");

	        // 회원 삭제
	        mapper.deleteMember(currentMember);

	        // 삭제 후 세션 초기화
	        session.invalidate();

	        System.out.println("회원이 성공적으로 삭제되었습니다.");
	    } catch (Exception e) {
	        System.out.println("회원 삭제 실패");
	        e.printStackTrace();
	        // 필요한 경우 예외 처리
	    }
	    return "redirect:/"; // 메인 페이지 또는 다른 적절한 페이지로 리디렉션
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

