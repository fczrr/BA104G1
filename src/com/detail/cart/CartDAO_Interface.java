package com.detail.cart;

public interface CartDAO_Interface {

	public CartVO findshop(Integer number,Integer quantity);
	public CartVO findshopbypro(Integer number,Integer quantity);
	
	
}
