package com.expertlist.model;

import java.sql.Date;
import java.util.List;
import com.balance.model.*;

public class ExpertlistService {

	private ExpertlistDAO_interface dao;

	public ExpertlistService() {
	//	dao = new ExpertlistJDBCDAO2();
		dao = new ExpertlistJNDIDAO2();

	}
	public ExpertlistVO addEXPERTLIST(ExpertlistVO expertlistVO) {

		dao.insert(expertlistVO);

		return expertlistVO;
	}

	public ExpertlistVO addEXPERTLIST(
			String expNo, 
			String expName, 
			String expSpec) {

		ExpertlistVO expertlistVO = new ExpertlistVO();
		
		expertlistVO.setExpNo(expNo);
		expertlistVO.setExpName(expName);
		expertlistVO.setExpSpec(expSpec);
		dao.insert(expertlistVO);

		return expertlistVO; 
	}

	
	public ExpertlistVO updateEXPLIST(ExpertlistVO expertlistVO ) {


		dao.update(expertlistVO);

		return expertlistVO;
	}

	public void deleteEXPLIST(String expNo) {
		dao.delete(expNo);
	}

	public ExpertlistVO getOneEXPLIST(String expNo) {
		return dao.findByPrimaryKey(expNo);
	}

	public List<ExpertlistVO> getAll() {
		return dao.getAll();
	}
//	public ExpertlistVO updateEXPLIST(ExpertlistVO expertlistVO) {
//		dao.update(expertlistVO);
//		return null;
//	}
}
