package com.branches.model;

import java.sql.Date;
import java.util.List;


public class BranchesService {

	private BranchesDAO_interface dao;

	public BranchesService() {
		dao = new BranchesJNDIDAO();
	}
	public BranchesVO addBranches( BranchesVO branchesVO) {

		dao.insert(branchesVO);

		return branchesVO;
	}
	public BranchesVO addBranches(
			String empBranches, 
			Double brcLat, 
			Double brcLon,
			String brcName) {

		BranchesVO branchesVO = new BranchesVO();
		
		branchesVO.setEmpBranches(empBranches);
		branchesVO.setBrcLat(brcLat);
		branchesVO.setBrcLon(brcLon);
		branchesVO.setBrcName(brcName);	
		dao.insert(branchesVO);

		return branchesVO;
	}
	
	public BranchesVO updateBRANCHES(
			BranchesVO branchesVO) {

//		BranchesVO branchesVO = new BranchesVO();
//		branchesVO.setBrcName(brcName);
//		branchesVO.setBrcLat(brcLat);
//		branchesVO.setBrcLon(brcLon);
		dao.update(branchesVO);

		return branchesVO;
	}

	public void deleteTHECARED(String empBranches) {
		dao.delete(empBranches);
	}

	public BranchesVO getOneTHECARED(String empBranches) {
		return dao.findByPrimaryKey(empBranches);
	}

	public List<BranchesVO> getAll() {
		return dao.getAll();
	}
}
