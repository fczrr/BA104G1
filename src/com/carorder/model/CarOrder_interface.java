package com.carorder.model;

import java.util.*;

import com.member.model.MemberVO;
import com.cardetail.model.CarDetailVO;
import com.carschedul.model.CarSchedulVO;

public interface CarOrder_interface {

	public void insert(CarOrderVO carorderVO,List<CarSchedulVO> carSchedulVOList, List<CarDetailVO> list,MemberVO memberVO);
	public void update(CarOrderVO carorderVO);
	public void delete(String order_no);
	public CarOrderVO findByPrimaryKey(String order_no);
	public List<CarOrderVO> getAll();
	
	
}
