package com.epa.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.epa.entity.Member;
import com.epa.mapper.MemberMapper;

@Controller
public class viewsController {

	@Autowired
	private MemberMapper mapper;


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
	public void info() {
	}

	@RequestMapping("/use.do")
	public void use() {
	}

	@RequestMapping("/mypage.do")
	public void mypage() {
	}

	@RequestMapping("/mypagecorrection")
	public void mypagecorrection() {
	}
}
