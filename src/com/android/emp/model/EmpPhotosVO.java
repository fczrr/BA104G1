package com.android.emp.model;

public class EmpPhotosVO {
	private String empPhotoNo;
	private String empNo;
	private byte[] empPhoto;
	
	public EmpPhotosVO(){}
	public EmpPhotosVO( String empNo, byte[] empPhoto) {
		super();
		this.empNo = empNo;
		this.empPhoto = empPhoto;
	}
	public String getEmpPhotoNo() {
		return empPhotoNo;
	}
	public void setEmpPhotoNo(String empPhotoNo) {
		this.empPhotoNo = empPhotoNo;
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
