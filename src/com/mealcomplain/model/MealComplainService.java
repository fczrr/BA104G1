package com.mealcomplain.model;

import java.sql.Timestamp;
import java.util.List;

public class MealComplainService {
	
	public MealComplainDAO_interface dao;
	
	public MealComplainService(){
		dao = new MealComplainJNDIDAO();
	}
	
	public MealComplainVO addMealCom(String mo_no, String complainDetail, String complainStatus){
		MealComplainVO mealComplainVO = new MealComplainVO();
		mealComplainVO.setMo_no(mo_no);
		mealComplainVO.setComplainDetail(complainDetail);
		mealComplainVO.setComplainStatus(complainStatus);
		dao.insert(mealComplainVO);
		return mealComplainVO;
	}
	
	
	public MealComplainVO updateMealCom(String complainNo, String complainReply, Timestamp replyDate ,String emp_no, String complainStatus){
		MealComplainVO mealComplainVO = new MealComplainVO();
		mealComplainVO.setComplainNo(complainNo);
		mealComplainVO.setComplainReply(complainReply);
		mealComplainVO.setReplyDate(replyDate);
		mealComplainVO.setEmp_no(emp_no);
		mealComplainVO.setComplainStatus(complainStatus);
		dao.update(mealComplainVO);
		return mealComplainVO;
	}
	
	public void deleteMealCom(String complainNo){
		dao.delete(complainNo);
	}
	
	public MealComplainVO getOneMealCom(String complainNo){
		return dao.findByPrimaryKey(complainNo);
	}
	
	public List<MealComplainVO> getAll(){
		return dao.getAll();
	}
	
	
}
