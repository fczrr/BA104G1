package com.shop.model;

import java.util.List;

public class ShopService {
	private ShopDAO_interface dao;

	public ShopService() {
		dao = new ShopJNDIDAO();
	}

	public ShopVO addEmp(int ITEMNO, int STOCK, int PRICE, int STATE, int CLASSNO, String NAME, String DES) {

		ShopVO empVO = new ShopVO();
		empVO.setITEMNO(ITEMNO);
		empVO.setSTOCK(STOCK);
		empVO.setPRICE(PRICE);
		empVO.setSTATE(STATE);
		empVO.setCLASSNO(CLASSNO);
		empVO.setNAME(NAME);
		empVO.setDES(DES);
		dao.insert(empVO);
		return empVO;
	}

	public ShopVO updateEmp(int ITEMNO, int STOCK, int PRICE, String NAME, String DES) {

		ShopVO empVO = new ShopVO();
		empVO.setITEMNO(ITEMNO);
		empVO.setSTOCK(STOCK);
		empVO.setPRICE(PRICE);
		empVO.setNAME(NAME);
		empVO.setDES(DES);
		dao.update2(empVO);
		return empVO;
	}

	public void changeState(Integer itemno, Integer state) {
		dao.changeState(itemno, state);
	}

	public void deleteEmp(Integer shopNO) {
		dao.delete(shopNO);
	}

	public ShopVO getOneEmp(Integer shopNO) {
		return dao.findByPrimaryKey(shopNO);
	}

	public ShopVO getOneEmpbyString(String shopNO) {
		return dao.findByPrimaryKeyByString(shopNO);
	}

	public List<ShopVO> findByPrimaryKeyByString2(String pkName) {
		return dao.findByPrimaryKeyByString2(pkName);
	}
	
	public List<ShopVO> getAll() {
		return dao.getAll();
	}

	public List<ShopVO> getAllFromBack() {
		return dao.getAllFromBack();
	}
	public void deleteProShop(Integer itemno,Integer promotiomno) {
		dao.deleteProShop(itemno, promotiomno);
	}
}