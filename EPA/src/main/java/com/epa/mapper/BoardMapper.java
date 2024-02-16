package com.epa.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.epa.entity.Board;
import com.epa.entity.Comment;

@Repository
public interface BoardMapper {
	
	
	public List<Board> boardList();
	
	public void boardInsert(Board vo);
	
	public Board boardContent(int theBD_NO);
	
	public void boardDelete(int BD_NO);
	
	public void boardUpdate(Board vo);

	public List<Comment> commnetContent(int theBD_NO);

	public void commentInsert(Comment co);

	

}
