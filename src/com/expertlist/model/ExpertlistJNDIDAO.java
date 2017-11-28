package com.expertlist.model;

import java.util.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import java.sql.*;
import java.sql.Date;

public class ExpertlistJNDIDAO implements ExpertlistDAO_interface {
	private static  DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/BA104G1DB");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	
	//---------------前端------------------
	//設定：可增
	private static final String INSERT_STMT =
		"INSERT INTO EXPERT_LIST (EXP_NO,EXP_NAME,EXP_SPEC) VALUES (?, ?, ?)";
		
		//設定：可刪
	private static final String DELETE =
		"DELETE FROM EXPERT_LIST WHERE EXP_NO = ?";

	
	//設定：可改
	private static final String UPDATE = 
		"UPDATE EXPERT_LIST SET "
			+ "EXP_NAME=?, "
			+ "EXP_SPEC=?, "
		+ "WHERE EXP_NO =?";
	 
	//設定：可查
	private static final String GET_ONE_STMT = 
				
		" SELECT * FROM EXPERT_LIST"
		+ " WHERE EXP_NO =?";
	
	//---------------後端-------------------
	//設定：不增
	//設定：不刪 
	//設定：不改 
	//設定：可查
	private static final String GET_ALL_STMT =  						
			" SELECT EXP_NO,"
			+ " EXP_NAME,"
			+ " EXP_SPEC"
			+ " FROM EXPERT_LIST";

	@Override
	public void insert(ExpertlistVO expertlistVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {
					
			
			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT_STMT);
		
			pstmt.setString(1, expertlistVO.getExpNo());
			pstmt.setString(2, expertlistVO.getExpName());
			pstmt.setString(3, expertlistVO.getExpSpec());
		
			pstmt.executeUpdate();

			// Handle any driver errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}

	}

	@Override
	public void update(ExpertlistVO expertlistVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {
				
			
			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setString(1, expertlistVO.getExpName());
			pstmt.setString(2, expertlistVO.getExpSpec());
			pstmt.setString(3, expertlistVO.getExpNo());
			
			
			pstmt.executeUpdate();

			// Handle any driver errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}

	}

	@Override
	public void delete(String expNo) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			
			con = ds.getConnection();
			pstmt = con.prepareStatement(DELETE);

			pstmt.setString(1, expNo);

			pstmt.executeUpdate();

			// Handle any driver errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}

	}

	@Override
	public ExpertlistVO findByPrimaryKey(String expNo) {

		ExpertlistVO expertlistVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ONE_STMT);
			pstmt.setString(1, expNo);
			
			rs = pstmt.executeQuery();

			while (rs.next()) {
				expertlistVO = new ExpertlistVO();
				expertlistVO.setExpNo(rs.getString("exp_no"));
				expertlistVO.setExpName(rs.getString("exp_name"));
				expertlistVO.setExpSpec(rs.getString("exp_spec"));
				expertlistVO.setExpPrice(rs.getInt("exp_price"));
			}

			// Handle any driver errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return expertlistVO;
	}

	@Override
	public List<ExpertlistVO> getAll() {
		List<ExpertlistVO> list = new ArrayList<ExpertlistVO>();
		ExpertlistVO expertlistVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				
				expertlistVO = new ExpertlistVO();
				expertlistVO.setExpNo(rs.getString("exp_no"));
				expertlistVO.setExpName(rs.getString("exp_name"));
				expertlistVO.setExpSpec(rs.getString("exp_spec"));
				
				list.add(expertlistVO); // Store the row in the list
			}

			// Handle any driver errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return list;
	}

	public static void main(String[] args) {

		ExpertlistJDBCDAO dao = new ExpertlistJDBCDAO();

		// 新增
//		ExpertlistVO expertlistVO1 = new ExpertlistVO();
//
//		expertlistVO1.setExpNo("301");
//	    expertlistVO1.setExpName("物理治療師");
//		expertlistVO1.setExpSpec("萎縮肌肉復健");
//		
//		dao.insert(expertlistVO1);
//System.out.println("新增ＯＫ");

		// 修改
//
//		ExpertlistVO expertlistVO2 = new ExpertlistVO();
//
//		expertlistVO2.setExpName("物理治療員");
//		expertlistVO2.setExpSpec("老人居家復健及諮詢");
//		expertlistVO2.setExpNo("301");
//		dao.update(expertlistVO2);
//		
//System.out.println("修改ＯＫ");
//
//
//		// 刪除
//
//		dao.delete("301");
//System.out.println("刪除ＯＫ");


		// 查詢
		ExpertlistVO expertlistVO3 = dao.findByPrimaryKey("101");
		
		System.out.print(expertlistVO3.getExpNo() + ",");
		System.out.print(expertlistVO3.getExpName() + ",");	
		System.out.print(expertlistVO3.getExpSpec() );		
		System.out.println("---------------------");

		
		// 查詢
//		List<ExpertlistVO> list = dao.getAll();
//		for (ExpertlistVO aEmp : list) {
//
//			System.out.print(expertlistVO3.getExpNo() + ",");
//			System.out.print(expertlistVO3.getExpName() + ",");	
//			System.out.print(expertlistVO3.getExpSpec() );
//			System.out.println();
//		}
	}

	@Override
	public void update(String expName, String expSpec, Integer expPrice, String expNo) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = ds.getConnection();
//			Class.forName(driver);
//			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setString(1, expName);
			pstmt.setString(2, expSpec);
			pstmt.setInt(3, expPrice);
			pstmt.setString(4, expNo);
			
			
			pstmt.executeUpdate();

			// Handle any driver errors
//		} catch (ClassNotFoundException e) {
//			throw new RuntimeException("Couldn't load database driver. "
//					+ e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
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
	
	
	
	
