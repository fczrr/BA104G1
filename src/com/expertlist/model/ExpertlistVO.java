package com.expertlist.model;

import java.io.Serializable;

public class ExpertlistVO implements Serializable{

	private String expNo;
	private String expName;
	private String expSpec;
	private Integer expPrice;
	
	public String getExpNo() {
		return expNo;
	}
	public void setExpNo(String expNo) {
		this.expNo = expNo;
	}
	public String getExpName() {
		return expName;
	}
	public void setExpName(String expName) {
		this.expName = expName;
	}
	public String getExpSpec() {
		return expSpec;
	}
	public void setExpSpec(String expSpec) {
		this.expSpec = expSpec;
	}
	public Integer getExpPrice() {
		return expPrice;
	}
	public void setExpPrice(Integer expPrice) {
		this.expPrice = expPrice;
	}


}