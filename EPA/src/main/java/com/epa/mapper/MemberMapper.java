package com.epa.mapper;

import java.sql.Date;
import java.sql.Timestamp;
import java.time.LocalDate;

import org.apache.ibatis.annotations.Param;

import com.epa.entity.Member;

public interface MemberMapper {

	public void joinInsert(Member vo);

	public Member loginMember(Member vo);

	public void insertMember(Member vo);

	public Member readMemberWithIDPW(String mem_ID, String mem_PW);

	public void updateMember(Member loginMember);

	public void deleteMember(Member vo);

	public void messageMember(Member vo);

	public void insertMessage(Member currentMember);

	public String getMEM_M(String mem_ID);


	public void insertLoginRecord(String memId);

	public Integer getAttendCount(String mem_ID);

	public void updateLoginRecord(String memId);

	public int checkLoginRecord(String memId);

	public void attend(String mem_ID);

	public void updateLastAttendDate(String mem_ID, Date currentDate);

	public void updateLastAttendDate(@Param("mem_ID") String mem_ID, @Param("lastAttendDate") Timestamp lastAttendDate);
	
	
}
