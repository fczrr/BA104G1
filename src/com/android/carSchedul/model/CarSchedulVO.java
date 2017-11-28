package com.android.carSchedul.model;

import java.io.Serializable;
import java.sql.Date;

public class CarSchedulVO implements Serializable{
	private Integer serialNo;
	private String empNo;
	private Date yearMonth;
	private String attendance;
	private Integer workHours;
	public CarSchedulVO() {
		super();
	}
	public CarSchedulVO(Integer serialNo, String empNo, Date yearMonth, String attendance, Integer workHours) {
		super();
		this.serialNo = serialNo;
		this.empNo = empNo;
		this.yearMonth = yearMonth;
		this.attendance = attendance;
		this.workHours = workHours;
	}
	public Integer getSerialNo() {
		return serialNo;
	}
	public void setSerialNo(Integer serialNo) {
		this.serialNo = serialNo;
	}
	public String getEmpNo() {
		return empNo;
	}
	public void setEmpNo(String empNo) {
		this.empNo = empNo;
	}
	public Date getYearMonth() {
		return yearMonth;
	}
	public void setYearMonth(Date yearMonth) {
		this.yearMonth = yearMonth;
	}
	public String getAttendance() {
		return attendance;
	}
	public void setAttendance(String attendance) {
		this.attendance = attendance;
	}
	public Integer getWorkHours() {
		return workHours;
	}
	public void setWorkHours(Integer workHours) {
		this.workHours = workHours;
	}
	
}
