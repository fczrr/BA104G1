package com.shop.model;

import java.util.List;

public interface ShopDAO_interface {

	public void insert(ShopVO ShopVO);
	public void update(ShopVO ShopVO);
	public void update2(ShopVO ShopVO);
	public void delete(Integer ShopVO);
	public void changeState(Integer pk,Integer state);
	public ShopVO findByPrimaryKey(Integer pk);
	public ShopVO findByPrimaryKeyByString(String pkName);
	
	//商城首頁專用，只有state=1才會秀出來
	public List<ShopVO> getAll();
	//後端管理商品專用
	public List<ShopVO> getAllFromBack();
	//後台管理刪除特定促銷商品
	public void deleteProShop(Integer itemno,Integer promotiomno);
	//查詢回傳list
	public List<ShopVO> findByPrimaryKeyByString2(String pkName);
	
}
