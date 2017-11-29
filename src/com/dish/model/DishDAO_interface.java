package com.dish.model;

import java.util.List;

public interface DishDAO_interface {
	public void insert(DishVO dishVO);

	public void update(DishVO dishVO);

	public void delete(Integer dishNo);

	public DishVO findByPrimaryKey(Integer dishNo);

	public List<DishVO> getAll();

	public List<DishVO> getByType(String dishType);

}
