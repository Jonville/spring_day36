package com.example.test1.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.test1.model.Bbs;
import com.example.test1.model.Comment;


@Mapper		
public interface BbsMapper {
	
	// 조회
	List<Bbs> selectBbsList(HashMap<String, Object> map) throws Exception; 
	
	//게시판 등록
	void insertBbs(HashMap<String, Object> map) throws Exception;
	
	//게시판 삭제
	void deleteBbs(HashMap<String, Object> map) throws Exception;
	
	//상세보기
	Bbs selectGetBbs(HashMap<String, Object> map) throws Exception;
	
	//게시판 수정
	void updateBbs(HashMap<String, Object> map) throws Exception;
	
	// 게시판 카운트
	int selectBbsCnt(HashMap<String, Object> map);
	
	// 게시클 조회수 증가
	void updateBbsCnt(HashMap<String, Object> map);
	
	// 댓글 추가
	void insertBbsComment(HashMap<String, Object> map);
	
	// 댓글 목록
	List<Comment> selectCommentList(HashMap<String, Object> map);
	
	// 댓글 삭제
	void deleteComment(HashMap<String, Object> map);

}
