package com.android.hcOrderDetail.model;

import java.sql.Date;

import com.android.member.model.TheCaredVO;

public class HcOrderDetailVO {
	private String orderDetailNo;
	private String orderNo;
	private Date serviceDate;
	private String serviceTime;
	private String empNo;
	private String orderDetailStatus;
	private TheCaredVO theCaredVO;
	private String memNo;
	public String getMemNo() {
		return memNo;
	}

	public void setMemNo(String memNo) {
		this.memNo = memNo;
	}

	public TheCaredVO getTheCaredVO() {
		return theCaredVO;
	}

	public void setTheCaredVO(TheCaredVO theCaredVO) {
		this.theCaredVO = theCaredVO;
	}

	public HcOrderDetailVO(){}

	public String getOrderDetailNo() {
		return orderDetailNo;
	}

	public void setOrderDetailNo(String orderDetailNo) {
		this.orderDetailNo = orderDetailNo;
	}

	public String getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}

	public Date getServiceDate() {
		return serviceDate;
	}

	public void setServiceDate(Date serviceDate) {
		this.serviceDate = serviceDate;
	}

	public String getServiceTime() {
		return serviceTime;
	}

	public void setServiceTime(String serviceTime) {
		this.serviceTime = serviceTime;
	}

	public String getEmpNo() {
		return empNo;
	}

	public void setEmpNo(String empNo) {
		this.empNo = empNo;
	}

	public String getOrderDetailStatus() {
		return orderDetailStatus;
	}

	public void setOrderDetailStatus(String orderDetailStatus) {
		this.orderDetailStatus = orderDetailStatus;
	};
	@Override
	public String toString(){
		return "OrderDetailNo = "+this.orderDetailNo;
	}
	
}
