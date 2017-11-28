package com.android.emp.model;

import java.util.List;

public interface HcEmpDAO_interface {
	public List<HcEmpVO> getAll();
	public byte[] getImgByEmpNo(String empNo);
	public HcWorkShiftsVO getShifts(String empNo,String monthOfYear);
	public List<HcWorkShiftsVO> getAllShifts(String empNo);
}
