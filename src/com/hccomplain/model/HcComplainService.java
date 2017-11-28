package com.hccomplain.model;

import java.sql.Timestamp;
import java.util.List;

public class HcComplainService {
	
	public HcComplainDAO_interface dao;
	
	public HcComplainService(){
		dao = new HcComplainJNDIDAO();
	}
	
	public HcComplainVO addHcCom(String order_no, String complainDetail, String complainStatus){
		HcComplainVO hcComplainVO = new HcComplainVO();
		hcComplainVO.setOrder_no(order_no);
		hcComplainVO.setComplainDetail(complainDetail);
		hcComplainVO.setComplainStatus(complainStatus);
		dao.insert(hcComplainVO);
		return hcComplainVO;
	}
	
	
	public HcComplainVO updateHcCom(String complainNo, String complainReply, Timestamp replyDate ,String emp_no, String complainStatus){
		HcComplainVO hcComplainVO = new HcComplainVO();
		hcComplainVO.setComplainNo(complainNo);
		hcComplainVO.setComplainReply(complainReply);
		hcComplainVO.setReplyDate(replyDate);
		hcComplainVO.setEmp_no(emp_no);
		hcComplainVO.setComplainStatus(complainStatus);
		dao.update(hcComplainVO);
		return hcComplainVO;
	}
	
	public void deleteHcCom(String complainNo){
		dao.delete(complainNo);
	}
	
	public HcComplainVO getOneHcCom(String complainNo){
		return dao.findByPrimaryKey(complainNo);
	}
	
	public HcComplainVO getByStatus(String complainStatus){
		return dao.findByStatus(complainStatus);
	}
	
	public List<HcComplainVO> getAll(){
		return dao.getAll();
	}
	
	
}
