package com.android.hcOrderMaster.model;

import java.util.List;

import com.android.hcOrderDetail.model.HcOrderDetailVO;

public interface HcOrderMasterDAO_interface {
	public void insert(HcOrderMasterVO hcOrderMasterVO);
	public void update(HcOrderMasterVO hcOrderMasterVO);
	public void delete(String orderNo);
	public HcOrderMasterVO findByPrimaryKey(String orderNo);
	public List<HcOrderMasterVO> getAll();
	public void transaction(HcOrderMasterVO hcOrderMasterVO,List<HcOrderDetailVO> detailList);
	public List<HcOrderMasterVO> getByMemNo(String memNo);
	
}
