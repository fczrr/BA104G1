package com.android.carType.model;

import java.util.List;

import com.android.vehicle.model.VehicleVO;

public class CarTypeService {
	private CarTypeDAO_interface dao ;
	public CarTypeService(){
		dao = new CarTypeDAO();
	}
	public List<CarTypeVO> getAll(){
		return dao.getAll();
	}
	public byte[] getImg(Integer carTypeNo){
		return dao.getCarPicByCarTypeNo(carTypeNo);
	}
	public List<VehicleVO> getVehicleVObyCarTypeNo(Integer carTypeNo){
		return dao.getVehicleVObyCarTypeNo(carTypeNo);
	}
	public CarTypeVO getByVehicleNo(Integer vehicleNo){
		return dao.getByVehicleNo(vehicleNo);
	}
	
	public byte[] getByCarEmpNo(String empNo) {
		return dao.getByCarEmpNo(empNo);
	}
	public CarTypeVO getOne(Integer carTypeNo) {
		return dao.getOne(carTypeNo);
	}
	
}
