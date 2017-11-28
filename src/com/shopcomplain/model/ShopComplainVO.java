package com.shopcomplain.model;

import java.sql.Timestamp;

public class ShopComplainVO {
	
	private String complainNo;
	private String orderno;
	private String complainDetail;
	private Timestamp detailDate;
	private String complainReply;
	private Timestamp replyDate;
	private String emp_no;
	private String complainStatus;
	
	public String getComplainNo() {
		return complainNo;
	}
	public void setComplainNo(String complainNo) {
		this.complainNo = complainNo;
	}
	public String getOrderno() {
		return orderno;
	}
	public void setOrderno(String orderno) {
		this.orderno = orderno;
	}
	public String getComplainDetail() {
		return complainDetail;
	}
	public void setComplainDetail(String complainDetail) {
		this.complainDetail = complainDetail;
	}
	public Timestamp getDetailDate() {
		return detailDate;
	}
	public void setDetailDate(Timestamp detailDate) {
		this.detailDate = detailDate;
	}
	public String getComplainReply() {
		return complainReply;
	}
	public void setComplainReply(String complainReply) {
		this.complainReply = complainReply;
	}
	public Timestamp getReplyDate() {
		return replyDate;
	}
	public void setReplyDate(Timestamp replyDate) {
		this.replyDate = replyDate;
	}
	public String getEmp_no() {
		return emp_no;
	}
	public void setEmp_no(String emp_no) {
		this.emp_no = emp_no;
	}
	public String getComplainStatus() {
		return complainStatus;
	}
	public void setComplainStatus(String complainStatus) {
		this.complainStatus = complainStatus;
	}

}
