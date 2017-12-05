package com.android.carDetailVO.model;

import java.io.Serializable;
import java.sql.Date;

import com.android.carType.model.CarTypeVO;
import com.employee.model.EmployeeVO;
  
public class CarDetailVO implements Serializable{
	private String detialNo;
	private String orderNo;
	private Integer vehicleNo;
	private Date detailDate;
	private String detailTime;
	private String passengerName;
	private Integer passengerPhone;
	private String getintoAddress;
	private String arrivalAddress;
	private String sendCarStatus;
	private String empNo;
	private EmployeeVO employeeVO;
	
	public EmployeeVO getEmployeeVO() {
		return employeeVO;
	}
	public void setEmployeeVO(EmployeeVO employeeVO) {
		this.employeeVO = employeeVO;
	}
	public String getEmpNo() {
		return empNo;
	}
	public void setEmpNo(String empNo) {
		this.empNo = empNo;
	}

	private CarTypeVO carTypeVO;
	
	
	public CarTypeVO getCarTypeVO() {
		return carTypeVO;
	}
	public void setCarTypeVO(CarTypeVO carTypeVO) {
		this.carTypeVO = carTypeVO;
	}
	
	private String memNo;
	
	public String getMemNo() {
		return memNo;
	}
	public void setMemNo(String memNo) {
		this.memNo = memNo;
	}
	public CarDetailVO() {
		super();
	}
	public CarDetailVO(String detialNo, String orderNo, Integer vehicleNo, Date detailDate, String detailTime,
			String passengerName, Integer passengerPhone, String getintoAddress, String arrivalAddress,
			String sendCarStatus) {
		super();
		this.detialNo = detialNo;
		this.orderNo = orderNo;
		this.vehicleNo = vehicleNo;
		this.detailDate = detailDate;
		this.detailTime = detailTime;
		this.passengerName = passengerName;
		this.passengerPhone = passengerPhone;
		this.getintoAddress = getintoAddress;
		this.arrivalAddress = arrivalAddress;
		this.sendCarStatus = sendCarStatus;
	}
	public String getDetialNo() {
		return detialNo;
	}
	public void setDetialNo(String detialNo) {
		this.detialNo = detialNo;
	}
	public String getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}
	public Integer getVehicleNo() {
		return vehicleNo;
	}
	public void setVehicleNo(Integer vehicleNo) {
		this.vehicleNo = vehicleNo;
	}
	public Date getDetailDate() {
		return detailDate;
	}
	public void setDetailDate(Date detailDate) {
		this.detailDate = detailDate;
	}
	public String getDetailTime() {
		return detailTime;
	}
	public void setDetailTime(String detailTime) {
		this.detailTime = detailTime;
	}
	public String getPassengerName() {
		return passengerName;
	}
	public void setPassengerName(String passengerName) {
		this.passengerName = passengerName;
	}
	public Integer getPassengerPhone() {
		return passengerPhone;
	}
	public void setPassengerPhone(Integer passengerPhone) {
		this.passengerPhone = passengerPhone;
	}
	public String getGetintoAddress() {
		return getintoAddress;
	}
	public void setGetintoAddress(String getintoAddress) {
		this.getintoAddress = getintoAddress;
	}
	public String getArrivalAddress() {
		return arrivalAddress;
	}
	public void setArrivalAddress(String arrivalAddress) {
		this.arrivalAddress = arrivalAddress;
	}
	public String getSendCarStatus() {
		return sendCarStatus;
	}
	public void setSendCarStatus(String sendCarStatus) {
		this.sendCarStatus = sendCarStatus;
	}
	
	
}
