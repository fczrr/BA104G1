package com.android.websocket;

import java.io.Serializable;
import java.sql.Timestamp;

public class EmpServiceDetailVO implements Serializable{
	private String empServNo;
	private String empNo;
	private String memNo;
	private byte[] empSevImg;
	private String empSevIntro;
	private Timestamp empSevDate;
	private String empSevStatus;
	public EmpServiceDetailVO() {
		super();
	}
	public EmpServiceDetailVO(String empServNo, String empNo, String memNo, byte[] empSevImg, String empSevIntro,
			Timestamp empSevDate, String empSevStatus) {
		super();
		this.empServNo = empServNo;
		this.empNo = empNo;
		this.memNo = memNo;
		this.empSevImg = empSevImg;
		this.empSevIntro = empSevIntro;
		this.empSevDate = empSevDate;
		this.empSevStatus = empSevStatus;
	}
	public String getEmpServNo() {
		return empServNo;
	}
	public void setEmpServNo(String empServNo) {
		this.empServNo = empServNo;
	}
	public String getEmpNo() {
		return empNo;
	}
	public void setEmpNo(String empNo) {
		this.empNo = empNo;
	}
	public String getMemNo() {
		return memNo;
	}
	public void setMemNo(String memNo) {
		this.memNo = memNo;
	}
	public byte[] getEmpSevImg() {
		return empSevImg;
	}
	public void setEmpSevImg(byte[] empSevImg) {
		this.empSevImg = empSevImg;
	}
	public String getEmpSevIntro() {
		return empSevIntro;
	}
	public void setEmpSevIntro(String empSevIntro) {
		this.empSevIntro = empSevIntro;
	}
	public Timestamp getEmpSevDate() {
		return empSevDate;
	}
	public void setEmpSevDate(Timestamp empSevDate) {
		this.empSevDate = empSevDate;
	}
	public String getEmpSevStatus() {
		return empSevStatus;
	}
	public void setEmpSevStatus(String empSevStatus) {
		this.empSevStatus = empSevStatus;
	}
	
	
	
	
}
