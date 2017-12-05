package com.android.carOrder.model;

import java.util.List;

import com.android.carDetailVO.model.CarDetailVO;
import com.android.carSchedul.model.CarSchedulVO;
import com.android.member.model.MemberVO;

public class CarOrderService {
	private CarOrderDAO_interface dao;
	public CarOrderService(){
		dao = new CarOrderDAO();
	}

	public List<CarOrderVO> findByMemNo(String memNo){
		return dao.findByMemNo(memNo);
	}
	
	public void addCarOrder(CarOrderVO carOrderVO,MemberVO memberVO){
		dao.addCarOrder(carOrderVO, memberVO);
	}
	public List<CarDetailVO> getEmpOrder(String empNo){
		return dao.getEmpOrder(empNo);
	}
}
