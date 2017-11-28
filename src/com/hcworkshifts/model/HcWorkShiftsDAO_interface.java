package com.hcworkshifts.model;

import java.util.List;
import java.util.Map;

public interface HcWorkShiftsDAO_interface {
	public void insert(HcWorkShiftsVO hcWorkShifts); 
	public void update(HcWorkShiftsVO hcWorkShifts); 
	public HcWorkShiftsVO findByPrimarykey(String monthOfYear ,String empNo);
	public List<HcWorkShiftsVO> getAllByDateTime (String yearOfMonth, String shiftNumber);
	public List<HcWorkShiftsVO> getAll();
	public List<HcWorkShiftsVO> getAll(Map map);
	public HcWorkShiftsVO getOneByDateTime (String yearOfMonth, String shiftNumber);

}
