package com.example.test1.dao;

import java.util.HashMap;
import java.util.List;

import com.example.test1.model.User;

public interface LoginService {
	
	// 로그인
	HashMap<String, Object> searchUserInfo(HashMap<String, Object> map) throws Exception;

}
