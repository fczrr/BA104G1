package com.android.carSchedul.model;

import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.*;

public class CarSchedulDAO implements CarSchedulDAO_interface{
	private static DataSource ds;
	private static final String GET_ALL="SELECT * FROM CAR_SCHEDUL";
	private static final String UPDATE="UPDATE CAR_SCHEDUL SET ATTENDANCE = ? WHERE SERIAL_NO=?";
	private static final String GET_BY_EMP_NO = "SELECT YEAR_MONTH,ATTENDANCE,WORK_HOURS FROM CAR_SCHEDUL WHERE EMP_NO = ? and YEAR_MONTH = TO_DATE(?,'YYYY/MM') ";
	
	
	static{
		try {
			Context ctx = new javax.naming.InitialContext();
			ds =(DataSource) ctx.lookup("java:comp/env/jdbc/BA104G1DB");
		} catch (NamingException e) {
			e.printStackTrace();
		}
		
	}
	
	@Override
	public List<CarSchedulVO> getAll() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<CarSchedulVO> schedulList = null;
		
		try {
			con = ds.getConnection();
			pstmt= con.prepareStatement(GET_ALL);
			rs = pstmt.executeQuery();
			schedulList = new ArrayList<>();
			while(rs.next()){
				CarSchedulVO carSchedulVO = new CarSchedulVO();
				carSchedulVO.setSerialNo(rs.getInt("SERIAL_NO"));
				carSchedulVO.setEmpNo(rs.getString("EMP_NO"));
				carSchedulVO.setYearMonth(rs.getDate("YEAR_MONTH"));
				carSchedulVO.setAttendance(rs.getString("ATTENDANCE"));
				carSchedulVO.setWorkHours(rs.getInt("WORK_HOURS"));
				schedulList.add(carSchedulVO);
			}
			return schedulList;
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
		return schedulList;
	}

	@Override
	public void update(CarSchedulVO carSchedulVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = ds.getConnection();
			pstmt= con.prepareStatement(UPDATE);
			pstmt.setString(1, carSchedulVO.getAttendance());
			pstmt.setInt(2, carSchedulVO.getSerialNo());
			int i = pstmt.executeUpdate();
			System.out.println("成功更新一筆派車班表");
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
	}

	@Override
	public List<CarSchedulVO> getByEmpNo(String empNo,String date) {
		Connection con = null;
		PreparedStatement pstmt =null;
		ResultSet rs = null;
		List<CarSchedulVO> carSchedulList = null;
		
		try {
			con=  ds.getConnection();
			pstmt = con.prepareStatement(GET_BY_EMP_NO);
			pstmt.setString(1, empNo);
			pstmt.setString(2, date);
			rs = pstmt.executeQuery();
			carSchedulList = new ArrayList<>();
			while(rs.next()){
				CarSchedulVO carSchedul = new CarSchedulVO();
				carSchedul.setEmpNo(empNo);
				carSchedul.setSerialNo(rs.getInt("SERIAL_NO"));
				carSchedul.setYearMonth(rs.getDate("YEAR_MONTH"));
				carSchedul.setAttendance(rs.getString("ATTENDANCE"));
				carSchedul.setWorkHours(rs.getInt("WORK_HOURS"));
				carSchedulList.add(carSchedul);
			}
			return carSchedulList;
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
		return carSchedulList;
	}
}
