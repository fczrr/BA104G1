package com.android.setMeal.model;

import java.io.Serializable;

public class SetMealVO implements Serializable{
	private Integer smNo;
	private String smName;
	private Integer smPrice;
	private Integer supply;
	private byte[] smPic1;
	private byte[] smPic2;
	private byte[] smPic3;
	private String smIntro;
	
	public SetMealVO(){}
	
//	public SetMealVO(Integer smNo,byte[] smPic1){
//		this.smNo = smNo;
//		this.smPic1 = smPic1;
//	}
	
	public SetMealVO(Integer smNo, String smName, Integer smPrice, Integer supply, byte[] smPic1, byte[] smPic2,
			byte[] smPic3, String smIntro) {
		super();
		this.smNo = smNo;
		this.smName = smName;
		this.smPrice = smPrice;
		this.supply = supply;
		this.smPic1 = smPic1;
		this.smPic2 = smPic2;
		this.smPic3 = smPic3;
		this.smIntro = smIntro;
	}

	public SetMealVO(Integer smNo, String smName, Integer smPrice, Integer supply, byte[] smPic1, String smIntro) {
		super();
		this.smNo = smNo;
		this.smName = smName;
		this.smPrice = smPrice;
		this.supply = supply;
		this.smPic1 = smPic1;
		this.smIntro = smIntro;
	}

	public Integer getSmNo() {
		return smNo;
	}

	public void setSmNo(Integer smNo) {
		this.smNo = smNo;
	}

	public String getSmName() {
		return smName;
	}

	public void setSmName(String smName) {
		this.smName = smName;
	}

	public Integer getSmPrice() {
		return smPrice;
	}

	public void setSmPrice(Integer smPrice) {
		this.smPrice = smPrice;
	}

	public Integer getSupply() {
		return supply;
	}

	public void setSupply(Integer supply) {
		this.supply = supply;
	}

	public byte[] getSmPic1() {
		return smPic1;
	}

	public void setSmPic1(byte[] smPic1) {
		this.smPic1 = smPic1;
	}

	public byte[] getSmPic2() {
		return smPic2;
	}

	public void setSmPic2(byte[] smPic2) {
		this.smPic2 = smPic2;
	}

	public byte[] getSmPic3() {
		return smPic3;
	}

	public void setSmPic3(byte[] smPic3) {
		this.smPic3 = smPic3;
	}

	public String getSmIntro() {
		return smIntro;
	}

	public void setSmIntro(String smIntro) {
		this.smIntro = smIntro;
	}
	
}
