package com.employee_photo.model;

import java.io.Serializable;

public class EmpPhotosVO implements Serializable {
	private String empPhtoNo ;
	private String empNo;
	private byte[] empPhoto;
	public EmpPhotosVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public EmpPhotosVO(String empPhtoNo, String empNo, byte[] empPhoto) {
		super();
		this.empPhtoNo = empPhtoNo;
		this.empNo = empNo;
		this.empPhoto = empPhoto;
	}
	public String getEmpPhtoNo() {
		return empPhtoNo;
	}
	public void setEmpPhtoNo(String empPhtoNo) {
		this.empPhtoNo = empPhtoNo;
	}
	public String getEmpNo() {
		return empNo;
	}
	public void setEmpNo(String empNo) {
		this.empNo = empNo;
	}
	public byte[] getEmpPhoto() {
		return empPhoto;
	}
	public void setEmpPhoto(byte[] empPhoto) {
		this.empPhoto = empPhoto;
	}
	
	
	
	
}
