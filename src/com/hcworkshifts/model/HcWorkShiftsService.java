package com.hcworkshifts.model;

import java.util.List;
import java.util.Map;

public class HcWorkShiftsService {
	private HcWorkShiftsDAO_interface dao;
	public HcWorkShiftsService(){
		dao = new HcWorkShiftsJDBCDAO();
	}
	
	public HcWorkShiftsVO addHcWorkShifts (String monthOfYear,String empNo,
			String workShiftStatus,Integer totalWorkShifts){
		HcWorkShiftsVO hcWorkShifts = new HcWorkShiftsVO();
		hcWorkShifts.setMonthOfYear(monthOfYear);
		hcWorkShifts.setEmpNo(empNo);
		hcWorkShifts.setWorkShiftStatus(workShiftStatus);
		hcWorkShifts.setTotalWorkShifts(totalWorkShifts);
		dao.insert(hcWorkShifts);
		return hcWorkShifts;		
	}
	
	public HcWorkShiftsVO updateHcWorkShifts (String monthOfYear,String empNo,
			String workShiftStatus){
		HcWorkShiftsVO hcWorkShifts = new HcWorkShiftsVO();
		hcWorkShifts.setMonthOfYear(monthOfYear);
		hcWorkShifts.setEmpNo(empNo);
		hcWorkShifts.setWorkShiftStatus(workShiftStatus);
		hcWorkShifts.setTotalWorkShifts(countWorkShifts(workShiftStatus));
		dao.update(hcWorkShifts);
		
		return hcWorkShifts;
	}
	
	public HcWorkShiftsVO getOne(String monthOfYear,String empNo){
		System.out.println("wsv getone");
		return dao.findByPrimarykey(monthOfYear, empNo);

	}
	
	public List<HcWorkShiftsVO> getAll(){
		return dao.getAll();
	}
	
	public List<HcWorkShiftsVO> getAll(Map map){

		return dao.getAll(map);
	}
	
	
	public List<HcWorkShiftsVO> getAllByDateTime(String servdate, String servTime){
		String[] servdates = convertDateToNumber(servdate,servTime);
		return dao.getAllByDateTime(servdates[0], servdates[1]);
	}
	
	
	public HcWorkShiftsVO getOneByDateTime(String servdate, String servTime){
		String[] servdates = convertDateToNumber(servdate,servTime);
		return dao.getOneByDateTime(servdates[0], servdates[1]);
	}
	
	static int countWorkShifts(String workShiftStr){
		int count = 0;
		for(int i=0;i<workShiftStr.length();i++){
			//day mid night
			if(workShiftStr.charAt(i) == '\u65e9'|| workShiftStr.charAt(i) =='\u4e2d'|| workShiftStr.charAt(i) =='\u665a'){
				count++;
			}
		}		
		return count;		
	}
	//2017-11-20  早  中  
	public static String[] convertDateToNumber(String servdate,String servTime){
	System.out.println(servdate);
	System.out.println(servTime);
		String[] listS = new String[2];
		//轉換成10611格式
		String monthOfYear = (Integer.valueOf(servdate.substring(0,4))-1911)+servdate.substring(5,7);
		listS[0] = monthOfYear;
		//轉換成當月班次
		String day="";
		if(	servdate.length() == 10){
			day = servdate.substring(8,10);
		}else{
			day = "0"+servdate.substring(8,9);
		}

		int shiftNumber = (Integer.valueOf(day)*3);
		if(servTime.equals("\u65e9")){
			shiftNumber = shiftNumber-2;
		}else if(servTime.equals("\u4e2d")){
			shiftNumber = shiftNumber-1;
		}
		
		
//		else if(time.equals("\u665a")){
//			shiftNumber = shiftNumber;
//		}
		listS[1] = String.valueOf(shiftNumber);
		return listS;
	}

}
