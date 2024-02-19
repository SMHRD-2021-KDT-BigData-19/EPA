package com.epa.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;


import com.epa.mapper.BoardMapper;

import com.epa.entity.Board;
import com.epa.entity.Comment;

@Controller
public class BoardController {
	@Autowired
	private BoardMapper mapper;

	@RequestMapping("/boardList.do")
	public String boardList(Model model) {
		List<Board> list = mapper.boardList();
		model.addAttribute("list", list);
		return "boardList";

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
