package com.detail.cart;

public class CartVO implements java.io.Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer PROMOTIOMNO;
	private Integer ITEMNO;
	private Integer PRICE;
	private String NAME;
	private String SHOPNAME;
	private String ACTIVITYNAME;
	private Integer QUANTITY;
	private Integer CLASSNO;
	private String DES;
	private Integer totalprice;
	
	public Integer getTotalprice() {
		return totalprice;
	}
	public void setTotalprice(Integer totalprice) {
		this.totalprice = totalprice;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public Integer getPROMOTIOMNO() {
		return PROMOTIOMNO;
	}
	public void setPROMOTIOMNO(Integer pROMOTIOMNO) {
		PROMOTIOMNO = pROMOTIOMNO;
	}
	public Integer getITEMNO() {
		return ITEMNO;
	}
	public void setITEMNO(Integer iTEMNO) {
		ITEMNO = iTEMNO;
	}
	public Integer getPRICE() {
		return PRICE;
	}
	public void setPRICE(Integer pRICE) {
		PRICE = pRICE;
	}
	public String getNAME() {
		return NAME;
	}
	public void setNAME(String nAME) {
		NAME = nAME;
	}

	public String getSHOPNAME() {
		return SHOPNAME;
	}
	public void setSHOPNAME(String sHOPNAME) {
		SHOPNAME = sHOPNAME;
	}
	public String getACTIVITYNAME() {
		return ACTIVITYNAME;
	}
	public void setACTIVITYNAME(String aCTIVITYNAME) {
		ACTIVITYNAME = aCTIVITYNAME;
	}
	public Integer getQUANTITY() {
		return QUANTITY;
	}
	public void setQUANTITY(Integer quantity) {
		this.QUANTITY = quantity;
	}

	public String getDES() {
		return DES;
	}
	public void setDES(String dES) {
		DES = dES;
	}
	public Integer getCLASSNO() {
		return CLASSNO;
	}
	public void setCLASSNO(Integer cLASSNO) {
		CLASSNO = cLASSNO;
	}
	
}
