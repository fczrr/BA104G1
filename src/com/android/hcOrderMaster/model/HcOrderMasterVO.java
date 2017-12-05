package com.android.hcOrderMaster.model;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import com.android.hcOrderDetail.model.HcOrderDetailVO;

public class HcOrderMasterVO implements Serializable{
	private String orderNo;
	private String memNo;
	private String caredNo;
	private Timestamp orderDate;                                                     
	private String orderStatus;
	private List<HcOrderDetailVO> detailList = new ArrayList();
	private com.thecared.model.ThecaredVO ThecaredVO;
	
	
	
	public com.thecared.model.ThecaredVO getThecaredVO() {
		return ThecaredVO;
	}

	public void setThecaredVO(com.thecared.model.ThecaredVO thecaredVO2) {
		ThecaredVO = thecaredVO2;
	}

	public HcOrderMasterVO(){}
	
	public HcOrderMasterVO(String orderNo, String memNo, String caredNo, Timestamp orderDate, String orderStatus,
			List<HcOrderDetailVO> detailList) {
		super();
		this.orderNo = orderNo;
		this.memNo = memNo;
		this.caredNo = caredNo;
		this.orderDate = orderDate;
		this.orderStatus = orderStatus;
		this.detailList = detailList;
	}
	
	public String getCaredNo() {
		return caredNo;
	}


	public void setCaredNo(String caredNo) {
		this.caredNo = caredNo;
	}


	public List<HcOrderDetailVO> getDetailList() {
		return detailList;
	}

	public void setDetailList(List<HcOrderDetailVO> detailList) {
		this.detailList = detailList;
	}

	public String getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}
	public String getMemNo() {
		return memNo;
	}
	public void setMemNo(String memNo) {
		this.memNo = memNo;
	}
	public Timestamp getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Timestamp orderDate) {
		this.orderDate = orderDate;
	}
	public String getOrderStatus() {
		return orderStatus;
	}
	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}
	@Override
	public String toString(){
		return "OrderNo = "+this.getOrderNo();
	}
	
}
