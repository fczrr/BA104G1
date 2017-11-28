package com.menu.model;

import java.util.List;

import com.setmeal.model.SetMealVO;

public interface MenuDAO_interface {
	public void insert(MenuVO menuVO);

	public List<MenuVO> getAll(Integer smNo);
	
	
    public void delete(Integer smNo);

}
