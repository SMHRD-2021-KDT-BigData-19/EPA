package com.epa.controller;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.epa.entity.Member;

import org.springframework.ui.Model;


@Controller
public class viewsController {


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

	@RequestMapping("/mypage1.do")
	public void mypage() {

	}

	@RequestMapping("/mypagecorrection")
	public void mypagecorrection() {
	}
	
	@RequestMapping("/calendar")
	public void calendar() {
	}
	
	@RequestMapping("/level")
	public void level() {
	}
}
