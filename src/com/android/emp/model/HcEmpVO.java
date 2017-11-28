package com.android.emp.model;

import java.io.Serializable;
import java.util.List;

public class HcEmpVO implements Serializable{
	private String empNo;
	private String empName;
	private String empDep;
	
	private List<ExpertVO> expertList;
	
	private byte[] empPhoto;
	
	
	
	public HcEmpVO() {
		super();
	}


	public HcEmpVO(String empNo, String empName, String empDep, List<ExpertVO> expertList, byte[] empPhoto) {
		super();
		this.empNo = empNo;
		this.empName = empName;
		this.empDep = empDep;
		this.expertList = expertList;
		this.empPhoto = empPhoto;
	}


	public String getEmpNo() {
		return empNo;
	}


	public void setEmpNo(String empNo) {
		this.empNo = empNo;
	}


	public String getEmpName() {
		return empName;
	}


	public void setEmpName(String empName) {
		this.empName = empName;
	}


	public String getEmpDep() {
		return empDep;
	}


	public void setEmpDep(String empDep) {
		this.empDep = empDep;
	}


	public List<ExpertVO> getExpertList() {
		return expertList;
	}


	public void setExpertList(List<ExpertVO> expertList) {
		this.expertList = expertList;
	}


	public byte[] getEmpPhoto() {
		return empPhoto;
	}


	public void setEmpPhoto(byte[] empPhoto) {
		this.empPhoto = empPhoto;
	}
	
	
}
