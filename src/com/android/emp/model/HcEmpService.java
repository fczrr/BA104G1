package com.android.emp.model;

import java.util.List;

public class HcEmpService {
	private HcEmpDAO_interface dao ;
	public HcEmpService(){
		dao = new HcEmpDAO();
	}
	public List<HcEmpVO> getAll(){
		return dao.getAll();
	}
	public byte[] getImgByEmpNo(String empNo){
		return dao.getImgByEmpNo(empNo);
	}
	public HcWorkShiftsVO getShifts(String empNo, String monthOfYear){
		return dao.getShifts(empNo, monthOfYear);
	}
	
	
	
}
