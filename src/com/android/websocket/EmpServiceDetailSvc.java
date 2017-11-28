package com.android.websocket;

import java.util.List;

public class EmpServiceDetailSvc {
	private EmpServiceDetailDAO_interface dao;
	
	public EmpServiceDetailSvc(){
		dao = new EmpServiceDetailDAO();
	}
	
	public void insert(EmpServiceDetailVO empServiceDetailVO){
		dao.insert(empServiceDetailVO);
	}
	public List<EmpServiceDetailVO> getByMemNo(String memNo){
		return dao.getByMemNo(memNo);
	}
	public List<EmpServiceDetailVO> getByEmpNo(String empNo){
		return dao.getByEmpNo(empNo);
	}
	public void update(EmpServiceDetailVO empServiceDetailVO){
		dao.update(empServiceDetailVO);
	}
	public EmpServiceDetailVO getOne(EmpServiceDetailVO empServiceDetailVO){
		return dao.getOne(empServiceDetailVO);
	}
}
