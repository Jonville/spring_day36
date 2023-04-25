package com.example.test1.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.test1.model.Student;
import com.example.test1.model.Subject;

@Mapper		
public interface StudentMapper {
	
	// 조회
	List<Student> selectStudentList(HashMap<String, Object> map) throws Exception; 
	
	//학생 상세 조회 (1명)
	Student selectStudentInfo(HashMap<String, Object> map) throws Exception; 
								// { stuNo : "20153075 }
	
	//Subject 조회
	List<Student> selectSubjectList(HashMap<String, Object> map) throws Exception;
	
	void deleteStudent(HashMap<String, Object> map);
	
}
