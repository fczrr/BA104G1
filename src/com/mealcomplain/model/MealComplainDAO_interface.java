package com.mealcomplain.model;

import java.util.List;

import com.carcomplain.model.CarComplainVO;


public interface MealComplainDAO_interface {
	public void insert(MealComplainVO mealComplainVO);
	public void update(MealComplainVO mealComplainVO);
	public void delete(String complainNo);
	public MealComplainVO findByPrimaryKey(String complainNo);
	public List<MealComplainVO> getAll();
	public List<MealComplainVO> getOffAll();
	public List<MealComplainVO> getOnAll();

}
