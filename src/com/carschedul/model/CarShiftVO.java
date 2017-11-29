package com.carschedul.model;

import java.sql.Date;

public class CarShiftVO {
	private Date year_month;
	private String emp_name;
	private Integer work_hours;
	private String color;
	private String attendance;
	private String licenseplate_no;
	private String emp_branches;
	private String emp_phone;
	
	public Date getYear_month() {
		return year_month;
	}
	public void setYear_month(Date year_month) {
		this.year_month = year_month;
	}
	public String getEmp_name() {
		return emp_name;
	}
	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
	}
	public Integer getWork_hours() {
		return work_hours;
	}
	public void setWork_hours(Integer work_hours) {
		this.work_hours = work_hours;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public String getAttendance() {
		return attendance;
	}
	public void setAttendance(String attendance) {
		this.attendance = attendance;
	}
	public String getLicenseplate_no() {
		return licenseplate_no;
	}
	public void setLicenseplate_no(String licenseplate_no) {
		this.licenseplate_no = licenseplate_no;
	}
	public String getEmp_branches() {
		return emp_branches;
	}
	public void setEmp_branches(String emp_branches) {
		this.emp_branches = emp_branches;
	}
	public String getEmp_phone() {
		return emp_phone;
	}
	public void setEmp_phone(String emp_phone) {
		this.emp_phone = emp_phone;
	}
	
	
	
}
