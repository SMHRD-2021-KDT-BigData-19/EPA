package com.epa.controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

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
		return "mainLogin";
	}

	@PostMapping("/Login.do")
	public String loginMember(Member vo, HttpSession session, Model model) {
		Member loginMember = mapper.loginMember(vo);

		if (loginMember != null) {
			// 입력한 비밀번호와 저장된 비밀번호를 비교
			if (vo.getMEM_PW().equals(loginMember.getMEM_PW())) {
				// 비밀번호가 일치하면 세션 속성 설정
				session.setAttribute("loginMember", loginMember);
				return "mainLogin";
			} else {
				// 비밀번호가 일치하지 않으면 오류 처리 (예: 오류 메시지 표시)
				System.out.println("잘못된 비밀번호입니다");

				// 사용자에게 알림을 보여주기 위해 Model에 메시지 추가
				model.addAttribute("loginError", "잘못된 비밀번호입니다");
				return "login"; // 로그인 화면으로 리다이렉트
			}
		} else {
			// 사용자를 찾을 수 없으면 오류 처리 (예: 오류 메시지 표시)
			System.out.println("로그인에 실패하셨습니다");

			// 사용자에게 알림을 보여주기 위해 Model에 메시지 추가
			model.addAttribute("loginError", " 아이디(로그인 전용 아이디) 또는 비밀번호를 잘못 입력했습니다!");
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

	@RequestMapping("/message.do")
	public String updateMemberMessage(String MEM_M, HttpSession session) {
		try {
			// 세션에서 현재 로그인한 사용자 정보를 가져옴
			Member currentMember = (Member) session.getAttribute("loginMember");
			// 현재 MEM_M 값이 NULL인 경우 INSERT 수행
			if (currentMember.getMEM_M() == null) {
				currentMember.setMEM_M(MEM_M);
				mapper.insertMessage(currentMember); // 이 부분은 새로운 INSERT 쿼리를 작성하여 사용해야 합니다.
			} else {
				// 새로운 MEM_M 값을 설정하고 업데이트 수행
				currentMember.setMEM_M(MEM_M);
				mapper.messageMember(currentMember);
			}

			// 콘솔에 업데이트된 정보 출력 (필요에 따라 로그를 사용하거나 생략 가능)
			System.out.println("MEM_M updated: " + MEM_M);

		} catch (Exception e) {
			System.out.println("ㄲㅂ!");
			e.printStackTrace();
			// 여기서 예외 처리 페이지로 리다이렉트하거나 다른 조치를 취할 수 있습니다.
			return "mypagecorrection";
		}
		return "redirect:/mypage.do";
	}


	@RequestMapping("/mypage.do")
	public ModelAndView mypage(HttpSession session, Model model) {
		Member currentMember = (Member) session.getAttribute("loginMember");
		String memM = mapper.getMEM_M(currentMember.getMEM_ID());

		// 모델에 MEM_M 값을 담아서 뷰로 전달
		model.addAttribute("memM", memM);

		// ModelAndView 객체를 사용하여 뷰 이름과 모델을 함께 반환
		return new ModelAndView("mypage");
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
		return "main"; // 메인 페이지 또는 다른 적절한 페이지로 리디렉션
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
