package com.hcorder.modal;

import java.sql.Date;
import java.text.DateFormat;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class HcOrderMasterService {
	private HcOrderMasterDAO_interface dao ;
	
	public HcOrderMasterService(){
		dao = new HcOrderJDBCDAO();
	}
	
	public List<HcOrderMasterVO> getByMemNo(String memNo){
		return dao.getByMemNo(memNo);
	}
	
	
	
	public HcOrderMasterVO addHcOrderMaster(String memNo, String caredNo, String orderStatus,
			Date serviceDate,String serviceTime,String empNo ){
		
		HcOrderMasterVO hcOrderMaster = new HcOrderMasterVO();
		hcOrderMaster.setMemNo(memNo);
		hcOrderMaster.setOrderDate(new Date(System.currentTimeMillis()));
		hcOrderMaster.setCaredNo(caredNo);
		hcOrderMaster.setOrderStatus(orderStatus);
		
		List<HcOrderDetailVO> hcOrderDetailList =  new ArrayList<HcOrderDetailVO>();
		HcOrderDetailVO hcOrderDetail = new HcOrderDetailVO();
		hcOrderDetail.setServiceDate(serviceDate);
		hcOrderDetail.setServiceTime(serviceTime);
		hcOrderDetail.setEmpNo(empNo);
		hcOrderDetail.setOrderDetailStataus("未服務");
		hcOrderDetailList.add(hcOrderDetail);
	System.out.println("svc bf "+empNo);	
		String orderNo =  dao.insert(hcOrderMaster , hcOrderDetailList);
	System.out.println("svc af "+orderNo);
		hcOrderMaster.setOrderNo(orderNo);
		return hcOrderMaster;
		
	}
	
	public HcOrderMasterVO addHcOrderMaster(HcOrderMasterVO hcOrderMaster,List<HcOrderDetailVO> hcOrderDetailList){
				
		String orderNo =  dao.insert(hcOrderMaster , hcOrderDetailList);
		System.out.println("svc  "+orderNo);
		hcOrderMaster.setOrderNo(orderNo);
		return hcOrderMaster;
		
	}
	
	
	public HcOrderMasterVO updateHcOrderMaster(String orderNo, String memNo, Date orderDate,
			String caredNo, String orderStatus){
		HcOrderMasterVO hcOrderMaster = new HcOrderMasterVO();
		hcOrderMaster.setOrderNo(orderNo);
		hcOrderMaster.setMemNo(memNo);
		hcOrderMaster.setOrderDate(orderDate);
		hcOrderMaster.setCaredNo(caredNo);
		hcOrderMaster.setOrderStatus(orderStatus);
		dao.update(hcOrderMaster);
		return hcOrderMaster;
	}
	
	
	
	
	public HcOrderMasterVO updateHcOrderMaster(String orderNo, String memNo, String date,
			String caredNo, String orderStatus){
		HcOrderMasterVO hcOrderMaster = new HcOrderMasterVO();
		hcOrderMaster.setOrderNo(orderNo);
		hcOrderMaster.setMemNo(memNo);		
		hcOrderMaster.setOrderDate(turnStrdateToSqldate(date));
		hcOrderMaster.setCaredNo(caredNo);
		hcOrderMaster.setOrderStatus(orderStatus);
		dao.update(hcOrderMaster);
		return hcOrderMaster;
	}
	
	public HcOrderMasterVO getOne(String orderNo){
		return dao.findByPrimaryKey(orderNo);
		
	}
	
	public List<HcOrderMasterVO> getAll(){
		return dao.getAll();
	}
	
	public List<HcOrderMasterVO> getAll(Map map){
		return dao.getAll(map);
	}
	
	
	
	
	
	
	public Date turnStrdateToSqldate(String date){
		Date orderDate = null;
		try {
			orderDate = new Date(DateFormat.getDateInstance().parse(date).getTime());
			
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return orderDate;
	}
	
}
