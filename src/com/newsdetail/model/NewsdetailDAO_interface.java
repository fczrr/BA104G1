package com.newsdetail.model;

import java.util.List;

public interface NewsdetailDAO_interface {
	public void insert(NewsdetailVO newsdetailVO);
	public void update(NewsdetailVO newsdetailVO);
	public void delete(String newsno);
	public NewsdetailVO findByPrimaryKey(String newsno);
	public List<NewsdetailVO> getAll();
	public List<NewsdetailVO> getNewOnAll();
	public List<NewsdetailVO> getNewOffAll();

}
