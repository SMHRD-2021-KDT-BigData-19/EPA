package com.epa.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.epa.entity.Board;

@Repository
public interface BoardMapper {
	
	
	public List<Board> boardList();
	
	public void boardInsert(Board vo);
	
	public Board boardContent(int theBD_NO);

}
