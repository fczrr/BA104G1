package com.expert.model;

import java.io.Serializable;

public class ExpertVO implements Serializable{

	private String expOwn;
	private String empNo;
	private String expNo;
	
	public String getExpOwn() {
		return expOwn;
	}
	public void setExpOwn(String expOwn) {
		this.expOwn = expOwn;
	}
	public String getEmpNo() {
		return empNo;
	}
	public void setEmpNo(String empNo) {
		this.empNo = empNo;
	}
	public String getExpNo() {
		return expNo;
	}
	public void setExpNo(String expNo) {
		this.expNo = expNo;
	}
	

}
