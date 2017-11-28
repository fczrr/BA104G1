package com.hcorder.modal;

import java.util.List;
import java.util.Map;



public interface HcOrderMasterDAO_interface {
    public String insert(HcOrderMasterVO hcOrderMasterVO,List<HcOrderDetailVO> list);
    public void update(HcOrderMasterVO hcOrderMasterVO);
    public HcOrderMasterVO findByPrimaryKey(String OrderNo);
    public List<HcOrderMasterVO> getAll();
    public List<HcOrderMasterVO> getAll(Map map);
    public List<HcOrderMasterVO> getByMemNo(String memNo);
    
    
}
