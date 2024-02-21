package com.epa.mapper;

import com.epa.entity.TearVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Update;

@Mapper
public interface TearMapper {
	TearVO getTearInfo(String MEM_ID);
    void updateAttendCount(TearVO tearVO);
	void insertTearInfo(TearVO tearVO);
    @Update("UPDATE TEAR_TB SET ATTEND_COUNT = #{attendCount} WHERE MEM_ID = #{memId}")
    void updateAttendCount(@Param("memId") String memId, @Param("attendCount") int attendCount);
}
