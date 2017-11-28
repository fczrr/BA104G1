package com.android.member.model;

import java.io.Serializable;
import java.sql.Timestamp;

public class TheCaredVO implements Serializable{
	private String caredNo;
	private String memNo;
	private String caredName;
	private String caredGender;
	private String kinship;
	private Integer caredHeight;
	private Integer caredWeight;
	private String caredAddress;
	private String caredPhone;
	private String conStatus;
	private String bioStatus;
	private Timestamp modifyTime;
	
	public TheCaredVO() {
		super();
	}
	
	public TheCaredVO(String caredNo, String memNo, String caredName, String caredGender, String kinship,
			Integer caredHeight, Integer caredWeight, String caredAddress, String caredPhone, String conStatus,
			String bioStatus) {
		super();
		this.caredNo = caredNo;
		this.memNo = memNo;
		this.caredName = caredName;
		this.caredGender = caredGender;
		this.kinship = kinship;
		this.caredHeight = caredHeight;
		this.caredWeight = caredWeight;
		this.caredAddress = caredAddress;
		this.caredPhone = caredPhone;
		this.conStatus = conStatus;
		this.bioStatus = bioStatus;
	}

	public String getCaredName() {
		return caredName;
	}

	public void setCaredName(String caredName) {
		this.caredName = caredName;
	}

	public String getCaredNo() {
		return caredNo;
	}
	public void setCaredNo(String caredNo) {
		this.caredNo = caredNo;
	}
	public String getMemNo() {
		return memNo;
	}
	public void setMemNo(String memNo) {
		this.memNo = memNo;
	}
	public String getCaredGender() {
		return caredGender;
	}
	public void setCaredGender(String caredGender) {
		this.caredGender = caredGender;
	}
	public String getKinship() {
		return kinship;
	}
	public void setKinship(String kinship) {
		this.kinship = kinship;
	}
	public Integer getCaredHeight() {
		return caredHeight;
	}
	public void setCaredHeight(Integer caredHeight) {
		this.caredHeight = caredHeight;
	}
	public Integer getCaredWeight() {
		return caredWeight;
	}
	public void setCaredWeight(Integer caredWeight) {
		this.caredWeight = caredWeight;
	}
	public String getCaredAddress() {
		return caredAddress;
	}
	public void setCaredAddress(String caredAddress) {
		this.caredAddress = caredAddress;
	}
	public String getCaredPhone() {
		return caredPhone;
	}
	public void setCaredPhone(String caredPhone) {
		this.caredPhone = caredPhone;
	}
	public String getConStatus() {
		return conStatus;
	}
	public void setConStatus(String conStatus) {
		this.conStatus = conStatus;
	}
	public String getBioStatus() {
		return bioStatus;
	}
	public void setBioStatus(String bioStatus) {
		this.bioStatus = bioStatus;
	}
	public Timestamp getModifyTime() {
		return modifyTime;
	}
	public void setModifyTime(Timestamp modifyTime) {
		this.modifyTime = modifyTime;
	}
	
	
	
}
