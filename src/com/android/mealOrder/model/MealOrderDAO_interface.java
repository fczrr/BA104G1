package com.android.mealOrder.model;

import java.util.List;

import com.android.carOrder.model.CarOrderVO;
import com.android.mealOrderDetail.model.MealOrderDetailVO;
import com.android.member.model.MemberVO;

public interface MealOrderDAO_interface {
	public List<MealOrderVO> findByMemNo(String memNo);
	
	public void addMealOrder(MealOrderVO mealOrderVO,MemberVO memberVO);
	
	public List<MealOrderDetailVO> getAll();
}	
