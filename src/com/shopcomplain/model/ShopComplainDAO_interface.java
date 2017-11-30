package com.shopcomplain.model;

import java.util.List;

import com.carcomplain.model.CarComplainVO;

public interface ShopComplainDAO_interface {
	public void insert(ShopComplainVO shopComplainVO);
	public void update(ShopComplainVO shopComplainVO);
	public void delete(String complainNo);
	public ShopComplainVO findByPrimaryKey(String complainNo);
	public List<ShopComplainVO> getAll();
	
	public List<ShopComplainVO> getOffAll();
	public List<ShopComplainVO> getOnAll();

}
