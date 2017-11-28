package com.mealorder.model;

import java.io.Serializable;
import java.sql.Timestamp;

public class MealOrderVO implements Serializable {
	private String moNo;
	private String memNo;
	private java.sql.Timestamp moDate;
	private String moStatus;
	private String rcptName;
	private String rcptAdd;
	private String rcptPhone;

	public String getMoNo() {
		return moNo;
	}

	public void setMoNo(String moNo) {
		this.moNo = moNo;
	}

	public String getMemNo() {
		return memNo;
	}

	public void setMemNo(String memNo) {
		this.memNo = memNo;
	}

	public java.sql.Timestamp getMoDate() {
		return moDate;
	}

	public void setMoDate(java.sql.Timestamp moDate) {
		this.moDate = moDate;
	}

	public String getMoStatus() {
		return moStatus;
	}

	public void setMoStatus(String moStatus) {
		this.moStatus = moStatus;
	}

	public String getRcptName() {
		return rcptName;
	}

	public void setRcptName(String rcptName) {
		this.rcptName = rcptName;
	}

	public String getRcptAdd() {
		return rcptAdd;
	}

	public void setRcptAdd(String rcptAdd) {
		this.rcptAdd = rcptAdd;
	}

	public String getRcptPhone() {
		return rcptPhone;
	}

	public void setRcptPhone(String rcptPhone) {
		this.rcptPhone = rcptPhone;
	}

}
