package com.epa.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import com.epa.entity.epa;
// DAO 역할을 할것이다라고 알려주는 주석
@Mapper
// @Mapper 도 비슷함
public interface BoardMapper {
	// DAO역할을 할 인터페이스의 이름과 SQL문 관리하는 XML 이름을 일치 시킨다.
	// BoardMapper.java(interface) + BoardMapper.xml
	
	// Java코드와 SQL문과 따로 관리할때 둘을 연결(mapping)
	
	// 더이상 sqlSession만들 필요X, 결과에 대한 일을 안해도 됨
	// ---> 일을 Mybatis + 히카리CP
	
	public List<epa> boardList();
	// 메소드 이름과 xml의 태그의 id와 일치시켜줌

	public void boardInsert(epa vo);

	public epa boardContent(int theIdx);

	public void boardDelete(int theIdx);

	public void boardUpdate(epa vo);
	
	// xml로 분리 안해도 sql문 작성 가능
	// --> (dao)Repository 보단 @Mapper
	// parameterType, resultType 안적어도 됨
	@Update("update board set content=#{content} where idx=#{idx}")
	public void boardContentUpdate(epa vo);

	@Update("update board set count=count+1 where idx=#{idx}")
	public void updateCount(int idx);


	
	
	
	
	
	
	
	
	

}
