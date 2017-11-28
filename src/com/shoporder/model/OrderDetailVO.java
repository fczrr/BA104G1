package com.shoporder.model;

import java.io.Serializable;

public class OrderDetailVO  implements Serializable{
	private String orderNo;
	private Integer itemNo;
	private Integer orderCount;
	public OrderDetailVO() {
		super();
	}
	public OrderDetailVO(String orderNo, Integer itemNo, Integer orderCount) {
		super();
		this.orderNo = orderNo;
		this.itemNo = itemNo;
		this.orderCount = orderCount;
	}
	public String getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}
	public Integer getItemNo() {
		return itemNo;
	}
	public void setItemNo(Integer itemNo) {
		this.itemNo = itemNo;
	}
	public Integer getOrderCount() {
		return orderCount;
	}
	public void setOrderCount(Integer orderCount) {
		this.orderCount = orderCount;
	}
	
	
}
