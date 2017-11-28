package com.android.setMeal.model;

import java.util.List;

public class SetMealService {
	private SetMealDAO_interface dao;
	
	public SetMealService(){
		dao = new SetMealDAO();
	}
	public List<SetMealVO> getAll(){
		return dao.getAll();
	}
	public byte[] getImg(Integer smNo){
		return dao.getImgByNo(smNo);
	}
	public SetMealVO getOneByNo(Integer smNo){
		return dao.getOneByNo(smNo);
	}
}
