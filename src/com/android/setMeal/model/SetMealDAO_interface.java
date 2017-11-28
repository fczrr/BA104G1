package com.android.setMeal.model;

import java.util.List;

public interface SetMealDAO_interface {
	public List<SetMealVO> getAll();
	public byte[] getImgByNo(Integer smNo);
	public void insert(SetMealVO setMealVO); 
	public SetMealVO getOneByNo(Integer smNo);
}
