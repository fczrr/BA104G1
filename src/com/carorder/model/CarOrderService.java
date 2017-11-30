package com.carorder.model;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import com.cardetail.model.CarDetailVO;
import com.carschedul.model.CarSchedulVO;
import com.member.model.MemberVO;

public class CarOrderService {

	private CarOrder_interface dao;

	public CarOrderService() {
		dao = new CarOrderDAO();
	}

	public void addCarOrder(CarOrderVO carorderVO,List<CarSchedulVO> carSchedulVOList, List<CarDetailVO> list,MemberVO memberVO) {
		
		dao.insert(carorderVO,carSchedulVOList,list,memberVO);
	}

//	public CarOrderVO updateCarOrder(String order_no,String mem_no, Date order_date,String order_status) {
//
//		CarOrderVO carorderVO = new CarOrderVO();
//		
//		carorderVO.setOrder_no(order_no);
//		carorderVO.setMem_no(mem_no);
//		carorderVO.setOrder_date(order_date);
//		carorderVO.setOrder_status(order_status);
//		
//		dao.update(carorderVO);
//
//		return carorderVO;
//	}
	
	public CarOrderVO updateCarOrder(String order_no,String order_status) {

		CarOrderVO carorderVO = new CarOrderVO();
		
		carorderVO.setOrder_no(order_no);
		carorderVO.setOrder_status(order_status);
		
		dao.update(carorderVO);

		return carorderVO;
	}

	public void deleteCarOrder(String order_no) {
		dao.delete(order_no);
	}

	public CarOrderVO getOneCarOrder(String order_no) {
		return dao.findByPrimaryKey(order_no);
	}

	public List<CarOrderVO> getAll() {
		return dao.getAll();
	}
	public List<CarOrderVO> getByMemNo(String memNo){
		return dao.getByMemNo(memNo);
	}

}
