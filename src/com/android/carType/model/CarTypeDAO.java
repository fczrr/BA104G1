package com.android.carType.model;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.NamingException;
import javax.sql.*;

import com.android.vehicle.model.VehicleVO;


public class CarTypeDAO implements CarTypeDAO_interface{
	private static  DataSource ds = null;
	
	private static final String GET_ALL = "SELECT * FROM CARTYPE";
	private static final String GET_GG = "SELECT * FROM CARTYPE WHERE CARTYPE_NO = ?";
	private static final String GET_PIC = "SELECT CAR_PIC FROM CARTYPE WHERE CARTYPE_NO=?";
	private static final String GET_VEHICLE = "SELECT * FROM VEHICLE WHERE CARTYPE_NO=?";
	private static final String GETCARTYPE = "SELECT * FROM CARTYPE JOIN VEHICLE ON VEHICLE.CARTYPE_NO = CARTYPE.CARTYPE_NO WHERE VEHICLE.VEHICLE_NO=?";
	static{
		try {
			Context ctx = new javax.naming.InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/BA104G1DB");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	
	
	@Override
	public List<CarTypeVO> getAll() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<CarTypeVO> carList = new ArrayList<>();
		
		try {
			con = ds.getConnection();
			pstmt=  con.prepareStatement(GET_ALL);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				
				CarTypeVO  carType = new CarTypeVO();
				carType.setCarTypeNo(rs.getInt("CARTYPE_NO"));
				carType.setCarTypeName(rs.getString("CARTYPE_NAME"));
				carType.setDescription(rs.getString("DESCRIPTION"));
				carType.setRentalRates(rs.getInt("RENTAL_RATES"));
				
				carList.add(carType);
			}
			return carList;
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			if(con!=null){
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return carList;
	}

	@Override
	public byte[] getCarPicByCarTypeNo(Integer carTypeNo) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		byte[] pic = null;
		try {
			con = ds.getConnection();
			pstmt=  con.prepareStatement(GET_PIC);
			pstmt.setInt(1, carTypeNo);
			rs = pstmt.executeQuery();
			if(rs.next()){
				pic = rs.getBytes("CAR_PIC");
			}
			return pic;
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			if(con!=null){
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return pic;
	}

	@Override
	public List<VehicleVO> getVehicleVObyCarTypeNo(Integer carTypeNo) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<VehicleVO> vehicleList = null;
		try {
			con = ds.getConnection();
			pstmt  = con.prepareStatement(GET_VEHICLE);
			pstmt.setInt(1, carTypeNo);
			rs = pstmt.executeQuery();
			vehicleList = new ArrayList<>();
			while(rs.next()){
				VehicleVO vehicle = new VehicleVO();
				vehicle.setEmpNo(rs.getString("EMP_NO"));
				vehicle.setVehicleNo(rs.getInt("VEHICLE_NO"));
				vehicleList.add(vehicle);
			}
			System.out.println("查詢派車人員by車型");
			return vehicleList;
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			if(con!=null){
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return vehicleList;
	}

	@Override
	public CarTypeVO getByVehicleNo(Integer vehicleNo) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		CarTypeVO car = null;
		
		try {
			con = ds.getConnection();
			pstmt=  con.prepareStatement(GETCARTYPE);
			pstmt.setInt(1, vehicleNo);
			rs = pstmt.executeQuery();
			if(rs.next()){
				car = new CarTypeVO();
				car.setCarTypeNo(rs.getInt("CARTYPE_NO"));
				car.setCarTypeName(rs.getString("CARTYPE_NAME"));
				car.setDescription(rs.getString("DESCRIPTION"));
				car.setRentalRates(rs.getInt("RENTAL_RATES"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			if(con!=null){
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return car;
	}
	private static final String GET_CAR_EMP = "SELECT EMP_PHOTO FROM EMP_PHOTOS WHERE EMP_NO =? AND EMP_PHOTO_STATUS='T' ";
	@Override
	public byte[] getByCarEmpNo(String empNo) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		byte[] pic = null;
		try {
			con = ds.getConnection();
			pstmt=  con.prepareStatement(GET_CAR_EMP);
			pstmt.setString(1, empNo);
			rs = pstmt.executeQuery();
			if(rs.next()){
				pic = rs.getBytes("EMP_PHOTO");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			if(con!=null){
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return pic;
	}

	@Override
	public CarTypeVO getOne(Integer carTypeNo) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		CarTypeVO carType = null;
		
		try {
			con = ds.getConnection();
			pstmt=  con.prepareStatement(GET_GG);
			pstmt.setInt(1, carTypeNo);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				carType= new CarTypeVO();
				carType.setCarTypeNo(rs.getInt("CARTYPE_NO"));
				carType.setCarTypeName(rs.getString("CARTYPE_NAME"));
				carType.setDescription(rs.getString("DESCRIPTION"));
				carType.setRentalRates(rs.getInt("RENTAL_RATES"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			if(con!=null){
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return carType;
	}
}
