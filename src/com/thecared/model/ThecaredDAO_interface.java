package com.thecared.model;

import java.util.List;



public interface ThecaredDAO_interface {

    public void insert(ThecaredVO thecaredVO);
    public void update(ThecaredVO thecaredVO);
    public void delete(String caredNo);
    public ThecaredVO findByPrimaryKey(String caredNo);
    public List<ThecaredVO> getAllByMemNo(String MemNo);
    public List<ThecaredVO> getAll();
}
