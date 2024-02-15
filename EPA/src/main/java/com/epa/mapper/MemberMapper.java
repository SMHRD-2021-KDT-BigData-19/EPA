package com.epa.mapper;


import com.epa.entity.Member;

public interface MemberMapper {
	
	public void joinInsert(Member vo);

	
	public Member loginMember(Member vo);

	public void insertMember(Member vo);

	public Member readMemberWithIDPW(String mem_ID, String mem_PW);



}
