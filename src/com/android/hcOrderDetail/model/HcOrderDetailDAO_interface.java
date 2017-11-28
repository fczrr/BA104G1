package com.android.hcOrderDetail.model;

import java.util.List;

public interface HcOrderDetailDAO_interface {
	public void insert(HcOrderDetailVO hcOrderDetail);
	public void update(HcOrderDetailVO hcOrderDetail);
	public void delete(String orderDetailNo);
	public HcOrderDetailVO findByPrimaryKey(String orderDetailNo);
	public List<HcOrderDetailVO> getAll();
	public List<HcOrderDetailVO> getByEmpNo(String empNo);
}
