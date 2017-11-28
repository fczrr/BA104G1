package com.android.carSchedul.model;

import java.util.List;

import com.android.mealOrder.model.MealOrderVO;

public class CarSchedulService {
	private CarSchedulDAO_interface dao ;
	public CarSchedulService(){
		dao = new CarSchedulDAO();
	}
	public List<CarSchedulVO> getAll(){
		return dao.getAll();
	}
	public void update(CarSchedulVO carSchedulVO){
		dao.update(carSchedulVO);
	}
	public List<CarSchedulVO> getByEmpNo(String empNo,String date){ 
		return dao.getByEmpNo(empNo, date);
	}
	
}
