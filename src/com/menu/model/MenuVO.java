package com.menu.model;

import java.sql.Date;

public class MenuVO implements java.io.Serializable {
	private Integer menuNo;
	private Integer smNo;
	private Date menuDate;
	private String mealTime;
	private String dishName;

	public Integer getMenuNo() {
		return menuNo;
	}

	public void setMenuNo(Integer menuNo) {
		this.menuNo = menuNo;
	}

	public Integer getSmNo() {
		return smNo;
	}

	public void setSmNo(Integer smNo) {
		this.smNo = smNo;
	}

	public String getMealTime() {
		return mealTime;
	}

	public void setMealTime(String mealTime) {
		this.mealTime = mealTime;
	}

	public String getDishName() {
		return dishName;
	}

	public void setDishName(String dishName) {
		this.dishName = dishName;
	}

	public Date getMenuDate() {
		return menuDate;
	}

	public void setMenuDate(Date menuDate) {
		this.menuDate = menuDate;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((dishName == null) ? 0 : dishName.hashCode());
		result = prime * result + ((mealTime == null) ? 0 : mealTime.hashCode());
		result = prime * result + ((menuDate == null) ? 0 : menuDate.hashCode());
		result = prime * result + ((menuNo == null) ? 0 : menuNo.hashCode());
		result = prime * result + ((smNo == null) ? 0 : smNo.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		MenuVO other = (MenuVO) obj;
		if (dishName == null) {
			if (other.dishName != null)
				return false;
		} else if (!dishName.equals(other.dishName))
			return false;
		if (mealTime == null) {
			if (other.mealTime != null)
				return false;
		} else if (!mealTime.equals(other.mealTime))
			return false;
		if (menuDate == null) {
			if (other.menuDate != null)
				return false;
		} else if (!menuDate.equals(other.menuDate))
			return false;
		if (menuNo == null) {
			if (other.menuNo != null)
				return false;
		} else if (!menuNo.equals(other.menuNo))
			return false;
		if (smNo == null) {
			if (other.smNo != null)
				return false;
		} else if (!smNo.equals(other.smNo))
			return false;
		return true;
	}

}
