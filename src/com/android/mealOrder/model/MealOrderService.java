package com.android.mealOrder.model;

import java.util.List;

import com.android.mealOrderDetail.model.MealOrderDetailVO;
import com.android.member.model.MemberVO;

public class MealOrderService {
	private MealOrderDAO_interface dao;
	public MealOrderService(){
		dao = new MealOrderDAO();
	}
	public void addMealOrder(MealOrderVO mealOrderVO, MemberVO memberVO){
		dao.addMealOrder(mealOrderVO, memberVO);
	}
	public List<MealOrderVO> findByMemNo(String memNo){
		return dao.findByMemNo(memNo);
	}
	public List<MealOrderVO> getAll(){
		return dao.getAll();
	}
}
