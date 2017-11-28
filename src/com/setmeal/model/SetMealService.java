package com.setmeal.model;

import java.util.List;

public class SetMealService {
	private SetMealDAO_interface dao;

	public SetMealService() {
		dao = new SetMealDAO();
	}

	public SetMealVO addSetMeal(String smName, Integer smPrice, Integer supply, byte[] smPic1, byte[] smPic2,
			byte[] smPic3, String smIntro) {

		SetMealVO setMealVO = new SetMealVO();

		setMealVO.setSmName(smName);
		setMealVO.setSmPrice(smPrice);
		setMealVO.setSupply(supply);
		setMealVO.setSmPic1(smPic1);
		setMealVO.setSmPic2(smPic2);
		setMealVO.setSmPic3(smPic3);
		setMealVO.setSmIntro(smIntro);
		dao.insert(setMealVO);

		return setMealVO;
	}

	public SetMealVO updateSetMeal(Integer smNo, String smName, Integer smPrice, Integer supply, byte[] smPic1,
			byte[] smPic2, byte[] smPic3, String smIntro) {

		SetMealVO setMealVO = new SetMealVO();

		setMealVO.setSmNo(smNo);
		setMealVO.setSmName(smName);
		setMealVO.setSmPrice(smPrice);
		setMealVO.setSupply(supply);
		setMealVO.setSmPic1(smPic1);
		setMealVO.setSmPic2(smPic2);
		setMealVO.setSmPic3(smPic3);
		setMealVO.setSmIntro(smIntro);
		dao.update(setMealVO);

		return setMealVO;
	}

	public void deleteSetMeal(Integer smNo) {
		dao.delete(smNo);
	}

	public SetMealVO getOneSetMeal(Integer smNo) {
		return dao.findByPrimaryKey(smNo);
	}

	public List<SetMealVO> getAll() {
		return dao.getAll();
	}

}
