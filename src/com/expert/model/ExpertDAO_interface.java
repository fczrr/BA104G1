package com.expert.model;

import java.util.List;

public interface ExpertDAO_interface {

    public void insert(ExpertVO expertVO);
    public void update(ExpertVO expertVO);
    public void delete(String exp_own);
    public ExpertVO findByPrimaryKey(String expOwn);
    public List<ExpertVO> getAll();
	List<ExpertVO> getAllByEMPNO(String empNo);
    
}
