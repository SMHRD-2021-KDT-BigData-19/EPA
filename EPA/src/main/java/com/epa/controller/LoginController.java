package com.epa.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.support.SessionStatus;

import com.epa.entity.Member;
import com.epa.mapper.MemberMapper;

@Controller
public class LoginController {

    @Autowired
    private MemberMapper mapper;

    @RequestMapping(value = "/attend", method = RequestMethod.POST)
    public String attend(HttpSession session, SessionStatus sessionStatus, Model model,
            @CookieValue(value = "attendanceCookie", defaultValue = "false") Boolean attendanceCookie) {
        AttendResponse response = new AttendResponse();
        Member loginMember = (Member) session.getAttribute("loginMember");

        if (loginMember != null) {
            if (!attendanceCookie) {
                // 여기에 출석 처리 로직 추가
                if (shouldAttend(loginMember)) {
                    handleAttendance(loginMember, sessionStatus, model, response);
                    return "level";
                } else {
                    response.setSuccess(false);
                    response.setMessage("이미 출석하셨습니다.");
                }
            } else {
                response.setSuccess(false);
                response.setMessage("이미 출석하셨습니다.");
            }
        } else {
            response.setSuccess(false);
            response.setMessage("세션이 비정상적이거나 로그인되어 있지 않습니다.");
        }

        // 예외 처리 등에 사용할 페이지
        return "redirect:/error.jsp";
    }

    private boolean shouldAttend(Member loginMember) {
        // 출석을 해야 하는지 여부를 판단하는 로직 추가
        // 예를 들어, 마지막 출석 일자를 확인하여 오늘 출석을 해야 하는지 판단
        // return true if should attend, false otherwise
        return true;
    }

    private void handleAttendance(Member loginMember, SessionStatus sessionStatus, Model model, AttendResponse response) {
        // 출석 처리 로직 추가
        mapper.attend(loginMember.getMEM_ID());
        sessionStatus.setComplete();

        mapper.updateLastAttendDate(loginMember.getMEM_ID(), new java.sql.Timestamp(System.currentTimeMillis()));

        String memId = loginMember.getMEM_ID();
        int loginRecordCount = mapper.checkLoginRecord(memId);

        if (loginRecordCount > 0) {
            mapper.updateLoginRecord(memId);
        } else {
            mapper.insertLoginRecord(memId);
        }

        Integer attendCount = mapper.getAttendCount(loginMember.getMEM_ID());
        int attendCountValue = (attendCount != null) ? attendCount : 0;
        model.addAttribute("ATTEND_COUNT", attendCountValue);

        model.addAttribute("attendanceCookie" + loginMember.getMEM_ID(), true);

        String debugValue = "attendanceCookie" + loginMember.getMEM_ID();
        response.setDebugValue(debugValue);
        response.setSuccess(true);
        response.setMessage("출석되었습니다.");
    }
}
