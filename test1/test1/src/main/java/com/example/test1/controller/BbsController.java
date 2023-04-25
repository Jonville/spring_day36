package com.example.test1.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.test1.dao.BbsService;
import com.example.test1.model.Bbs;
import com.google.gson.Gson;

@Controller
public class BbsController {
	
	@Autowired
    private BbsService bbsService; 
	
	@Autowired
	HttpSession session;	// 다른데 만들어도 서로 호환함
	
	@RequestMapping("/bbs.do") 	// 주소 이름 만들기
    public String main(HttpServletRequest request , Model model) throws Exception{
        request.setAttribute("sessionId", session.getAttribute("sessionId"));
        request.setAttribute("sessionStatus", session.getAttribute("sessionStatus"));
		return "/bbs-list";		//실행 시킬 파일
    }
	
	@RequestMapping(value = "/bbs/list.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String searchBbsList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<Bbs> list = bbsService.searchBbsList(map);
		resultMap.put("list", list);
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping("/insert.do") 	// 주소 이름 만들기
    public String insert(Model model) throws Exception{

        return "/bbs-insert";		//실행 시킬 파일
    }
	
	@RequestMapping(value = "/bbs/add.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String insertBbs(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		map.put("userid", session.getAttribute("sessionId"));
		bbsService.addBbs(map);
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/bbs/remove.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String removeBbs(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		
		bbsService.removeBbs(map);
		
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping("/read.do") 	// 상세 보기
    public String read(HttpServletRequest request , Model model , @RequestParam HashMap<String, Object> map) throws Exception{
		request.setAttribute("map", map);	// 얘도 key , value 형태
        request.setAttribute("sessionId", session.getAttribute("sessionId"));
        request.setAttribute("sessionStatus", session.getAttribute("sessionStatus"));
        return "/bbs-read";		//실행 시킬 파일
    }
	
	@RequestMapping("/modify.do") 	// 상세 보기
	public String update(HttpServletRequest request , Model model , @RequestParam HashMap<String, Object> map) throws Exception{
		request.setAttribute("map", map);	// 얘도 key , value 형태
		return "/bbs-update";		//실행 시킬 파일
	}
	
	@RequestMapping(value = "/bbs/update.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String updateBbs(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		bbsService.updateBbs(map);
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	}

	@RequestMapping(value = "/bbs/read.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String selectGetBbs(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = bbsService.selectGetBbs(map);
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	}
	@RequestMapping(value = "/bbs/comment.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String comment(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		bbsService.addBbsComment(map);
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	}
	
	
	@RequestMapping(value = "/comment/remove.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String cRemove(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		bbsService.removeComment(map);
		return new Gson().toJson(resultMap);
	}
	
	
}