package com.branches.model;

import java.io.Serializable;

public class BranchesVO implements Serializable{

	private String empBranches;
	private Double brcLat;
	private Double brcLon;
	private String brcName;
	
	public String getEmpBranches() {
		return empBranches;
	}
	public void setEmpBranches(String empBranches) {
		this.empBranches = empBranches;
	}
	public Double getBrcLat() {
		return brcLat;
	}
	public void setBrcLat(Double brcLat) {
		this.brcLat = brcLat;
	}
	public Double getBrcLon() {
		return brcLon;
	}
	public void setBrcLon(Double brcLon) {
		this.brcLon = brcLon;
	}
	public String getBrcName() {
		return brcName;
	}
	public void setBrcName(String brcName) {
		this.brcName = brcName;
	}
	
}