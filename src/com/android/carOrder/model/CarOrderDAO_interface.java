package com.android.carOrder.model;

import java.util.List;

import com.android.carDetailVO.model.CarDetailVO;
import com.android.carSchedul.model.CarSchedulVO;
import com.android.member.model.MemberVO;

public interface CarOrderDAO_interface {
	public void insert(CarOrderVO carOrderVO);
	public void update(CarOrderVO carOrderVO);
	public void delete(String orderNo);
	public List<CarOrderVO> getAll();
	public List<CarOrderVO> findByMemNo(String memNo);
	public List<CarDetailVO> getEmpOrder(String empNo);
	public void addCarOrder(CarOrderVO carOrderVO,CarSchedulVO carSchedulVO,MemberVO memberVO);
}
