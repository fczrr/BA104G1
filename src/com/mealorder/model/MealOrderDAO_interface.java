package com.mealorder.model;

import java.util.*;
import com.mealorderdetail.model.*;
public interface MealOrderDAO_interface {
	
	public void insert(MealOrderVO mealOrderVO ,List<MealOrderDetailVO> mealOrderDetailVOList);//OK
	 
	public void updateStatus(String moNo, String moStatus);

	public MealOrderVO findByPrimaryKey(String moNo);

	public List<MealOrderVO> getAll();//OK
    
	public List<MealOrderVO> getByStatus(String moStatus);

	public List<MealOrderVO> getByMember(String memNo);//OK
	
}
