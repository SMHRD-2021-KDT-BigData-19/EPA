package com.epa.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.epa.entity.epa;
import com.epa.mapper.BoardMapper;

// 실제로 일을 하는 컨트롤러임을 알려주는 주석(어노테이션)
// 주석 : 클래스를 실행하기 전에 전처리 과정에서 표시
// 초창기 개발 @Component라고 표현하기도 함
@Controller
public class BoardController {
	
	// 메모리상에 객체를 사용하기 위해 올려놓는 행위를 시켜줌
	// 요즘에는 @Inject 로 사용하기도함
	@Autowired
	private BoardMapper mapper;
	// 기존 사용했던 생성자 주입보다 조금더 유연성이 높은 의존성 주입(Dependency Injection)
	
	// boardAjaxMain.do 요청을 받아서 basic.jsp를 실행시키는 메소드 작성

	@GetMapping("boardAjaxMain.do")
	public String boardAjaxMain() {
		// return의 용도 1) jsp 이름 
		// 용도2) redirect:/ 다른요청으로 보내기
		return "join";
	}
	
	// public void basic(){} 안됨!
	// 메소드이름 아니라 요청의 경로에서 boardAjaxMain을 찾더라
	
	// @Responsebody만 관리할 수 있는 컨트롤러를 만들 예정
	// BoardRestController 짓기 ->class 파일
	
	
	// ajax type이 get 방식으로 넘어옴
	/*
	 * @GetMapping("/boardAjaxList.do") public @ResponseBody List<Board>
	 * boardajaxList() { System.out.println("요청은 처리함"); // ajax 통신의 결과로 return 데이터를
	 * 보내줘야함 // @ResponseBody : 응답을 forwarding방식이 아닌, 데이터를 바로 응답 // 알아서 json으로 스프링이
	 * 바궈줌 // (jackson-databind 라이브러리 추가)
	 * 
	 * List<Board> list = mapper.boardList();
	 * 
	 * return list; }
	 */
}
	
	
