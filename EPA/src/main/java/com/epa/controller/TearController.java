package com.epa.controller;

import com.epa.entity.Member;
import com.epa.entity.TearVO;
import com.epa.mapper.TearMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.time.LocalDate;

@Controller
public class TearController {

    @Autowired
    private TearMapper tearMapper;

    @GetMapping("/Tear.do")
    public String level(HttpSession session, Model model) {
        Member info = (Member) session.getAttribute("loginMember");

        if (info == null) {
            return "login";
        }

        TearVO tearVO = tearMapper.getTearInfo(info.getMEM_ID());

        if (tearVO == null) {
            return "login";
        }

        model.addAttribute("tearVO", tearVO);

        return "level";
    }

    @PostMapping(value = "/updateTear", produces = "text/plain;charset=UTF-8")
    @ResponseBody
    public String updateTear(HttpSession session, Model model) {
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
            return "이미 출석하셨습니다";
        } else {
            int updatedAttendCount = tearVO.getATTEND_COUNT() + 1;
            tearMapper.updateAttendCount(info.getMEM_ID(), updatedAttendCount);
            tearMapper.updateLastDate(info.getMEM_ID(), currentDate);
            return "출석되었습니다";
        }
    }
}