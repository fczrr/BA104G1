package com.hccomplain.model;

import java.util.List;

import com.carcomplain.model.CarComplainVO;


public interface HcComplainDAO_interface {
	public void insert(HcComplainVO hcComplainVO);
	public void update(HcComplainVO hcComplainVO);
	public void delete(String complainNo);
	public HcComplainVO findByPrimaryKey(String complainNo);
	public HcComplainVO findByStatus(String complainStatus);
	public List<HcComplainVO> getAll();
	public List<HcComplainVO> getOffAll();
	public List<HcComplainVO> getOnAll();

}
