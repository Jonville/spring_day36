package com.example.test1.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.test1.model.User;


@Mapper		
public interface LoginMapper {
	
	// 로그인
	User selectUserInfo(HashMap<String, Object> map) throws Exception; 
	
	// 아이디 틀렸을때
	int selectUserCnt(HashMap<String, Object> map);
	
}
