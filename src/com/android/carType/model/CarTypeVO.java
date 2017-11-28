package com.android.carType.model;

import java.io.Serializable;

public class CarTypeVO implements Serializable{
	private Integer carTypeNo;
	private String carTypeName;
	private String description;
	private Integer rentalRates;
	private byte[] carPic;
	
	public CarTypeVO() {
		super();
	}

	public CarTypeVO(Integer carTypeNo, String carTypeName, String description, Integer rentalRates, byte[] carPic) {
		super();
		this.carTypeNo = carTypeNo;
		this.carTypeName = carTypeName;
		this.description = description;
		this.rentalRates = rentalRates;
		this.carPic = carPic;
	}

	public CarTypeVO(String carTypeName, byte[] carPic) {
		super();
		this.carTypeName = carTypeName;
		this.carPic = carPic;
	}

	public Integer getCarTypeNo() {
		return carTypeNo;
	}

	public void setCarTypeNo(Integer carTypeNo) {
		this.carTypeNo = carTypeNo;
	}

	public String getCarTypeName() {
		return carTypeName;
	}

	public void setCarTypeName(String carTypeName) {
		this.carTypeName = carTypeName;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Integer getRentalRates() {
		return rentalRates;
	}

	public void setRentalRates(Integer rentalRates) {
		this.rentalRates = rentalRates;
	}

	public byte[] getCarPic() {
		return carPic;
	}

	public void setCarPic(byte[] carPic) {
		this.carPic = carPic;
	}
	
}
