package com.detail.promotion;

import java.sql.Date;

public class ProVO {

	private Integer PROMOTIOMNO;//
	private Integer ITEMNO;//
	private Integer PRICE;//
	private String NAME;//
	private Date BEGINDATE;//
	private Date ENDDATE;//
	private String SHOPNAME;
	private String ACTIVITYNAME;
	private Integer quantity;
	private String DES;
	private Integer OLDPRICE;
	
	public Integer getOLDPRICE() {
		return OLDPRICE;
	}
	public void setOLDPRICE(Integer oLDPRICE) {
		OLDPRICE = oLDPRICE;
	}
	public String getDES() {
		return DES;
	}
	public void setDES(String dES) {
		DES = dES;
	}
	public Integer getQuantity() {
		return quantity;
	}
	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}
	public void setPROMOTIOMNO(Integer pROMOTIOMNO) {
		PROMOTIOMNO = pROMOTIOMNO;
	}
	public void setITEMNO(Integer iTEMNO) {
		ITEMNO = iTEMNO;
	}
	public void setPRICE(Integer pRICE) {
		PRICE = pRICE;
	}
	public String getACTIVITYNAME() {
		return ACTIVITYNAME;
	}
	public void setACTIVITYNAME(String aCTIVITYNAME) {
		ACTIVITYNAME = aCTIVITYNAME;
	}
	public String getSHOPNAME() {
		return SHOPNAME;
	}
	public void setSHOPNAME(String sHOPNAME) {
		SHOPNAME = sHOPNAME;
	}

	
	public String getNAME() {
		return NAME;
	}
	public void setNAME(String nAME) {
		NAME = nAME;
	}
	public Date getBEGINDATE() {
		return BEGINDATE;
	}
	public void setBEGINDATE(Date bEGINDATE) {
		BEGINDATE = bEGINDATE;
	}
	public Date getENDDATE() {
		return ENDDATE;
	}
	public void setENDDATE(Date eNDDATE) {
		ENDDATE = eNDDATE;
	}

	public int getPROMOTIOMNO() {
		return PROMOTIOMNO;
	}
	public void setPROMOTIOMNO(int pROMOTIOMNO) {
		PROMOTIOMNO = pROMOTIOMNO;
	}
	public int getITEMNO() {
		return ITEMNO;
	}
	public void setITEMNO(int iTEMNO) {
		ITEMNO = iTEMNO;
	}
	public int getPRICE() {
		return PRICE;
	}
	public void setPRICE(int pRICE) {
		PRICE = pRICE;
	}
	
	
}
