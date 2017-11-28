package com.shoporder.model;

import java.util.List;

public interface ShopOrderDAO_interface {

	//取得訂單編號裡的所有商品
	public List<ShopOrderVO> getAllByOrderNo(String orderno);
	//取得訂購該商品編號的所有人明細
	public List<ShopOrderVO> getOneByItemNo(Integer pk);
	//取得該訂單編號的所有商品
	public List<ShopOrderVO> getPriceByOrderNo(String orderno);
	//取得該訂單編號有促銷的商品
	public List<ShopOrderVO> getPriceByOrderNoIfHave(String orderno);
	//取得該會員所購買的商品
	public List<ShopOrderVO> getAllByMenNO(String menno);
	//取得所有的訂單&對應的會員
	public List<ShopOrderVO> getAllOrder();
	//新增商品及明細
	public void addShopOrder(ShopOrderVO shoporderVO);
	//購物車商品批次新增
	public void addShopCartOrder(List<ShopOrderVO> shoporderVO);
	//更新訂單
	public List<ShopOrderVO> updateShopOrder(List<ShopOrderVO> shoporderVO,Integer finalTotal);
	//用ITEMNO&ORDERID刪除
	public void delete(String orderno,String memno);
	//回報會員的儲值點數
	public Integer returnPoint(String memno);
	//扣除會員點數
	public Integer returnAfterShoppingPoint(Integer total,String memno);
	//刪除訂單後返還會員點數  //回傳剩餘點數
	public Integer returnPointback(String Orderno);
	//更改訂單狀態為2,已完成
	public void changeOrderToOK(String orderid);
	//更改訂單狀態為3,已取消
	public void changeOrderToCancel(String orderid);
	//增加某位會員點數
	public void addPointForMember(Integer point,String memno);
}
