package com.shop.model;

import com.detail.promotion.ProVO;

public class ShopVO implements java.io.Serializable {

	private static final long serialVersionUID = 1L;
	private int ITEMNO;
	private int STOCK;
	private int PRICE;
	private int CLASSNO;
	private int STATE;
	private String NAME;
	private String DES;
	private byte[] picture1;
	private byte[] picture2;
	private byte[] picture3;
	private Integer quantity;
	private String key;

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + CLASSNO;
		result = prime * result + ((DES == null) ? 0 : DES.hashCode());
		result = prime * result + ITEMNO;
		result = prime * result + ((NAME == null) ? 0 : NAME.hashCode());
		result = prime * result + PRICE;
		return result;
	}

	public String getKey() {
		return key;
	}

	public void setKey(String key) {
		this.key = key;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (obj instanceof ProVO) {
			ProVO other = (ProVO) obj;
			if (ITEMNO != other.getITEMNO())
				return false;
		}
		if (obj instanceof ShopVO) {
			ShopVO other = (ShopVO) obj;
			if (ITEMNO != other.getITEMNO())
				return false;
		}
		return true;
	}

	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

	public int getITEMNO() {
		return ITEMNO;
	}

	public void setITEMNO(int iTEMNO) {
		ITEMNO = iTEMNO;
	}

	public int getSTOCK() {
		return STOCK;
	}

	public void setSTOCK(int sTOCK) {
		STOCK = sTOCK;
	}

	public int getPRICE() {
		return PRICE;
	}

	public void setPRICE(int pRICE) {
		PRICE = pRICE;
	}

	public int getCLASSNO() {
		return CLASSNO;
	}

	public void setCLASSNO(int cLASSNO) {
		CLASSNO = cLASSNO;
	}

	public int getSTATE() {
		return STATE;
	}

	public void setSTATE(int sTATE) {
		STATE = sTATE;
	}

	public String getNAME() {
		return NAME;
	}

	public void setNAME(String nAME) {
		NAME = nAME;
	}

	public String getDES() {
		return DES;
	}

	public void setDES(String dES) {
		DES = dES;
	}

	public byte[] getPicture1() {
		return picture1;
	}

	public void setPicture1(byte[] picture1) {
		this.picture1 = picture1;
	}

	public byte[] getPicture2() {
		return picture2;
	}

	public void setPicture2(byte[] picture2) {
		this.picture2 = picture2;
	}

	public byte[] getPicture3() {
		return picture3;
	}

	public void setPicture3(byte[] picture3) {
		this.picture3 = picture3;
	}

}
