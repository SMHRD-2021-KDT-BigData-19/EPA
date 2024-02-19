package com.epa.mapper;


import java.util.List;

import org.springframework.stereotype.Repository;

import com.epa.entity.calendar;

@Repository
public interface CalendarMapper {
	
	


	public void calInsert(calendar vo);

	public void calUpdate(calendar vo);

	public void calDelete(int pL_NO);

	public List<calendar> calender();




}
