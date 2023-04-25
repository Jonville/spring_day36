package com.example.test1.dao;

import java.util.HashMap;
import java.util.List;

import com.example.test1.model.Bbs;
import com.example.test1.model.Board;

public interface BbsService {
	
	//게시글 조회
	List<Bbs> searchBbsList(HashMap<String, Object> map) throws Exception;

	//게시글 등록
	void addBbs(HashMap<String, Object> map) throws Exception;
	
	//게시글 삭제
	void removeBbs(HashMap<String, Object> map) throws Exception;
	
	//상세 보기
	HashMap<String, Object> selectGetBbs(HashMap<String, Object> map) throws Exception;
	
	//게시판 수정	
	void updateBbs(HashMap<String, Object> map) throws Exception;

	// 댓글 등록
	void addBbsComment(HashMap<String, Object> map);
	
	// 댓글 삭제
	void removeComment(HashMap<String, Object> map);
	
}
