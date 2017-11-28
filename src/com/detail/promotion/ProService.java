package com.detail.promotion;

import java.sql.Date;
import java.util.List;

import com.shop.model.ShopVO;



public class ProService {

	private ProDAO_interface dao;

	public ProService() {
		dao = new ProDAO();
	}

	
	public ProVO addPro(String NAME,Date BEGINDATE,Date ENDDATE) {
		
		ProVO proVO = new ProVO();
		proVO.setNAME(NAME);
		proVO.setBEGINDATE(BEGINDATE);
		proVO.setENDDATE(ENDDATE);
		dao.insert(proVO);
		return proVO;
	}

	public ProVO updateEmp(String NAME,int prono,int price, int itemno,Date BEGINDATE,Date ENDDATE) {
		ProVO proVO = new ProVO();
		proVO.setPROMOTIOMNO(prono);
		proVO.setPRICE(price);
		proVO.setITEMNO(itemno);
		proVO.setBEGINDATE(BEGINDATE);
		proVO.setENDDATE(ENDDATE);
		proVO.setNAME(NAME);
		dao.update(proVO);

		return proVO;
	}
	
	
	public void deleteEmp(Integer proVO) {
		dao.delete(proVO);
	}
	public ProVO getProProjectNow() {
		return dao.getProProjectNow();
	}

	//你好，我是update專用的
	public ProVO getOneEmp(Integer proVO) {
		return dao.findByPrimaryKey(proVO);
	}
	
	//你好，我是用專案編號去查詢的
	public ProVO getOneOnItemNO(int itemno){
		return dao.getOneOnItemNO(itemno);
	}
	//你好，我是用商品名稱去查詢的
	public ProVO getOneEmpForStringName(String actName){
		return dao.getOneEmpForStringName(actName);
	}
	//你好，我是用專案名稱去查詢的(所以會傳回很多個)
	public List<ProVO> getOneEmpbyString(String pk) {
		return  dao.findByPrimaryKeyByString(pk);
	}
	//你好，我是一次拿全部的促銷商品
	public List<ProVO> getAllProNow() {
		return dao.getAllProNow();
	}
	
	//你好，我是一次拿全部的促銷專案
	public List<ProVO> getAllPro() {
		return dao.getAllPro();
	}
	//你好，我是一次拿全部的促銷商品
	public List<ProVO> getAllProShop() {
		return dao.getAllProShop();
	}
	//你好，我是用商品編號拿當前促銷
	public ProVO getOneProShop(Integer itemno) {
		return dao.getOneProShop(itemno);
	}
	//你好，我是用商品編號拿當前促銷
	public void putShopInPromotion(Integer promotionno,Integer itemno,Integer price) {
		dao.putShopInPromotion(promotionno, itemno, price);
	}
	
}


