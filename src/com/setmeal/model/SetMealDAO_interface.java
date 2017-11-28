package com.setmeal.model;

import java.util.List;

public interface SetMealDAO_interface {
	public void insert(SetMealVO setMealVO);

	public void update(SetMealVO setMealVO);

	public void delete(Integer smNo);

	public SetMealVO findByPrimaryKey(Integer smNo);

	public List<SetMealVO> getAll();

}
