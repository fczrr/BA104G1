package com.employee.model;

import java.util.List;

import com.member.model.MemberVO;

public interface EmployeeDAO_interface {
	public void insert(EmployeeVO employeeVO);
	public void update(EmployeeVO employeeVO);
	public EmployeeVO findByPrimaryKey(String empNo);
	public EmployeeVO findByEmpId(String empId);
	public List<EmployeeVO> getByDep(String empDep);
	public List<EmployeeVO> getAll();
}
