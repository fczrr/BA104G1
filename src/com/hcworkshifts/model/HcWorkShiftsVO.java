package com.hcworkshifts.model;
import java.io.Serializable;

public class HcWorkShiftsVO implements Serializable{
	private String monthOfYear;
	private String empNo;
	private String workShiftStatus;
	private Integer totalWorkShifts;
	public HcWorkShiftsVO() {
		super();

	}
	public HcWorkShiftsVO(String monthOfYear, String empNo, String workShiftStatus, 
			Integer totalWorkShifts) {
		this();
		this.monthOfYear = monthOfYear;
		this.empNo = empNo;
		this.workShiftStatus = workShiftStatus;
		this.totalWorkShifts = totalWorkShifts;
	}
	public String getMonthOfYear() {
		return monthOfYear;
	}
	public void setMonthOfYear(String monthOfYear) {
		this.monthOfYear = monthOfYear;
	}
	public String getEmpNo() {
		return empNo;
	}
	public void setEmpNo(String empNo) {
		this.empNo = empNo;
	}
	public String getWorkShiftStatus() {
		return workShiftStatus;
	}
	public void setWorkShiftStatus(String workShiftStatus) {
		this.workShiftStatus = workShiftStatus;
	}
	public Integer getTotalWorkShifts() {
		return totalWorkShifts;
	}
	public void setTotalWorkShifts(Integer totalWorkShifts) {
		this.totalWorkShifts = totalWorkShifts;
	}
	

}
