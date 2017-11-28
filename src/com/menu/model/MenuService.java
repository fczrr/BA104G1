package com.menu.model;

import java.util.List;

public class MenuService {
	private MenuDAO_interface dao;

	public MenuService() {
		dao = new MenuDAO();
	}

	public void addMenu(MenuVO menuVO) {
		dao.insert(menuVO);
	}

	public List<MenuVO> getAll(Integer smNo) {
		return dao.getAll(smNo);
	}

	public void delete(Integer smNo) {
		dao.delete(smNo);
	}
}
