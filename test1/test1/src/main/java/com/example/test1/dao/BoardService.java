package com.example.test1.dao;

import java.util.HashMap;
import java.util.List;

import com.example.test1.model.Board;

public interface BoardService {
	List<Board> selectBoardList(HashMap<String, Object> map) throws Exception;

	// 삭제
	void deleteBoard(HashMap<String, Object> map);
	// 수정
	void updateBoard(HashMap<String, Object> map);
	// 삽입
	void insertBoard(HashMap<String, Object> map);
	
	// 게시글 정보
	Board selectGetBoard(HashMap<String, Object> map);
}
