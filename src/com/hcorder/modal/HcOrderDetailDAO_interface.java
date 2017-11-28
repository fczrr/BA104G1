package com.hcorder.modal;

import java.util.List;

import com.hcworkshifts.model.HcWorkShiftsVO;



public interface HcOrderDetailDAO_interface {
    public void insert(HcOrderDetailVO hcOrderDetailVO);
    public void update(HcOrderDetailVO hcOrderDetailVO);    
    public HcOrderDetailVO findByPrimaryKey(String orderDatailNo);
    public List<HcOrderDetailVO> getAllByOrderNo(String orderNo);
    public List<HcOrderDetailVO> getAll();
    public List<HcOrderDetailVO> getAllOneMonth(Integer month);
    public List<HcOrderDetailVO> getAllBySreviceDate(String date);
    public List<HcOrderDetailVO> getAllBySreviceTime(String date , String time);
    public List<HcOrderDetailVO> getAllOneMonthInPerson(Integer month , String empNo);
    public List<HcOrderDetailVO> getAllBySreviceDateInPerson(String date, String empNo);
    public HcOrderDetailVO getAllBySreviceTimeInPerson(String date , String time,String empNo);
	void updateAll(List<HcOrderDetailVO> hcOrderDetailVOList, HcWorkShiftsVO hcWorkShiftsVO);

}
