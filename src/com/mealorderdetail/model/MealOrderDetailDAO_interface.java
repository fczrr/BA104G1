package com.mealorderdetail.model;

import java.io.Serializable;
import java.util.List;

public interface MealOrderDetailDAO_interface {
	public List<MealOrderDetailVO> getAllByMealOrderNo(String moNo);

}
