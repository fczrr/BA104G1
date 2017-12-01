package com.carcomplain.model;

import java.sql.Timestamp;
import java.util.List;

public class CarComplainService {
	
	private CarComplainDAO_interface dao;
	
	public CarComplainService(){
		dao = new CarComplainJNDIDAO();
	}
	
	
	public CarComplainVO addCarCom(String order_no, String complainDetail, String complainStatus){
		CarComplainVO carComplainVO = new CarComplainVO();
		carComplainVO.setOrder_no(order_no);
		carComplainVO.setComplainDetail(complainDetail);
		carComplainVO.setComplainStatus(complainStatus);
		dao.insert(carComplainVO);
		return carComplainVO;
	}
	
	
	public CarComplainVO updateCarCom(String complainNo,String complainReply, Timestamp replyDate ,String emp_no, String complainStatus){
		CarComplainVO carComplainVO = new CarComplainVO();
		carComplainVO.setComplainNo(complainNo);
		carComplainVO.setComplainReply(complainReply);
		carComplainVO.setReplyDate(replyDate);
		carComplainVO.setEmp_no(emp_no);
		carComplainVO.setComplainStatus(complainStatus);
		dao.update(carComplainVO);
		return carComplainVO;
		
	}
	
	public void deleteCarCom(String complainNo){
		dao.delete(complainNo);
	}
	
	
	public CarComplainVO getOneCarCom(String complainNo){
		return dao.findByPrimaryKey(complainNo);
	}
	
	public List<CarComplainVO> getAll(){
		return dao.getAll();
	}
	
	public List<CarComplainVO> getOnAll(){
		return dao.getOnAll();
	}
	
	public List<CarComplainVO> getOffAll(){
		return dao.getOffAll();
	}
	
}
