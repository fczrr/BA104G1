package com.hcorder.modal;

import java.util.List;

import com.hcworkshifts.model.HcWorkShiftsVO;

public class HcOrderDetailService {
	private HcOrderDetailDAO_interface dao;
	
	public HcOrderDetailService(){
		dao = new HcOrderDetailJDBCDAO();
	}
	
	public HcOrderDetailVO findByPrimaryKey(String orderDetailNo){
		return dao.findByPrimaryKey(orderDetailNo);
	}
	
	
	public void updateAll(List<HcOrderDetailVO> hcOrderDetailVOList, HcWorkShiftsVO hcWorkShiftsVO){
		dao.updateAll(hcOrderDetailVOList,hcWorkShiftsVO);
	}
	
	public void updateStatus(String orderDetailNo,String orderDetailStataus){
		HcOrderDetailVO hcOrderDetailVO = dao.findByPrimaryKey(orderDetailNo);
		hcOrderDetailVO.setOrderDetailStataus(orderDetailStataus);
		dao.update(hcOrderDetailVO);
	}
	
	public void getToAuto(String orderDetailNo){
		HcOrderDetailVO hcOrderDetailVO = dao.findByPrimaryKey(orderDetailNo);
		hcOrderDetailVO.setEmpNo("EMP0000");
		
		System.out.println(hcOrderDetailVO.getEmpNo());
		dao.update(hcOrderDetailVO);
	} 
	
	
	public  List<HcOrderDetailVO> getAllByOrderNo(String orderNo){
		List<HcOrderDetailVO> HcOrderDetailVOList = dao.getAllByOrderNo(orderNo);
		return HcOrderDetailVOList;
	}
	
	public  List<HcOrderDetailVO> getAllOneMonthInPerson(Integer month ,String empNo){
		List<HcOrderDetailVO> HcOrderDetailVOList = dao.getAllOneMonthInPerson( month , empNo);
		return HcOrderDetailVOList;
	}

	public  HcOrderDetailVO getAllBySreviceTimeInPerson(String date ,String time ,String empNo){
		HcOrderDetailVO hcOrderDetailVO = dao.getAllBySreviceTimeInPerson( date , time , empNo);
		return hcOrderDetailVO;
	}
}
