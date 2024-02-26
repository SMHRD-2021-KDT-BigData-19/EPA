package com.epa.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.epa.mapper.BoardMapper;



@RestController
public class ResetController {
	
	@Autowired
	private BoardMapper mapper;
	
	@DeleteMapping("/commentDelete.do/{COM_NO}")
	   public String deleteComment(@PathVariable("COM_NO") int com_NO) {
		   System.out.println(com_NO);
	       mapper.deleteComment(com_NO);
	       return "boardContent"; // 댓글 삭제 후 원래 페이지로 redirect
	   }

}
