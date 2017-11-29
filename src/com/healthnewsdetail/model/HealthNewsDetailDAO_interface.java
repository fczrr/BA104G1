package com.healthnewsdetail.model;

import java.util.List;

public interface HealthNewsDetailDAO_interface {
	public void insert(HealthNewsDetailVO healthNewsDetailVO);
	public void update(HealthNewsDetailVO healthNewsDetailVO);
	public void delete(String healthNo);
	public HealthNewsDetailVO findByPrimaryKey(String healthNo);
	public List<HealthNewsDetailVO> getAll();
	public List<HealthNewsDetailVO> getNewOnAll();
	public List<HealthNewsDetailVO> getNewOffAll();

}
