package com.epa.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.epa.entity.epa;


	@Mapper
	public interface memberMapper {

		epa memberLogin(epa mvo);	
		
		epa memberJoin(epa mvo);
		
	}
