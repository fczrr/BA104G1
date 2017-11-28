package com.employee.model;

import java.io.Serializable;
import java.sql.Date;
import java.sql.Timestamp;

public class EmployeeVO implements Serializable{
	private String empNo;
	private String empName;
	private String empPhone;
	private String empGender;
	private String empEmail;
	private String empDep;
	private String authorityNo;
	private String empTitle;
	private Date onBoardDate;
	private String empId;
	private String empPwd;
	private String empStatus;
	private String empBranches;
	private Timestamp empUpdateTime;
	
	public EmployeeVO() {
		super();
	}

	public EmployeeVO(String empNo, String empName, String empPhone, String empGender, String empEmail, String empDep,
			String authorityNo, String empTitle, Date onBoardDate, String empId, String empPwd, String empStatus,
			String empBranches, Timestamp empUpdateTime) {
		super();
		this.empNo = empNo;
		this.empName = empName;
		this.empPhone = empPhone;
		this.empGender = empGender;
		this.empEmail = empEmail;
		this.empDep = empDep;
		this.authorityNo = authorityNo;
		this.empTitle = empTitle;
		this.onBoardDate = onBoardDate;
		this.empId = empId;
		this.empPwd = empPwd;
		this.empStatus = empStatus;
		this.empBranches = empBranches;
		this.empUpdateTime = empUpdateTime;
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

	public String getEmpPhone() {
		return empPhone;
	}

	public void setEmpPhone(String empPhone) {
		this.empPhone = empPhone;
	}

	public String getEmpGender() {
		return empGender;
	}

	public void setEmpGender(String empGender) {
		this.empGender = empGender;
	}

	public String getEmpEmail() {
		return empEmail;
	}

	public void setEmpEmail(String empEmail) {
		this.empEmail = empEmail;
	}

	public String getEmpDep() {
		return empDep;
	}

	public void setEmpDep(String empDep) {
		this.empDep = empDep;
	}

	public String getAuthorityNo() {
		return authorityNo;
	}

	public void setAuthorityNo(String authorityNo) {
		this.authorityNo = authorityNo;
	}

	public String getEmpTitle() {
		return empTitle;
	}

	public void setEmpTitle(String empTitle) {
		this.empTitle = empTitle;
	}

	public Date getOnBoardDate() {
		return onBoardDate;
	}

	public void setOnBoardDate(Date onBoardDate) {
		this.onBoardDate = onBoardDate;
	}

	public String getEmpId() {
		return empId;
	}

	public void setEmpId(String empId) {
		this.empId = empId;
	}

	public String getEmpPwd() {
		return empPwd;
	}

	public void setEmpPwd(String empPwd) {
		this.empPwd = empPwd;
	}

	public String getEmpStatus() {
		return empStatus;
	}

	public void setEmpStatus(String empStatus) {
		this.empStatus = empStatus;
	}

	public String getEmpBranches() {
		return empBranches;
	}

	public void setEmpBranches(String empBranches) {
		this.empBranches = empBranches;
	}

	public Timestamp getEmpUpdateTime() {
		return empUpdateTime;
	}

	public void setEmpUpdateTime(Timestamp empUpdateTime) {
		this.empUpdateTime = empUpdateTime;
	}
	
	
}
