package com.epa.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.epa.entity.epa;
import com.epa.entity.login;
import com.epa.mapper.loginMapper;

@Controller
public class loginController {

    @Autowired
    private loginMapper mdao;

	@RequestMapping("/")
    public String memloginForm() {
		return "login";
	}
	
	
	@GetMapping("loginAjaxMain.do")
	public String loginAjaxMain() {
		// return의 용도 1) jsp 이름 
		// 용도2) redirect:/ 다른요청으로 보내기
		return "login";
	}
	@PostMapping("/Join.do")
	public String memberJoin(@ModelAttribute("mvo") login vo, HttpSession session) {
		// 회원가입 처리
		mdao.insertMember(vo);	
		// 가입 후 자동 로그인 (세션에 저장)
		session.setAttribute("loginMember", vo);
		
		System.out.println("회원탈퇴는 없다...");
		return "redirect:/boardAjaxMain.do";
	}
    // 로그인 처리
	@RequestMapping("login.do")
    public login loginMember(@RequestBody login vo) {
        try {
            login returnVO = mdao.readMemberWithIDPW(vo.getMEM_ID(), vo.getMEM_PW());
            return returnVO;
        } catch (Exception e) {
            // 로깅 시스템에 예외 로그를 기록하고, 사용자에게 의미 있는 메시지 반환
            return null;
        }
    }

    // 회원가입시 아이디중복확인
    public login idCheck(String MEM_ID) {
        return mdao.idCheck(MEM_ID);
    }

    // 회원정보보기
    public login readMember(String MEM_ID) {
        try {
            return mdao.readMember(MEM_ID);
        } catch (Exception e) {
            return null;
        }
    }

    // 회원정보 수정
    public void updateMember(login vo) {
        try {
            mdao.updateMember(vo);
        } catch (Exception e) {
            // 로깅 시스템에 예외 로그를 기록
        }
    }

    // 회원탈퇴
    public void deleteMember(login vo) {
        try {
            mdao.deleteMember(vo);
        } catch (Exception e) {
            // 로깅 시스템에 예외 로그를 기록
        }
    }

    // 구글 회원가입
    public void joinMemberByGoogle(login vo) {
        mdao.insertMember(vo);
    }

    //구글 로그인
    
    public login loginMemberByGoogle(login vo) {
        try {
            return mdao.readMemberWithIDPW(vo.getMEM_ID(), vo.getMEM_PW());
        } catch (Exception e) {
        	  return null;
        }
    }
}

