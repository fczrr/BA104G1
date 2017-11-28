package com.newsdetail.model;

import java.sql.*;

public class NewsdetailVO {
	private String newsno;
	private String newstitle;
	private String newsintro;
	private String empno;
	private byte[] coverpic;
//	private byte[] newspic1;
//	private byte[] newspic2;
//	private byte[] newspic3;
//	private byte[] newspic4;
	private Timestamp newsdate;
	private String status;

	
	
	public String getNewsno() {
		return newsno;
	}
	public void setNewsno(String newsno) {
		this.newsno = newsno;
	}
	public String getNewstitle() {
		return newstitle;
	}
	public void setNewstitle(String newstitle) {
		this.newstitle = newstitle;
	}
	public String getNewsintro() {
		return newsintro;
	}
	public void setNewsintro(String newsintro) {
		this.newsintro = newsintro;
	}
	public String getEmpno() {
		return empno;
	}
	public void setEmpno(String empno) {
		this.empno = empno;
	}
	public byte[] getCoverpic() {
		return coverpic;
	}
	public void setCoverpic(byte[] coverpic) {
		this.coverpic = coverpic;
	}
	public Timestamp getNewsdate() {
		return newsdate;
	}
	public void setNewsdate(Timestamp newsdate) {
		this.newsdate = newsdate;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	
}