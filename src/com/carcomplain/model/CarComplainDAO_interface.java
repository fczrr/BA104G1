package com.carcomplain.model;

import java.util.List;

public interface CarComplainDAO_interface {
	public void insert(CarComplainVO carComplainVO);
	public void update(CarComplainVO carComplainVO);
	public void delete(String complainNo);
	public CarComplainVO findByPrimaryKey(String complainNo);
	public List<CarComplainVO> getAll();


}
