package com.epa.mapper;


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


	public void attend(String string, String memberId);


	public int getAttendCount(String memberId);


	public String mbidCheck(String mEM_ID);







}
