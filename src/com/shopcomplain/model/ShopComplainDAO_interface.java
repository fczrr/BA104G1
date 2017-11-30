package com.shopcomplain.model;

import java.util.List;

public interface ShopComplainDAO_interface {
	public void insert(ShopComplainVO shopComplainVO);
	public void update(ShopComplainVO shopComplainVO);
	public void delete(String complainNo);
	public ShopComplainVO findByPrimaryKey(String complainNo);
	public List<ShopComplainVO> getAll();

}
