package com.hcorder.modal;

import java.util.List;

import com.hcworkshifts.model.HcWorkShiftsVO;

public class HcOrderDetailService {
	private HcOrderDetailDAO_interface dao;
	
	public HcOrderDetailService(){
		dao = new HcOrderDetailJDBCDAO();
	}
	
	public void updateAll(List<HcOrderDetailVO> hcOrderDetailVOList, HcWorkShiftsVO hcWorkShiftsVO){
		dao.updateAll(hcOrderDetailVOList,hcWorkShiftsVO);
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
