package com.mealcomplain.model;

import java.sql.Timestamp;

public class MealComplainVO {
	private String complainNo;
	private String mo_no;
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
	public String getMo_no() {
		return mo_no;
	}
	public void setMo_no(String mo_no) {
		this.mo_no = mo_no;
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
