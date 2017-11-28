package com.branches.model;

import java.util.List;

public interface BranchesDAO_interface {

    public void insert(BranchesVO branchesVO);
    public void update(BranchesVO branchesVO);

    public void delete(String empBranches);
    public BranchesVO findByPrimaryKey(String empBranches);
    public List<BranchesVO> getAll();

}
