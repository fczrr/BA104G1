package com.expertlist.model;

import java.util.List;

public interface ExpertlistDAO_interface {

    public void insert(ExpertlistVO expertlistVO);
    public void update(ExpertlistVO expertlistVO);

    public void update( String expName, String expSpec, Integer expPrice, String expNo) ;
    public void delete(String exp_no);
    public ExpertlistVO findByPrimaryKey(String expNo);
    public List<ExpertlistVO> getAll();
    
}
