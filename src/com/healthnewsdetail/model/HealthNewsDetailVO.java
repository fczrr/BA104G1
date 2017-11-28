package com.healthnewsdetail.model;

import java.sql.Timestamp;

public class HealthNewsDetailVO {
	private String healthNo;
	private String newsTitle;
	private String newsIntro;
	private String emp_no;
	private byte[] coverPic;
//	private byte[] newsPic1;
//	private byte[] newsPic2;
	private Timestamp newsDate;
	private String status;
	
	
	public String getHealthNo() {
		return healthNo;
	}
	public void setHealthNo(String healthNo) {
		this.healthNo = healthNo;
	}
	public String getNewsTitle() {
		return newsTitle;
	}
	public void setNewsTitle(String newsTitle) {
		this.newsTitle = newsTitle;
	}
	public String getNewsIntro() {
		return newsIntro;
	}
	public void setNewsIntro(String newsIntro) {
		this.newsIntro = newsIntro;
	}
	public String getEmp_no() {
		return emp_no;
	}
	public void setEmp_no(String emp_no) {
		this.emp_no = emp_no;
	}
	public byte[] getCoverPic() {
		return coverPic;
	}
	public void setCoverPic(byte[] coverPic) {
		this.coverPic = coverPic;
	}
//	public byte[] getNewsPic1() {
//		return newsPic1;
//	}
//	public void setNewsPic1(byte[] newsPic1) {
//		this.newsPic1 = newsPic1;
//	}
//	public byte[] getNewsPic2() {
//		return newsPic2;
//	}
//	public void setNewsPic2(byte[] newsPic2) {
//		this.newsPic2 = newsPic2;
//	}
	public Timestamp getNewsDate() {
		return newsDate;
	}
	public void setNewsDate(Timestamp newsDate) {
		this.newsDate = newsDate;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}

}
