package com.newsdetail.model;

import java.sql.*;
import java.util.*;

public class NewsdetailService {
	
	private NewsdetailDAO_interface dao;
	
	
	public NewsdetailService(){
		dao = new NewsdetailJNDIDAO();
	}
	
	public NewsdetailVO addNews(String newstitle, String newsintro, String empno, byte[] coverpic,  String status){
		NewsdetailVO newsdetailVO = new NewsdetailVO();
		newsdetailVO.setNewstitle(newstitle);
		newsdetailVO.setNewsintro(newsintro);
		newsdetailVO.setEmpno(empno);
		newsdetailVO.setCoverpic(coverpic);
		newsdetailVO.setStatus(status);
		dao.insert(newsdetailVO);
		
		return newsdetailVO;
	}
	
	
	public NewsdetailVO updateNews(String newsno, String newstitle, String newsintro, String empno, byte[] coverpic ,Timestamp newsdate, String status){
		NewsdetailVO newsdetailVO = new NewsdetailVO();
		newsdetailVO.setNewsno(newsno);
		newsdetailVO.setNewstitle(newstitle);
		newsdetailVO.setNewsintro(newsintro);
		newsdetailVO.setEmpno(empno);
		newsdetailVO.setCoverpic(coverpic);
		newsdetailVO.setNewsdate(newsdate);
		newsdetailVO.setStatus(status);
		dao.update(newsdetailVO);
		return newsdetailVO;
	}
	
	public void deleteNews(String newsno){
		dao.delete(newsno);
	}
	
	public NewsdetailVO getOneNews(String newsno){
		return dao.findByPrimaryKey(newsno);
	}
	
	public List<NewsdetailVO> getAll(){
		return dao.getAll();
	}
	public List<NewsdetailVO> getNewOnAll(){
		return dao.getNewOnAll();
	}

	public List<NewsdetailVO> getNewOffAll() {
		return dao.getNewOffAll();
	}
	

}
