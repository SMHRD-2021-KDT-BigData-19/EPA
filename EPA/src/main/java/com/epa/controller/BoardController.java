package com.epa.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.epa.mapper.BoardMapper;

import com.epa.entity.Board;

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

	@RequestMapping("/boardForm.do")
	public void boardForm() {

	}

	@RequestMapping("/boardInsert.do")
	public String boardInsert(Board vo) {
		mapper.boardInsert(vo);
		return "redirect:/boardList.do";
	}

	@RequestMapping("/boardContent.do/{BD_NO}")
	public String boardContent(@PathVariable("BD_NO") int theBD_NO, Model model) {

		Board vo = mapper.boardContent(theBD_NO);

		model.addAttribute("vo", vo);

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
