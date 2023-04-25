package com.example.test1.model;

import lombok.Data;

@Data 
public class Board2 {
   private String stuNo;
   private String stuName;
   private String stuDept;
   private String stuGrade;
   private String stuClass;
   private String stuGender;
   private String stuHeight;
   private String stuWeight;
   private String enrGrade;
   
	public String getStuNo() {
		return stuNo;
	}
	public void setStuNo(String stuNo) {
		this.stuNo = stuNo;
	}
	public String getStuName() {
		return stuName;
	}
	public void setStuName(String stuName) {
		this.stuName = stuName;
	}
	public String getStuDept() {
		return stuDept;
	}
	public void setStuDept(String stuDept) {
		this.stuDept = stuDept;
	}
	public String getStuGrade() {
		return stuGrade;
	}
	public void setStuGrade(String stuGrade) {
		this.stuGrade = stuGrade;
	}
	public String getStuClass() {
		return stuClass;
	}
	public void setStuClass(String stuClass) {
		this.stuClass = stuClass;
	}
	public String getStuGender() {
		return stuGender;
	}
	public void setStuGender(String stuGender) {
		this.stuGender = stuGender;
	}
	public String getStuHeight() {
		return stuHeight;
	}
	public void setStuHeight(String stuHeight) {
		this.stuHeight = stuHeight;
	}
	public String getStuWeight() {
		return stuWeight;
	}
	public void setStuWeight(String stuWeight) {
		this.stuWeight = stuWeight;
	}
	public String getEnrGrade() {
		return enrGrade;
	}
	public void setEnrGrade(String enrGrade) {
		this.enrGrade = enrGrade;
	}
}