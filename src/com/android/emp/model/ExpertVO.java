package com.android.emp.model;

import java.io.Serializable;

public class ExpertVO implements Serializable{
	
	private String expNo;
	private String expName;
	private String expSpec;
	
	public ExpertVO() {
		super();
	}

	public ExpertVO(String expNo) {
		super();
		this.expNo = expNo;
	}

	public ExpertVO(String expNo, String expName, String expSpec) {
		super();
		this.expNo = expNo;
		this.expName = expName;
		this.expSpec = expSpec;
	}

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
	
	
	
}
