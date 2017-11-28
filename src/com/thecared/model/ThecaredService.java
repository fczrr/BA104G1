package com.thecared.model;


import java.util.List;
import java.sql.*;


public class ThecaredService {

	private ThecaredDAO_interface dao;

	public ThecaredService() {
		dao = new ThecaredJNDIDAO();
	}
	public ThecaredVO addTHECARED(ThecaredVO thecaredVO){
		dao.insert(thecaredVO);
		return thecaredVO;
	}
	public ThecaredVO addTHECARED(
			String memNo, 
			String caredNo,
			String caredName,
			String caredGender,
			String kinship,
			Integer caredHeight,
			Integer caredWeight,
			String caredAddress,
			String caredPhone,
			String conStatus,
			String bioStatus,
			Timestamp modifyTime) {

		ThecaredVO thecaredVO = new ThecaredVO();
		
		thecaredVO.setMemNo(memNo);
		thecaredVO.setCaredNo(caredNo);
		thecaredVO.setCaredName(caredName);
		thecaredVO.setCaredGender(caredGender);
		thecaredVO.setKinship(kinship);
		thecaredVO.setCaredHeight(caredHeight);
		thecaredVO.setCaredWeight(caredWeight);
		thecaredVO.setCaredAddress(caredAddress);
		thecaredVO.setCaredPhone(caredPhone);
		thecaredVO.setConStatus(conStatus);
		thecaredVO.setBioStatus(bioStatus);
		thecaredVO.setModifyTime(modifyTime);
		
		dao.insert(thecaredVO);

		return thecaredVO;
	}

	public ThecaredVO updateTHECARED(ThecaredVO thecaredVO){
		dao.update(thecaredVO);
		return thecaredVO;
	}
	public ThecaredVO updateTHECARED(
			String caredName,
			Integer caredWeight,
			String caredAddress,
			String caredPhone,
			String conStatus,
			String bioStatus,
			String caredNo
			) {

		ThecaredVO thecaredVO = new ThecaredVO();
		thecaredVO.setCaredName(caredName);
		thecaredVO.setCaredWeight(caredWeight);
		thecaredVO.setCaredAddress(caredAddress);
		thecaredVO.setCaredPhone(caredPhone);
		thecaredVO.setConStatus(conStatus);
		thecaredVO.setBioStatus(bioStatus);
		thecaredVO.setCaredNo(caredNo);
		dao.update(thecaredVO);

		return thecaredVO;
	}

	public void deleteTHECARED(String caredNo) {
		dao.delete(caredNo);
	}

	public ThecaredVO getOneTHECARED(String caredNo) {
		return dao.findByPrimaryKey(caredNo);
	}
	
	public List<ThecaredVO> getAllByMemNo(String MemNo) {
		return dao.getAllByMemNo(MemNo);
	}

	public List<ThecaredVO> getAll() {
		return dao.getAll();
	}
}
