package com.android.emp.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.android.carSchedul.model.CarSchedulVO;

public class HcEmpDAO implements HcEmpDAO_interface{
	
	private static DataSource ds;
	private static final String GET_ALL="SELECT EMP_NO,EMP_NAME FROM EMPLOYEE WHERE EMP_DEP='長照'";
	private static final String GET_EXP = "SELECT EXPERT.EXP_NO,EXP_NAME,EXP_SPEC FROM EXPERT_LIST FULL JOIN EXPERT ON EXPERT_LIST.EXP_NO = EXPERT.EXP_NO "
			+ "WHERE EMP_NO= ? ";
	private static final String GET_IMG = "SELECT EMP_PHOTO FROM EMP_PHOTOS WHERE EMP_NO = ? AND ROWNUM<=1 ";
	private static final String GET_SHIFT = "SELECT EMP_NO,MONTH_OF_YEAR,WORK_SHIFT_STATUS,TOTAL_WORK_SHIFTS FROM HC_WORKSHIFTS WHERE EMP_NO = ? and MONTH_OF_YEAR = ?";
	private static final String GET_ALL_SHIFT = "SELECT EMP_NO,MONTH_OF_YEAR,WORK_SHIFT_STATUS,TOTAL_WORK_SHIFTS FROM HC_WORKSHIFTS WHERE EMP_NO = ?";
	
	static{
		try {
			Context ctx = new javax.naming.InitialContext();
			ds =(DataSource) ctx.lookup("java:comp/env/jdbc/BA104G1DB");
		} catch (NamingException e) {
			e.printStackTrace();
		}
		
	}
	
	@Override
	public List<HcEmpVO> getAll() {
		Connection con = null;
		PreparedStatement pstmt =null;
		ResultSet rs = null;
		List<HcEmpVO> hcEmpList = null;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL);
			rs = pstmt.executeQuery();
			hcEmpList = new ArrayList<>();
			while(rs.next()){
				HcEmpVO hcEmp = new HcEmpVO();
				hcEmp.setEmpNo(rs.getString("EMP_NO"));
				hcEmp.setEmpName(rs.getString("EMP_NAME"));
				hcEmpList.add(hcEmp);
				System.out.println("成功查詢長照人員編號姓名");
			}
			for(HcEmpVO hcEmpVO:hcEmpList){
				List<ExpertVO> expList = new ArrayList<>();
				hcEmpVO.setExpertList(expList);
				
				pstmt = con.prepareStatement(GET_EXP);
				pstmt.setString(1, hcEmpVO.getEmpNo());
				rs = pstmt.executeQuery();
				while(rs.next()){
					expList.add(new ExpertVO(rs.getString("EXP_NO"),rs.getString("EXP_NAME"),rs.getString("EXP_SPEC")));
					System.out.println("成功新增長照專長");
				}
			}
			return hcEmpList;
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
		return hcEmpList;
	}
	
	@Override
	public byte[] getImgByEmpNo(String empNo) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		byte[] img = null;		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_IMG);
			pstmt.setString(1, empNo);
			rs = pstmt.executeQuery();
			if(rs.next()){
				img = rs.getBytes("EMP_PHOTO");
				System.out.println("成功讀取長照員工圖片");
			}
			return img;
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
		return img;
	}

	@Override
	public HcWorkShiftsVO getShifts(String empNo, String monthOfYear) {
		Connection con = null;
		PreparedStatement pstmt =null;
		ResultSet rs = null;
		HcWorkShiftsVO hcWorkShiftsVO = null;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_SHIFT);
			pstmt.setString(1, empNo);
			pstmt.setString(2, monthOfYear);
			rs = pstmt.executeQuery();
			if(rs.next()){
				hcWorkShiftsVO = new HcWorkShiftsVO(monthOfYear,empNo,rs.getString("WORK_SHIFT_STATUS"),rs.getInt("TOTAL_WORK_SHIFTS"));
				System.out.println("成功查詢個人單一長照班表");
			}
			return hcWorkShiftsVO;
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
		return hcWorkShiftsVO;
	}

	@Override
	public List<HcWorkShiftsVO> getAllShifts(String empNo) {
		
			Connection con = null;
			PreparedStatement pstmt =null;
			ResultSet rs = null;
			List<HcWorkShiftsVO> hcWorkshiftList = null;
			
			try {
				con = ds.getConnection();
				pstmt = con.prepareStatement(GET_SHIFT);
				pstmt.setString(1, empNo);
				rs = pstmt.executeQuery();
				hcWorkshiftList = new ArrayList<>();
				while(rs.next()){
					HcWorkShiftsVO hcWorkShiftsVO = new HcWorkShiftsVO(rs.getString("MONTH_OF_YEAR"),empNo,rs.getString("WORK_SHIFT_STATUS"),rs.getInt("TOTAL_WORK_SHIFTS"));
					hcWorkshiftList.add(hcWorkShiftsVO);
					System.out.println("成功查詢個人全部長照班表");
				}
				return hcWorkshiftList;
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
			return hcWorkshiftList;
	}
	
	
	

}
