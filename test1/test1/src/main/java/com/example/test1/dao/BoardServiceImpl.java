package com.example.test1.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.test1.mapper.BoardMapper;
import com.example.test1.model.Board;

@Service //서비스임을 선언
public class BoardServiceImpl implements BoardService{

	@Autowired //Mapper와 연결
	private BoardMapper boardMapper;

	@Override
	public List<Board> selectBoardList(HashMap<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return boardMapper.selectBoardList(map);
	}
	@Override
	public void deleteBoard(HashMap<String, Object> map) {
		boardMapper.deleteBoard(map);
	}
	
	@Override
	public void updateBoard(HashMap<String, Object> map) {
		boardMapper.updateBoard(map);
	}
	
	@Override
	public void insertBoard(HashMap<String, Object> map) {
		boardMapper.insertBoard(map);
	}
	
	@Override
	public Board selectGetBoard(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		// 조회수 
		boardMapper.updateCnt(map);
		return boardMapper.selectGetBoard(map);
	}
}