package com.epa.controller;

import java.sql.Timestamp;
import java.util.Calendar;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.support.SessionStatus;

import com.epa.entity.Member;
import com.epa.mapper.MemberMapper;

@Controller
public class LoginController {

    @Autowired
    private MemberMapper mapper;

    @PostMapping("/attend")
    public String attend(HttpSession session, SessionStatus sessionStatus, Model model,
            @CookieValue(value = "attendanceCookie", defaultValue = "false") Boolean attendanceCookie) {
        AttendResponse response = new AttendResponse();
        Member loginMember = (Member) session.getAttribute("loginMember");

        if (loginMember != null) {
            // 세션이 정상적으로 설정되어 있는 경우에만 출석 처리
            if (!attendanceCookie) {
                // 출석하지 않은 경우에만 출석 처리
                Timestamp lastAttendDate = loginMember.getLAST_ATTEND_DATE();

                if (!isSameDay(new Timestamp(System.currentTimeMillis()), lastAttendDate)) {
                    // 출석 처리 로직...
                    mapper.attend(loginMember.getMEM_ID());
                    sessionStatus.setComplete();

                    // LOGIN_TB 테이블의 LAST_ATTEND_DATE를 업데이트
                    mapper.updateLastAttendDate(loginMember.getMEM_ID(), new Timestamp(System.currentTimeMillis()));

                    // 출석 횟수 읽어와서 모델에 추가
                    Integer attendCount = mapper.getAttendCount(loginMember.getMEM_ID());
                    int attendCountValue = (attendCount != null) ? attendCount : 0;
                    model.addAttribute("ATTEND_COUNT", attendCountValue);

                    // 출석 여부를 쿠키에 저장 (서버 측)
                    model.addAttribute("attendanceCookie" + loginMember.getMEM_ID(), true);

                    // 디버깅을 위해 alert로 값 표시
                    String debugValue = "attendanceCookie" + loginMember.getMEM_ID();
                    response.setDebugValue(debugValue);
                    response.setSuccess(true);
                    response.setMessage("출석되었습니다.");

                    // 출석 처리 후 level.jsp로 리다이렉트
                    return "level";
                } else {
                    // 이미 출석한 경우
                    response.setSuccess(false);
                    response.setMessage("이미 출석하셨습니다.");
                }
            } else {
                // 이미 출석한 경우
                response.setSuccess(false);
                response.setMessage("이미 출석하셨습니다.");
            }
        } else {
            response.setSuccess(false);
            response.setMessage("세션이 비정상적이거나 로그인되어 있지 않습니다.");
        }

        return "redirect:/error.jsp"; // 예외 처리 등에 사용할 페이지
    }

    // 두 Timestamp 객체의 날짜가 같은지 확인하는 메서드
    private boolean isSameDay(Timestamp timestamp1, Timestamp timestamp2) {
        if (timestamp1 == null || timestamp2 == null) {
            return false;
        }

        Calendar cal1 = Calendar.getInstance();
        cal1.setTimeInMillis(timestamp1.getTime());
        Calendar cal2 = Calendar.getInstance();
        cal2.setTimeInMillis(timestamp2.getTime());

        return cal1.get(Calendar.YEAR) == cal2.get(Calendar.YEAR)
                && cal1.get(Calendar.DAY_OF_YEAR) == cal2.get(Calendar.DAY_OF_YEAR);
    }
}
