package com.epa.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;


import com.epa.mapper.BoardMapper;

import com.epa.entity.Board;
import com.epa.entity.Comment;
import com.epa.entity.Member;

@Controller
public class BoardController {
	@Autowired
	private BoardMapper mapper;

	@RequestMapping("/boardList.do")
	public String boardList(HttpSession session, Model model) {
	    try {
	        Member currentMember = (Member) session.getAttribute("loginMember");
	        if (currentMember == null) {
	            // 로그인되어 있지 않은 경우
	            model.addAttribute("errorMessage", "로그인 후 이용해주세요.");
	            return "main";
	        }

	        // 로그인된 경우
	        List<Board> list = mapper.boardList();
	        model.addAttribute("list", list);

	        return "boardList"; // 로그인되어 있으면 boardList.jsp로 이동
	    } catch (Exception e) {
	        // 예외가 발생한 경우
	        e.printStackTrace();
	        model.addAttribute("errorMessage", "로그인 후 이용해주세요.");
	        return "main";
	    }
	}

	@RequestMapping("/boardList2.do")
	public String boardList2(Model model) {
		List<Board> list2 = mapper.boardList2();
		model.addAttribute("list2", list2);
		return "boardList2";

	}
	@RequestMapping("/boardList3.do")
	public String boardList3(Model model) {
		List<Board> list3 = mapper.boardList3();
		model.addAttribute("list3", list3);
		return "boardList3";

	}
	@RequestMapping("/boardList4.do")
	public String boardList4(Model model) {
		List<Board> list4 = mapper.boardList4();
		model.addAttribute("list4", list4);
		return "boardList4";

	}



	@RequestMapping("/boardForm.do")
	public void boardForm() {

	}

	@RequestMapping("/boardInsert.do")
	public String boardInsert(Board vo) {
		
		mapper.boardInsert(vo);
		return "redirect:/boardList.do";
	}
	
	
	@RequestMapping("/commentInsert.do")
	public String commentInsert(Comment co) {
		mapper.commentInsert(co);
		return "redirect:/boardContent.do/"+co.getBD_NO();
	}

	@RequestMapping("/boardContent.do/{BD_NO}")
	public String boardContent(@PathVariable("BD_NO") int theBD_NO, Model model) {

		Board vo = mapper.boardContent(theBD_NO);
		List<Comment> comment = mapper.commnetContent(theBD_NO);

		model.addAttribute("vo", vo);
		model.addAttribute("comment",comment);

		return "boardContent";
	}

	@RequestMapping("/boardDelete.do/{BD_NO}")
	public String boardDelete(@PathVariable("BD_NO") int BD_NO) {

		mapper.boardDelete(BD_NO);

		return "redirect:/boardList.do";
	}

	@RequestMapping("/boardUpdateForm.do")
	public String boardUpdateForm(int BD_NO, Model model) {
		Board vo = mapper.boardContent(BD_NO);
		model.addAttribute("vo", vo);

		return "boardUpdateForm";
	}

	@RequestMapping("/boardUpdate.do")
	public String boardUpdate(Board vo) {

		mapper.boardUpdate(vo);

		return "redirect:/boardList.do";
	}
	
	


}
