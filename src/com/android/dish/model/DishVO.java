package com.android.dish.model;

import java.io.Serializable;

public class DishVO implements Serializable{
	private Integer dishNo;
	private String dishName;
	private byte[] dishPic;
	private String dishIntro;
	private String dishType;
	
	public DishVO(){}
	
	
	public DishVO(Integer dishNo, String dishName, byte[] dishPic, String dishIntro, String dishType) {
		super();
		this.dishNo = dishNo;
		this.dishName = dishName;
		this.dishPic = dishPic;
		this.dishIntro = dishIntro;
		this.dishType = dishType;
	}
	public Integer getDishNo() {
		return dishNo;
	}
	public void setDishNo(Integer dishNo) {
		this.dishNo = dishNo;
	}
	public String getDishName() {
		return dishName;
	}
	public void setDishName(String dishName) {
		this.dishName = dishName;
	}
	public byte[] getDishPic() {
		return dishPic;
	}
	public void setDishPic(byte[] dishPic) {
		this.dishPic = dishPic;
	}
	public String getDishIntro() {
		return dishIntro;
	}
	public void setDishIntro(String dishIntro) {
		this.dishIntro = dishIntro;
	}
	public String getDishType() {
		return dishType;
	}
	public void setDishType(String dishType) {
		this.dishType = dishType;
	}
	
}
