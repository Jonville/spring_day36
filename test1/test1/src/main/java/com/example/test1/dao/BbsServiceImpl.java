package com.example.test1.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.test1.mapper.BbsMapper;
import com.example.test1.model.Bbs;
import com.example.test1.model.Comment;

@Service 
public class BbsServiceImpl implements BbsService{

	@Autowired 
	private BbsMapper bbsMapper;

	@Override
	public List<Bbs> searchBbsList(HashMap<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return bbsMapper.selectBbsList(map);
	}

	@Override
	public void addBbs(HashMap<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		bbsMapper.insertBbs(map);
	}

	@Override
	public void removeBbs(HashMap<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		bbsMapper.deleteBbs(map);
	}

	@Override
	public HashMap<String, Object> selectGetBbs(HashMap<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		
		Bbs bbs = bbsMapper.selectGetBbs(map);
		List<Comment> commentList = bbsMapper.selectCommentList(map);
		if(bbs != null) {
			bbsMapper.updateBbsCnt(map);
		}
		
		resultMap.put("info", bbs);
		resultMap.put("commentList", commentList);
		
		return resultMap;
	}

	@Override
	public void updateBbs(HashMap<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		 bbsMapper.updateBbs(map);
	}

	@Override
	public void addBbsComment(HashMap<String, Object> map) {
		bbsMapper.insertBbsComment(map);
		// TODO Auto-generated method stub
		
	}

	@Override
	public void removeComment(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		bbsMapper.deleteComment(map);
		
	}

}