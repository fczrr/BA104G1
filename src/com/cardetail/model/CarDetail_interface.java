package com.cardetail.model;

import java.sql.Date;
import java.util.*;

public interface CarDetail_interface {

	public void insert(CarDetailVO cardetailVO);
	public void update(CarDetailVO cardetailVO);
	public void delete(String detail_no);
	public CarDetailVO findByPrimaryKey(String detail_no);
	public List<CarDetailVO> getAll();
	public List<CarDetailVO> findByOrderNo(String order_no);
	public List<CarDetailVO> getByOrderNo(String orderNo);
	public List<CarDetailVO> findByCar(Integer vehicle_no, Date detail_date);
	
}
