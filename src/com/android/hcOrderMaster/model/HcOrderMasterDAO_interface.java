package com.android.hcOrderMaster.model;

import java.util.List;

import com.android.hcOrderDetail.model.HcOrderDetailVO;
import com.android.member.model.MemberVO;

public interface HcOrderMasterDAO_interface {
	public void insert(HcOrderMasterVO hcOrderMasterVO);
	public void update(HcOrderMasterVO hcOrderMasterVO);
	public void delete(String orderNo);
	public HcOrderMasterVO findByPrimaryKey(String orderNo);
	public List<HcOrderMasterVO> getAll();
	public void transaction(HcOrderMasterVO hcOrderMasterVO,MemberVO memberVO);
	public List<HcOrderMasterVO> getByMemNo(String memNo);	
}
