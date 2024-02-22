package com.epa.controller;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.epa.entity.Board;
import com.epa.entity.Member;




@Controller
public class viewsController {


	// 마이페이지 이동 경로
	@RequestMapping("/login.do")
	public void login() {
	}

	@RequestMapping("/main.do")
	public void main() {
	}

	@RequestMapping("/join.do")
	public void join() {
	}

	@RequestMapping("/info.do")
	public String info(HttpSession session, Model model) {
	    try {
	        Member currentMember = (Member) session.getAttribute("loginMember");
	        if (currentMember == null) {
	            // 로그인되어 있지 않은 경우
	            model.addAttribute("errorMessage", "로그인 후 이용해주세요.");
	            return "main";
	        }

	        // 로그인된 경우
	        // 추가적인 처리를 할 수 있으면 여기에 작성

	        return "info"; // 로그인되어 있으면 info.jsp로 이동
	    } catch (Exception e) {
	        // 예외가 발생한 경우
	        e.printStackTrace();
	        model.addAttribute("errorMessage", "로그인 후 이용해주세요.");
	        return "main";
	    }
	}


	@RequestMapping("/use.do")
	public String use(HttpSession session) {
	    try {
	        Member currentMember = (Member) session.getAttribute("loginMember");
	        if (currentMember == null) {    
	            return "use";
	        }

	        return "useafter"; // 로그인되어 있으면 boardList.jsp로 이동
	    } catch (Exception e) {
	       
	        return "use";
	    }
	}

	@RequestMapping("/mypage1.do")
	public void mypage() {

	}

	@RequestMapping("/mypagecorrection")
	public void mypagecorrection() {
	}
	
	@RequestMapping("/calendar")
	public void calendar() {
	}
	
	@RequestMapping("/level")
	public void level() {
	}
	
	@RequestMapping("/stretching")
	public void stretching() {
	}
	
	@RequestMapping("/exercise")
	public void exercise() {
	}
	
	@RequestMapping("/mainLogin.do")
	public void mainLogin() {
	}
}
