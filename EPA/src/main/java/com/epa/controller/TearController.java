package com.epa.controller;

import com.epa.entity.Member;
import com.epa.entity.TearVO;
import com.epa.mapper.TearMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpSession;

@Controller
public class TearController {

    @Autowired
    private TearMapper tearMapper;

    @GetMapping("/Tear.do")  
    public String yourPage(HttpSession session, Model model) {
    	Member info = (Member) session.getAttribute("loginMember");
        //System.out.println(info.getMEM_ID());
        
        TearVO tearVO = tearMapper.getTearInfo(info.getMEM_ID());
        System.out.println(tearVO.toString());
        
        model.addAttribute("tearVO", tearVO);

        return "level";  
    }
}
