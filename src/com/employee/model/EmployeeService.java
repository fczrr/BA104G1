package com.employee.model;

import java.util.List;

public class EmployeeService {
	private EmployeeDAO_interface dao;
	
	public EmployeeService(){
		 dao = new EmployeeDAO();
	}
	
	public EmployeeVO insert(EmployeeVO employeeVO){
		dao.insert(employeeVO);
		return employeeVO;
	}
	public void update(EmployeeVO employeeVO){
		dao.update(employeeVO);
	}
	
	public EmployeeVO findByPrimaryKey(String empNo){
		return dao.findByPrimaryKey(empNo);
	}
	
	public EmployeeVO findByEmpId(String empId){
		return dao.findByEmpId(empId);
	}
	
	public List<EmployeeVO> getAll(){
		return dao.getAll();
	}
	public List<EmployeeVO> getByDep(String empDep){
		return dao.getByDep(empDep);
	}
}
