package com.epa.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.epa.entity.login;
import com.epa.entity.epa;


@Repository
public interface loginMapper {
	//해당 도메인에 관련된 기능 선언
	
			public List<login> loginList();
			
			public String getTime();
			
			public void insertMember(login vo);
			
			// 로그인기능
			public login loginMember(login vo);
			
			// 회원가입 시 아이디 중복확인
			public login idCheck(String MEM_ID);
			
			// 회원정보 보기
			public login readMember(String MEM_ID);
			
			// 회원정보 수정
			public void updateMember(login vo);
			
			// 회원탈퇴
			public void deleteMember(login vo);
			
			// 구글회원가입
			public void joinMemberByGoogle(login vo);
			
			// 구글로그인
			public login loginMemberByGoogle(login vo);

			public login readMemberWithIDPW(String mem_ID, String mem_PW);

		
}