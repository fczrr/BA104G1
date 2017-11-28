package com.mealorderdetail.model;

import java.sql.Date;
import java.util.List;

public class MealOrderDetailService {

	private MealOrderDetailDAO_interface dao;

	public MealOrderDetailService() {
		dao = new MealOrderDetailDAO();
	}
    
	public List<MealOrderDetailVO> getByOrderNo(String moNo) {
		return dao.getAllByMealOrderNo(moNo);
	}

}
