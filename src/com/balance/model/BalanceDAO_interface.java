package com.balance.model;

import java.util.List;


public interface BalanceDAO_interface {

    public void insert(BalanceVO balanceVO);
	public void update( String status,String topupNo);

    public void delete(String topupNo);
    public BalanceVO findByPrimaryKey(String memNo);

    public BalanceVO findByTopupNo(String topupNo);
    public List<BalanceVO> getAll();
    public List<BalanceVO> getAllByMemNo(String memNo);

}
