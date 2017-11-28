package com.android.websocket;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class EmpServiceDetailDAO implements EmpServiceDetailDAO_interface{
	
	private static DataSource ds = null;
	
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/BA104G1DB");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	
	
	private static final String INSERT = "INSERT INTO EMPSERVICEDETAIL(EMPSEVNO,EMP_NO,MEM_NO,EMPSEVDATE,EMPSEVSTATUS) VALUES('ES0005',?,?,SYSTIMESTAMP,'處理中')";
	@Override
	public void insert(EmpServiceDetailVO empServiceDetailVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT);
			pstmt.setString(1, empServiceDetailVO.getEmpNo());
			pstmt.setString(2, empServiceDetailVO.getMemNo());
			int i  = pstmt.executeUpdate();
			System.out.println("新增"+i+"筆聊天記錄");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally{
			if(con!=null){
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
	}
	
	
	private static final String GETBYMEMNO = "SELECT * FROM EMPSERVICEDETAIL WHERE MEM_NO=? AND EMPSEVSTATUS='處理中'";
	@Override
	public List<EmpServiceDetailVO> getByMemNo(String memNo) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<EmpServiceDetailVO> list = new ArrayList<>();
		try {
			con  = ds.getConnection();
			pstmt = con.prepareStatement(GETBYMEMNO);
			pstmt.setString(1, memNo);
			rs = pstmt.executeQuery();
			while(rs.next()){
				EmpServiceDetailVO empServiceDetailVO = new EmpServiceDetailVO();
				empServiceDetailVO.setEmpServNo(rs.getString("EMPSEVNO"));
				empServiceDetailVO.setEmpNo(rs.getString("EMP_NO"));
				empServiceDetailVO.setMemNo(rs.getString("MEM_NO"));
				empServiceDetailVO.setEmpSevIntro(rs.getString("EMPSEVINTRO"));
				empServiceDetailVO.setEmpSevDate(rs.getTimestamp("EMPSEVDATE"));
				list.add(empServiceDetailVO);
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
		return list;
	}
	

private static final String GETBYEMPNO = "SELECT * FROM EMPSERVICEDETAIL WHERE EMP_NO=? AND EMPSEVSTATUS='處理中'";
	@Override
	public List<EmpServiceDetailVO> getByEmpNo(String empNo) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<EmpServiceDetailVO> list = new ArrayList<>();
		try {
			con  = ds.getConnection();
			pstmt = con.prepareStatement(GETBYEMPNO);
			pstmt.setString(1, empNo);
			rs = pstmt.executeQuery();
			while(rs.next()){
				EmpServiceDetailVO empServiceDetailVO = new EmpServiceDetailVO();
				empServiceDetailVO.setEmpServNo(rs.getString("EMPSEVNO"));
				empServiceDetailVO.setEmpNo(rs.getString("EMP_NO"));
				empServiceDetailVO.setMemNo(rs.getString("MEM_NO"));
				empServiceDetailVO.setEmpSevIntro(rs.getString("EMPSEVINTRO"));
				empServiceDetailVO.setEmpSevDate(rs.getTimestamp("EMPSEVDATE"));
				list.add(empServiceDetailVO);
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
		return list;
	}
	private static final String UPDATE = "UPDATE EMPSERVICEDETAIL SET  EMPSEVDATE=SYSTIMESTAMP,EMPSEVINTRO=? WHERE EMPSEVNO=?";
	@Override
	public void update(EmpServiceDetailVO empServiceDetailVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE);
			pstmt.setString(1, empServiceDetailVO.getEmpSevIntro());
			pstmt.setString(2, empServiceDetailVO.getEmpServNo());
			int i = pstmt.executeUpdate();
			System.out.println("更新聊天記錄"+i+"筆");
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
	
	private static final String GETONE = "SELECT * FROM EMPSERVICEDETAIL WHERE EMPSEVNO=?";
	@Override
	public EmpServiceDetailVO getOne(EmpServiceDetailVO empServiceDetailVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		EmpServiceDetailVO empDetailVO = null;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GETONE);
			pstmt.setString(1, empServiceDetailVO.getEmpServNo());
			rs = pstmt.executeQuery();
			if(rs.next()){
				empDetailVO = new EmpServiceDetailVO();
				empDetailVO.setEmpServNo(rs.getString("EMPSEVNO"));
				empDetailVO.setEmpNo(rs.getString("EMP_NO"));
				empDetailVO.setMemNo(rs.getString("MEM_NO"));
				empDetailVO.setEmpSevIntro(rs.getString("EMPSEVINTRO"));
				empDetailVO.setEmpSevDate(rs.getTimestamp("EMPSEVDATE"));
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
		return empDetailVO;
	}
}
