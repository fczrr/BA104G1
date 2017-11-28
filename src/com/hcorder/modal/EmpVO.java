package com.hcorder.modal;
import java.io.Serializable;

public class EmpVO implements Serializable{
	private Integer empNo;
	private String empName;
	public EmpVO(){
		super();
	}
	public Integer getEmpNo() {
		return empNo;
	}
	public void setEmpNo(Integer empNo) {
		this.empNo = empNo;
	}
	public String getEmpName() {
		return empName;
	}
	public void setEmpName(String empName) {
		this.empName = empName;
	}
	

}
