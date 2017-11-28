package com.expert.model;

import java.sql.Date;
import java.util.List;
import com.expert.model.*;

public class ExpertService {

	private ExpertDAO_interface dao;

	public ExpertService() {
		dao = new ExpertJNDIDAO();
	}
 
	public ExpertVO addEXPERT(
			String expOwn, 
			String empNo, 
			String expNo) {

		ExpertVO expertVO = new ExpertVO();
		
		expertVO.setExpOwn(expOwn);
		expertVO.setEmpNo(empNo);
		expertVO.setExpNo(expNo);
		
		dao.insert(expertVO);

		return expertVO;
	}

	
	public ExpertVO updateEXPERT(
			String empNo, 
			String expNo) {

		ExpertVO expertVO = new ExpertVO();
		expertVO.setEmpNo(empNo);
		expertVO.setExpNo(expNo);
		dao.update(expertVO);
		return expertVO;
	}

	public void deleteEXPERT(String expOwn) {
		dao.delete(expOwn);
	}

	public ExpertVO getOneEXPERT(String expOwn) {
		return dao.findByPrimaryKey(expOwn);
	}

	public List<ExpertVO> getAll() {
		return dao.getAll();
	}
	
	public List<ExpertVO> getAllByEmpNo(String expNo) {
		return dao.getAllByEMPNO(expNo);
	}
}
