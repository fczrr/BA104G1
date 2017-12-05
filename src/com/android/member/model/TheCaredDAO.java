package com.android.member.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.thecared.model.ThecaredVO;

public class TheCaredDAO implements TheCaredDAO_interface{
	
	

	private static DataSource ds = null;
	static {
		try {
			Context ctx = new javax.naming.InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/BA104G1DB");
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	private static final String INSERTSTMT =
			"INSERT INTO THECARED ("
			    + "CARED_NO, "
				+ "MEM_NO, "
				+ "CARED_NAME, "
				+ "CARED_GENDER, "
				+ "KINSHIP, "
				+ "CARED_HEIGHT, "
				+ "CARED_WEIGHT, "
				+ "CARED_ADDRESS, "
				+ "CARED_PHONE, "
				+ "CON_STATUS, "
				+ "BIO_STATUS) "
			+ "VALUES(to_char('CRD'||LPAD(to_char(SEQ_THECARED.NEXTVAL),4,'0')), "
			+ "?, ?, ?, ?, ?, ?, ?, ?, ?, ? )";
	
	@Override
	public void insert(TheCaredVO thecaredVO) {
		
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERTSTMT);
		
			pstmt.setString(1, thecaredVO.getMemNo());
			pstmt.setString(2, thecaredVO.getCaredName());
			pstmt.setString(3, thecaredVO.getCaredGender());
			pstmt.setString(4, thecaredVO.getKinship());
			pstmt.setInt(5, thecaredVO.getCaredHeight());
			pstmt.setInt(6, thecaredVO.getCaredWeight());
			pstmt.setString(7, thecaredVO.getCaredAddress());
			pstmt.setString(8, thecaredVO.getCaredPhone());
			pstmt.setString(9, thecaredVO.getConStatus());
			pstmt.setString(10, thecaredVO.getBioStatus());
		
			int i = pstmt.executeUpdate();
			System.out.println("新增ＯＫ"+i);

		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
		} finally {
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}

		
	}
	private static final String UPDATE = 
			"UPDATE THECARED SET "
				+ "CARED_NAME=?, "
				+ "CARED_WEIGHT=? ,"
				+ "CARED_ADDRESS=? ,"
				+ "CARED_PHONE=? ,"
				+ "CON_STATUS=?, "
				+ "BIO_STATUS=?, "
				+ "CARED_HEIGHT=? "
			+ "WHERE CARED_NO =?";
	@Override
	public void update(TheCaredVO thecaredVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setString(1, thecaredVO.getCaredName());
			pstmt.setInt(2, thecaredVO.getCaredWeight());
			pstmt.setString(3, thecaredVO.getCaredAddress());
			pstmt.setString(4, thecaredVO.getCaredPhone());
			pstmt.setString(5, thecaredVO.getConStatus());
			pstmt.setString(6, thecaredVO.getBioStatus());
			pstmt.setInt(7, thecaredVO.getCaredHeight());
			pstmt.setString(8, thecaredVO.getCaredNo());
			
			
			int i= pstmt.executeUpdate();
			
			System.out.println("更新theCared"+i);
			
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}

	}
	
	private static final String DELETE =
			"DELETE FROM THECARED WHERE CARED_NO = ?";
		
	@Override
	public void delete(String caredNo) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(DELETE);

			pstmt.setString(1, caredNo);

			pstmt.executeUpdate();

		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
		} finally {
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
	}
}
