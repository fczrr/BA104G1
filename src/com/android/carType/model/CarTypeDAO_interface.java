package com.android.carType.model;

import java.util.List;

import com.android.vehicle.model.VehicleVO;

public interface CarTypeDAO_interface {
	public List<CarTypeVO> getAll();
	public byte[] getCarPicByCarTypeNo(Integer carTypeNo);
	public List<VehicleVO> getVehicleVObyCarTypeNo(Integer carTypeNo);
	public CarTypeVO getByVehicleNo(Integer vehicleNo);
	public byte[] getByCarEmpNo(String empNo);
	public CarTypeVO getOne(Integer carTypeNo);
}	
