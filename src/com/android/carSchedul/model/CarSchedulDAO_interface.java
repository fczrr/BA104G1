package com.android.carSchedul.model;

import java.util.List;

public interface CarSchedulDAO_interface {
	public List<CarSchedulVO> getAll();
	public void update(CarSchedulVO carSchedulVO);
	public List<CarSchedulVO> getByEmpNo(String empNo,String date);
}
