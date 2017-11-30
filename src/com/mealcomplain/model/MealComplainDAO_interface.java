package com.mealcomplain.model;

import java.util.List;


public interface MealComplainDAO_interface {
	public void insert(MealComplainVO mealComplainVO);
	public void update(MealComplainVO mealComplainVO);
	public void delete(String complainNo);
	public MealComplainVO findByPrimaryKey(String complainNo);
	public List<MealComplainVO> getAll();

}
