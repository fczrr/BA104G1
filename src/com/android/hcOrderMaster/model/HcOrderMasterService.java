package com.android.hcOrderMaster.model;

import java.util.List;

public class HcOrderMasterService {
	private HcOrderMasterDAO_interface dao;
	public HcOrderMasterService(){
		dao = new HcOrderMasterDAO();
	}
	
	public List<HcOrderMasterVO> getByMemNo(String memNo){
		return dao.getByMemNo(memNo);
	}
	
	
}
