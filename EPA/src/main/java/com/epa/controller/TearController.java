package com.epa.controller;

import com.epa.entity.Member;
import com.epa.entity.ProfileList;
import com.epa.entity.TearVO;
import com.epa.mapper.MemberMapper;
import com.epa.mapper.TearMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.sql.Date;
import java.time.LocalDate;

import javax.servlet.http.HttpSession;

@Controller
public class TearController {

    @Autowired
    private TearMapper tearMapper;
    

    @GetMapping("/Tear.do")
    public String level(HttpSession session, Model model) {
        Member info = (Member) session.getAttribute("loginMember");
        
        // info가 null이면 처리
        if (info == null) {
            // 예외 처리 또는 다른 작업 수행
            return "login";
        }

        // MEM_ID 파라미터를 전달하여 getTearInfo 메서드 호출
        TearVO tearVO = tearMapper.getTearInfo(info.getMEM_ID());

        // tearVO가 null이면 처리
        if (tearVO == null) {
            // 예외 처리 또는 다른 작업 수행
            return "login";
        }

        model.addAttribute("tearVO", tearVO);

        return "level";
    }

    @PostMapping("/updateTear")
    public String updateTear(HttpSession session) {
        Member info = (Member) session.getAttribute("loginMember");

        if (info == null) {
            return "login";
        }

        TearVO tearVO = tearMapper.getTearInfo(info.getMEM_ID());

        if (tearVO == null) {
            return "login";
        }

        LocalDate now = LocalDate.now();
        String currentDate = now.toString();

        int nYear = now.getYear();
        int nMonth = now.getMonthValue();
        int nDay = now.getDayOfMonth();

        String[] ymd = tearVO.getLASTDATE().split("-");
        int dYear = Integer.parseInt(ymd[0]);
        int dMonth = Integer.parseInt(ymd[1]);
        int dDay = Integer.parseInt(ymd[2]);

        if (nYear == dYear && nMonth == dMonth && nDay == dDay) {
            System.out.println("날짜 일치");
        } else {
            System.out.println("일치 안함");

            int updatedAttendCount = tearVO.getATTEND_COUNT() + 1;
            tearMapper.updateAttendCount(info.getMEM_ID(), updatedAttendCount);

            tearMapper.updateLastDate(info.getMEM_ID(), currentDate);
        }

        return "redirect:/Tear.do";
    }
}