package com.epa.controller;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.epa.entity.epa;
import com.epa.mapper.memberMapper;

@Controller
public class memberController {

	@Autowired
	private memberMapper mmapper;

//	@RequestMapping("/")
//	public String memJoinForm() {
//		return "main";
//	}

	@GetMapping("/join")
	public String joinPage() {

		return "join";
	}

	@PostMapping("/test")
	public String test() {
		System.out.println("test");
		return "redirect:/join";
	}

	@PostMapping("/join1")
	public String memberJoin(HttpServletRequest request) {
	    String MEMEMAIL = request.getParameter("MEMEMAIL");
	    String MEMID = request.getParameter("MEMID");
	    String MEMPW = request.getParameter("MEMPW");
	    String MEMNM = request.getParameter("MEMNM");
	    String MEMH = request.getParameter("MEMH");
	    String MEMW = request.getParameter("MEMW");
	    String MEMAGE = request.getParameter("MEMAGE");
	    String MEMG = request.getParameter("MEMG");

	    // 생성자 또는 새로운 객체를 이용하여 필요한 정보를 저장
	    epa newMember = new epa();
	    newMember.setMEMEMAIL(MEMEMAIL);
	    newMember.setMEMID(MEMID);
	    newMember.setMEMPW(MEMPW);
	    newMember.setMEMNM(MEMNM);
	    // 나머지 필드도 마찬가지로 설정


	    // 회원가입 처리
	    mmapper.memberJoin(newMember);

	    return "redirect:/boardAjaxMain.do";
	}



	@PostMapping("/join2")
	public String memberJoin(epa mvo) {
		System.out.println("실행");
		System.out.println(mvo.getMEMEMAIL());
		return "main";
	}
	
    @PostMapping("/Join4")
    public String memberJoin(@ModelAttribute("mvo") epa mvo, HttpSession session, epa model) {
        // 디버깅 메시지 추가
        System.out.println("Received MEM_ID: " + mvo.getMEMID());
        System.out.println("Received MEM_EMAIL: " + mvo.getMEMEMAIL());

        try {
            // 회원가입 처리
            mmapper.memberJoin(mvo);

            // 가입 후 자동 로그인 (세션에 저장)
            session.setAttribute("loginMember", mvo);

            System.out.println("회원 가입 및 로그인 성공!");
            return "redirect:/boardAjaxMain.do";
        } catch (Exception e) {
            // 가입 실패 시 처리
            System.out.println("회원 가입 실패: " + e.getMessage());
//            model.addAttribute("join", "회원 가입에 실패하였습니다.");
            return "main";  // 에러 페이지로 이동 또는 다른 적절한 처리
        }
    }
	
	@PostMapping("/join3")
	public String memberJoin(epa mvo, HttpSession session) {
		System.out.println("나와라!!");

		// 에러가 발생하는 부분에서 디폴트 생성자를 이용하여 객체 생성
		epa newMember = new epa();

		// 회원 정보 복사
		newMember.setMEMID(mvo.getMEMID());
		newMember.setMEMPW(mvo.getMEMPW());
		newMember.setMEMNM(mvo.getMEMNM());
		newMember.setMEMAGE(mvo.getMEMAGE());
		newMember.setMEMH(mvo.getMEMH());
		newMember.setMEMW(mvo.getMEMW());
		newMember.setMEMG(mvo.getMEMG());
		newMember.setMEMEMAIL(mvo.getMEMEMAIL());
//		newMember.setJOINDATE(mvo.getJOINDATE());

		// 회원가입 처리
		mmapper.memberJoin(newMember);

		// 가입 후 자동 로그인 (세션에 저장)
		session.setAttribute("loginMember", newMember);

		System.out.println("성공");
		return "redirect:/boardAjaxMain.do";
	}

	@PostMapping("/Login.do")
	public String memLogin(epa mvo, HttpSession session) {

		epa loginMember = mmapper.memberLogin(mvo);
		// 세션에 저장
		if (loginMember != null) {
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
