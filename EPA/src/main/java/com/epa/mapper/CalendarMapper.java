package com.epa.mapper;



import java.util.List;

import org.springframework.stereotype.Repository;

import com.epa.entity.calendar;

@Repository
public interface CalendarMapper {
	
	

	public List<calendar> calendar(String mem_ID);

	public void calInsert(com.epa.entity.calendar vo);

	

	

	




}
