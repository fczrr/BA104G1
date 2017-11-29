package com.dish.model;

import java.util.List;

public class DishService {
	private DishDAO_interface dao;

	public DishService() {
		dao = new DishDAO();
	}

	public DishVO addDish(String dishName, byte[] dishPic, String dishIntro, String dishType) {

		DishVO dishVO = new DishVO();

		dishVO.setDishName(dishName);
		dishVO.setDishPic(dishPic);
		dishVO.setDishIntro(dishIntro);
		dishVO.setDishType(dishType);
		dao.insert(dishVO);

		return dishVO;
	}

	public DishVO updateDish(Integer dishNo, String dishName, byte[] dishPic, String dishIntro, String dishType) {

		DishVO dishVO = new DishVO();

		dishVO.setDishNo(dishNo);
		dishVO.setDishName(dishName);
		dishVO.setDishPic(dishPic);
		dishVO.setDishIntro(dishIntro);
		dishVO.setDishType(dishType);
		dao.update(dishVO);

		return dishVO;
	}

	public DishVO getOneDish(Integer dishNo) {
		return dao.findByPrimaryKey(dishNo);
	}

	public List<DishVO> getAll() {
		return dao.getAll();
	}

	public List<DishVO> getByType(String dishType) {
		return dao.getByType(dishType);
	}

	public void deleteDish(Integer dishNo) {
		dao.delete(dishNo);
	}
}
