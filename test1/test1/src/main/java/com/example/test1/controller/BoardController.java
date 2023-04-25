package com.example.test1.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.test1.dao.BoardService;
import com.example.test1.model.Board;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
@Controller // 컨트롤러라고 선언함
public class BoardController {

    @Autowired
    private BoardService boardService; 

    @RequestMapping("/board.do") 
    public String main(Model model) throws Exception{

        return "/board-list";
    }
    
	@RequestMapping(value = "/list.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String searchBbsList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<Board> list = boardService.selectBoardList(map);
		resultMap.put("list", list);
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/remove.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String remove(Model model, @RequestParam HashMap<String, Object> map ) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
//		String json = map.get("list").toString();
//		ObjectMapper mapper = new ObjectMapper();
//	    List<Map<String, Object>> list = mapper.readValue(json, new TypeReference<ArrayList<Map<String, Object>>>(){});
//		map.put("list", list);
	    boardService.deleteBoard(map);
		resultMap.put("message", "성공");
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/edit.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String edit(Model model, @RequestParam HashMap<String, Object> map ) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		
		boardService.updateBoard(map);
		resultMap.put("message", "성공");
		return new Gson().toJson(resultMap);
	}
	
    @RequestMapping("/add.do") 
    public String add(HttpServletRequest request, HttpServletResponse response, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
    	request.setAttribute("map", map);
        return "board-add";
    }
    
	@RequestMapping(value = "/add.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String add(Model model, @RequestParam HashMap<String, Object> map ) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		boardService.insertBoard(map);
		resultMap.put("message", "성공");
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping("/view.do") 
    public String view(HttpServletRequest request, HttpServletResponse response, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
    	request.setAttribute("map", map);
        return "board-view";
    }
	
	@RequestMapping(value = "/view.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String view(Model model, @RequestParam HashMap<String, Object> map ) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		Board b = boardService.selectGetBoard(map);
		resultMap.put("board", b);
		resultMap.put("message", "성공");
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping("/test.do") 
    public String test(HttpServletRequest request, HttpServletResponse response, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
    	request.setAttribute("map", map);
        return "test";
    }
	
}