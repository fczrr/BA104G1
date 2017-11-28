package com.android.vehicle.model;

import java.io.Serializable;

public class VehicleVO implements Serializable{
	private Integer vehicleNo;
	private Integer carTypeNo;
	private String empNo;
	private String licenseplateNo;
	private String color;
	private String vehicleYear;
	private String empBranches;
	
	public VehicleVO(){}
	
	public VehicleVO(Integer vehicleNo, Integer carTypeNo, String empNo, String licenseplateNo, String color,
			String vehicleYear, String empBranches) {
		super();
		this.vehicleNo = vehicleNo;
		this.carTypeNo = carTypeNo;
		this.empNo = empNo;
		this.licenseplateNo = licenseplateNo;
		this.color = color;
		this.vehicleYear = vehicleYear;
		this.empBranches = empBranches;
	}
	public Integer getVehicleNo() {
		return vehicleNo;
	}
	public void setVehicleNo(Integer vehicleNo) {
		this.vehicleNo = vehicleNo;
	}
	public Integer getCarTypeNo() {
		return carTypeNo;
	}
	public void setCarTypeNo(Integer carTypeNo) {
		this.carTypeNo = carTypeNo;
	}
	public String getEmpNo() {
		return empNo;
	}
	public void setEmpNo(String empNo) {
		this.empNo = empNo;
	}
	public String getLicenseplateNo() {
		return licenseplateNo;
	}
	public void setLicenseplateNo(String licenseplateNo) {
		this.licenseplateNo = licenseplateNo;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public String getVehicleYear() {
		return vehicleYear;
	}
	public void setVehicleYear(String vehicleYear) {
		this.vehicleYear = vehicleYear;
	}
	public String getEmpBranches() {
		return empBranches;
	}
	public void setEmpBranches(String empBranches) {
		this.empBranches = empBranches;
	}
	
}
