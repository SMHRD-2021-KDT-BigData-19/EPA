package com.epa.mapper;

import org.apache.ibatis.annotations.Insert;
import org.springframework.stereotype.Repository;
import com.epa.entity.epa;

@Repository
public interface memberMapper {

    // 로그인 기능
    public epa memberLogin(epa mvo);

    // 회원가입 기능
    public void memberJoin(epa mvo);

}