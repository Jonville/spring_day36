package com.example.test1.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.test1.dao.LoginService;
import com.example.test1.model.Bbs;
import com.example.test1.model.User;
import com.google.gson.Gson;

@Controller
public class LoginController {
	
	@Autowired
	private LoginService loginService;
	
	@Autowired
	HttpSession session;	// 세션 만들기 ( 아이디 권한 만들기 )
	

	@RequestMapping("/login.do") 	// 주소 이름 만들기
    public String login(Model model) throws Exception{
		String id = (String) session.getAttribute("sessionId");
		String name = (String) session.getAttribute("sessionName");
		String status = (String) session.getAttribute("sessionStatus");
		
		session.removeAttribute(id);
		session.removeAttribute(name);
		session.removeAttribute(status);	// String 친구들 로 넣어줌
		
		session.invalidate();	// HttpSession 안에 값을 무효화 시킨다. 

        return "/login";		//실행 시킬 파일
    }
	
	@RequestMapping("/join.do") 	// 주소 이름 만들기
	public String join(Model model) throws Exception{
		
		return "/join";		//실행 시킬 파일
	}
	
	@RequestMapping(value = "/login.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String searchUserInfo(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = loginService.searchUserInfo(map);
		String result = (String) resultMap.get("result");
		if(result.equals("success")) {
			User user = (User) resultMap.get("user");
			session.setAttribute("sessionId", user.getId());
			session.setAttribute("sessionName", user.getName());
			session.setAttribute("sessionStatus", user.getStatus());
		}
		
		return new Gson().toJson(resultMap);
	}
	
}