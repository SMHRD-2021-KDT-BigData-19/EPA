package com.epa.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
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
		model.addAttribute("list",list);
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
	public String boardContent(@PathVariable("BD_NO")int theBD_NO, Model model) {
		
		Board vo =mapper.boardContent(theBD_NO);
		
		model.addAttribute("vo", vo);
		
		return "boardContent";
	}
	
	
	//	마이페이지 이동 경로
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
    public void info() { 	
    }
    
    @RequestMapping("/use.do")
    public void use() {
    }
    
    @RequestMapping("/mypage.do")
    public void mypage() {
    }
}
