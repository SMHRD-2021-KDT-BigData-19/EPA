package com.epa.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.epa.entity.Board;
import com.epa.entity.Comment;
import com.epa.entity.image;
import com.epa.entity.imageList;

@Repository
public interface BoardMapper {
	
	
	public List<Board> boardList();
	
	public void boardInsert(Board vo);
	
	public Board boardContent(int theBD_NO);
	
	public void boardDelete(int BD_NO);
	
	public void boardUpdate(Board vo);

	public List<Comment> commnetContent(int theBD_NO);

	public void commentInsert(Comment co);

	public List<Board> boardList2();

	public List<Board> boardList3();

	public List<Board> boardList4();

	public void imageUp(image ivo);

	public List<imageList> imageContent(int bD_NO);

	public void commentDelete(int cOM_NO);

	

}
