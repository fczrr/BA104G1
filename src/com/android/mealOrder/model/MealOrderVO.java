package com.android.mealOrder.model;

import java.io.Serializable;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import com.android.mealOrderDetail.model.MealOrderDetailVO;

public class MealOrderVO implements Serializable{
	private String moNo;
	private String memNo;
	private Timestamp moDate;
	private String moStatus;
	private String rcptName;
	private String rcptAdd;
	private String rcptPhone;
	private List<MealOrderDetailVO> detailList = new ArrayList<>();
	public MealOrderVO(){
		
	}
	

	public MealOrderVO(String moNo, String memNo, Timestamp moDate, String moStatus, String rcptName, String rcptAdd,
			String rcptPhone, List<MealOrderDetailVO> detailList) {
		super();
		this.moNo = moNo;
		this.memNo = memNo;
		this.moDate = moDate;
		this.moStatus = moStatus;
		this.rcptName = rcptName;
		this.rcptAdd = rcptAdd;
		this.rcptPhone = rcptPhone;
		this.detailList = detailList;
	}

	public List<MealOrderDetailVO> getDetailList() {
		return detailList;
	}

	public void setDetailList(List<MealOrderDetailVO> detailList) {
		this.detailList = detailList;
	}

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
	public Timestamp getMoDate() {
		return moDate;
	}
	public void setMoDate(Timestamp moDate) {
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
