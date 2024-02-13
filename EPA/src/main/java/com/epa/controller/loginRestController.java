package com.epa.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.epa.entity.login;
import com.epa.mapper.loginMapper;

// POJO이긴 한데.... ResponseBody를 알아서 처리할 Controller다~
@RestController
public class loginRestController {

	// REST : 자원을 이름으로 구분하여 자원의 상태를 주고 받는 것
	// GET, POST, DELETE, PUT(update)
	// 보내는 요청이 board여도 보내는 방식에 따라서 각각의 요청으로 받아들인다.
	// a라는 데이터를 get 방식으로 /board요청에, 
	// b라는 데이터를 post 방식으로 /board요청에 넘겼을 때
	// 받아들이는 입장에서는 /board 요청이 get방식으로 왔으면 아 a구나~
	
	@Autowired
	 private loginMapper mdao;
	
	
	@GetMapping("/loginAjaxList.do")
	public List<login> loginAjaxList(){
		List<login> list = mdao.loginList();
		// RestController 주석덕분에 return에는 보낼 데이터를 담을 수 있음
		// @ResponseBody를 붙이지 않아도 됨
		return list;
		
	}

	@PostMapping("/loginList.do")
	public void memberAjaxInsert(login vo) {
		// title=0000&content=0000&writer=0000 데이터 넘어옴
		mdao.insertMember(vo);
	}
	
	@DeleteMapping("/loginList.do")
	public void memberAjaxDelete(login vo) {
		mdao.deleteMember(vo);
	}
	
	@PutMapping("/loginList.do")
	public void memberAjaxUpdate(@RequestBody login vo) {
		// json 형식으로 데이터가 넘어오면 Board 객체로 묶여있지 않음
		// 알아서 묶어주는 주석 @Requestbody
		
		// 글 내용만 수정하는 메소드 새로 만들기~
		mdao.updateMember(vo);
	}
	
	@GetMapping("/loginList.do/{MEM_ID}")
	public login updateCount(@PathVariable String MEM_ID){
		mdao.readMember(MEM_ID);
		// 조회수가 +1된 게시글의 내용 가져오기
		login vo = mdao.readMember(MEM_ID);
		return vo;
	}
}
