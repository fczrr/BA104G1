package com.mealorder.model;

import java.util.List;

import com.mealorderdetail.model.MealOrderDetailVO;

public class MealOrderService {
	private MealOrderDAO_interface dao;

	public MealOrderService() {
		dao = new MealOrderDAO();
	}

	public void addMealOrder(MealOrderVO mealOrderVO, List<MealOrderDetailVO> mealOrderDetailVOList) {
		dao.insert(mealOrderVO, mealOrderDetailVOList);
	}

	public void updateStatus(String moNo, String moStatus) {
		dao.updateStatus(moNo, moStatus);
	}                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        

	public MealOrderVO getOneMealOrder(String moNo) {
		return dao.findByPrimaryKey(moNo);
	}                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         

	public List<MealOrderVO> getAll() {
		return dao.getAll();
	}

	public List<MealOrderVO> getByStatus(String moStatus) {
		return dao.getByStatus(moStatus);
	}

	public List<MealOrderVO> getByMember(String memNo) {
		return dao.getByMember(memNo);
	}

}
