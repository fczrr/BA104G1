package com.balance.model;

import java.sql.Date;
import java.util.List;
import com.balance.model.*;

public class BalanceService {

	private BalanceDAO_interface dao;

	public BalanceService() {
		dao = new BalanceJNDIDAO();
	}
	private String topupNo;
	private String memNo;
	private Integer topupValue;
	private String topupTime;
	private String status;
	
	
//	public void BalanceVO chageStatebyTopupno(String topupNo, String status){
//		BalanceVO balanceVO = new BalanceVO();
//		balanceVO.setTopupNo(topupNo);
//		balanceVO.setStatus(status);
//		
//		dao.findByTopupNo(topupNo);
//
//	}
	
	public List<BalanceVO> getAllByMemNo2(String memNo){
		
		BalanceVO balanceVO = new BalanceVO();
		balanceVO.setTopupNo(topupNo);
		balanceVO.setTopupTime(topupTime); 
		balanceVO.setTopupValue(topupValue);
		balanceVO.setStatus(status);
		dao.getAllByMemNo(memNo)  ;

		return dao.getAllByMemNo(memNo);
	}
	
	public BalanceVO getAllByMemNo(String memNo){
		
		BalanceVO balanceVO = new BalanceVO();
		balanceVO.setTopupNo(topupNo);
		balanceVO.setMemNo(memNo);
		balanceVO.setTopupTime(topupTime); 
		balanceVO.setTopupValue(topupValue);
		balanceVO.setStatus(status);
		dao.insert(balanceVO);

		return balanceVO;
	}
	public BalanceVO addTopup(BalanceVO balanceVO){
		dao.insert(balanceVO);

		return balanceVO;
	}
	public BalanceVO addTopup(String memNo, Integer topupValue, String topupWay ) {

		BalanceVO balanceVO = new BalanceVO();
		balanceVO.setMemNo(memNo);
		balanceVO.setTopupValue(topupValue);
		balanceVO.setStatus(topupWay);
		dao.insert(balanceVO);

		return balanceVO;
	}

	public void  updateStatus( String status,String topupNo) {

		BalanceVO balanceVO = new BalanceVO();
		balanceVO.setStatus(status);
		balanceVO.setTopupNo(topupNo);
		
		dao.update(status,topupNo);

		
	}

	public void deleteEmp(String topupNo) {
		dao.delete(topupNo);
	}

	public BalanceVO getOneBalanceVO(String memNo) {
		return dao.findByPrimaryKey(memNo);
	}
	
	public List<BalanceVO> getBalanceByMemNo(String memNo) {
		return dao.getAllByMemNo(memNo);
	}

	public List<BalanceVO> getAll() {
		
		return dao.getAll();
	}
}
