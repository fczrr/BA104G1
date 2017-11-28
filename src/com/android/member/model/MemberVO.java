package com.android.member.model;

import java.io.Serializable;
import java.sql.Timestamp;

public class MemberVO implements Serializable{
	private String memNo;
	private String memName;
	private String memPhone;
	private String memGender;
	private String memEmail;
	private String address;
	private Integer point;
	private String memId;
	private String memPwd;
	private String memSratus;
	private String chkIp;
	private Timestamp memLoginTime;
	
	public MemberVO(){}
	

	public String getMemNo() {
		return memNo;
	}
	public void setMemNo(String memNo) {
		this.memNo = memNo;
	}
	public String getMemName() {
		return memName;
	}
	public void setMemName(String memName) {
		this.memName = memName;
	}
	public String getMemPhone() {
		return memPhone;
	}
	public void setMemPhone(String memPhone) {
		this.memPhone = memPhone;
	}
	public String getMemGender() {
		return memGender;
	}
	public void setMemGender(String memGender) {
		this.memGender = memGender;
	}
	public String getMemEmail() {
		return memEmail;
	}
	public void setMemEmail(String memEmail) {
		this.memEmail = memEmail;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public Integer getPoint() {
		return point;
	}
	public void setPoint(Integer point) {
		this.point = point;
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public String getMemPwd() {
		return memPwd;
	}
	public void setMemPwd(String memPwd) {
		this.memPwd = memPwd;
	}
	public String getMemSratus() {
		return memSratus;
	}
	public void setMemSratus(String memSratus) {
		this.memSratus = memSratus;
	}
	public String getChkIp() {
		return chkIp;
	}
	public void setChkIp(String chkIp) {
		this.chkIp = chkIp;
	}
	public Timestamp getMemLoginTime() {
		return memLoginTime;
	}
	public void setMemLoginTime(Timestamp memLoginTime) {
		this.memLoginTime = memLoginTime;
	}
	@Override
	public String toString(){
		return new String("memNO:"+this.memNo +",  memName:"+this.memName+",  memPhone:"+this.memPhone+",  memId:"+this.memId+",  memPwd:"+this.memPwd);
		
	}
	
	
}
