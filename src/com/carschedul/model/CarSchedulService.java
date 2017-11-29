package com.carschedul.model;

import java.sql.Date;
import java.util.List;

import com.employee.model.EmployeeService;
import com.employee.model.EmployeeVO;
import com.vehicle.model.VehicleVO;

public class CarSchedulService {

	private CarSchedul_interface dao;

	public CarSchedulService() {
		dao = new CarSchedulDAO();
	}

	public CarSchedulVO addCarSchedul(String emp_no,Date year_month,String attendance,Integer work_hours) {

		CarSchedulVO carschedulVO = new CarSchedulVO();
		
		carschedulVO.setEmp_no(emp_no);
		carschedulVO.setYear_month(year_month);
		carschedulVO.setAttendance(attendance);
		carschedulVO.setWork_hours(work_hours);
		dao.insert(carschedulVO);

		return carschedulVO;
	}

	public CarSchedulVO updateCarSchedul(String emp_no,Date year_month,String attendance,Integer work_hours) {

		CarSchedulVO carschedulVO = new CarSchedulVO();
		
		
		carschedulVO.setEmp_no(emp_no);
		carschedulVO.setYear_month(year_month);
		carschedulVO.setAttendance(attendance);
		carschedulVO.setWork_hours(work_hours);
		
		dao.update(carschedulVO);

		return carschedulVO;
	}

	public void deleteCarSchedul(Integer serial_no) {
		dao.delete(serial_no);
	}

	public CarSchedulVO getOneCarSchedul(Integer serial_no) {
		return dao.findByPrimaryKey(serial_no);
	}
	
	public CarSchedulVO findByEmpNo(String emp_no,Date year_month) {
		return dao.findByEmpNo(emp_no,year_month);
	}
		

	public List<CarSchedulVO> getAll() {
		return dao.getAll();
	}
	
	public List<CarSchedulVO> getMonthInfo(Integer cartype_no,Date year_month) {
		return dao.getMonthInfo(cartype_no,year_month);
	}
	
	public List<VehicleVO> getVehicleInfo(Integer cartype_no,Date year_month) {
		return dao.getVehicleVO(cartype_no,year_month);
	}
	
	public List<CarShiftVO> getCarShiftVO(Integer cartype_no,Date year_month) {
		return dao.getCarShiftVO(cartype_no,year_month);
	}
}
