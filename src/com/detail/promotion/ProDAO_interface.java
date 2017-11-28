package com.detail.promotion;

import java.util.List;

import com.shop.model.ShopVO;

public interface ProDAO_interface {
	
	public void insert(ProVO proVO);
	public void update(ProVO proVO);	
	public void delete(Integer proVO);
	//你好，我是查詢所有正在進行的促銷商品
	public List<ProVO> getAllProNow();	
	//你好，我是mainforpro專用的
	public List<ProVO> activity();
	//你好，我是update專用的
	public ProVO findByPrimaryKey(Integer proVO);
	//你好，我是用商品名稱去查詢的
	public ProVO getOneEmpForStringName(String proVO);
	//你好，我是用專案名稱去查詢的(所以會傳回很多個)
	public List<ProVO> findByPrimaryKeyByString(String pk);
	//你好，我是用專案編號去查詢的
	public ProVO getOneOnItemNO(int itemno);
	//你好，我是查詢所有的促銷專案
	public List<ProVO> getAllPro();
	//你好，我是查詢所有促銷商品
	public List<ProVO> getAllProShop();
	//你好，我是查詢單一促銷商品
	public ProVO getOneProShop(Integer itemno);
	//你好，查詢目前時間正在執行的促銷專案
	public ProVO getProProjectNow();
	//你好，我是把商品變成促銷商品的方法
	public void putShopInPromotion(Integer promotionno,Integer itemno,Integer price);
	
	
}
