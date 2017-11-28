package com.branches.model;

import java.util.*;
import java.sql.*;


public class BranchesJDBCDAO implements BranchesDAO_interface {
	String driver = "oracle.jdbc.driver.OracleDriver";
	String userid = "BA104G1DB";
	String passwd = "BA104G1DB";
	
//  ************** AWS Ollie**************
//	String url = "jdbc:oracle:thin:@13.229.86.22:1521:XE";
//  ************** AWS Aerin**************
//	String url = "jdbc:oracle:thin:@13.124.90.221:1521:XE";	
//  ************** BA104 **************
//	String url = "jdbc:oracle:thin:@10.120.25.6:1521:XE";
//	************* Localhost **********
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	
	//---------------前端------------------
	//設定：不增
	//設定：不刪
	//設定：不改
	//設定：不查
		
	//---------------後端-------------------
	//設定：可增
	private static final String INSERT_STMT =
			"INSERT INTO BRANCHES (EMP_BRANCHES,BRC_LAT,BRC_LON,BRC_NAME) VALUES(?,?,?,?)";
	//設定：可刪 
	private static final String DELETE =
			"DELETE FROM BRANCHES WHERE EMP_BRANCHES = ?";
	//設定：可改 
	private static final String UPDATE = 
			"UPDATE BRANCHES SET BRC_NAME=?, BRC_LAT=?,  BRC_LON=? WHERE EMP_BRANCHES =?";
		 
	//設定：可查
	private static final String GET_ONE_STMT = 
			" SELECT EMP_BRANCHES,BRC_LAT,BRC_LON,BRC_NAME FROM BRANCHES WHERE EMP_BRANCHES =?";
			
	private static final String GET_ALL_STMT =  
		" SELECT EMP_BRANCHES,BRC_LAT,BRC_LON,BRC_NAME FROM BRANCHES";
					
			
	@Override
	public void insert(BranchesVO branchesVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {
					
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_STMT);
			pstmt.setString(1, branchesVO.getEmpBranches());
			pstmt.setDouble(2, branchesVO.getBrcLat());
			pstmt.setDouble(3, branchesVO.getBrcLon());
			pstmt.setString(4, branchesVO.getBrcName());
		
			pstmt.executeUpdate();

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
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

	@Override
	public void update(BranchesVO branchesVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {
		//	"UPDATE BRANCHES SET BRC_LAT=?,  BRC_LON=?, WHERE EMP_BRANCHES =?";
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE);


			pstmt.setString(1, branchesVO.getBrcName());
			pstmt.setDouble(2, branchesVO.getBrcLat());
			pstmt.setDouble(3, branchesVO.getBrcLon());
			pstmt.setString(4, branchesVO.getEmpBranches());
			pstmt.executeUpdate();

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
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

	@Override
	public void delete(String empBranches) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {
	
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(DELETE);

			pstmt.setString(1, empBranches);

			pstmt.executeUpdate();

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
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

	@Override
	public BranchesVO findByPrimaryKey(String empBranches) {

		BranchesVO branchesVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ONE_STMT);
			pstmt.setString(1, empBranches);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				branchesVO = new BranchesVO();
				branchesVO.setEmpBranches(rs.getString("EMP_BRANCHES"));
				branchesVO.setBrcLat(rs.getDouble("BRC_LAT"));
				branchesVO.setBrcLon(rs.getDouble("BRC_LON"));
				branchesVO.setBrcName(rs.getString("BRC_NAME"));

							
			}

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			// Handle any SQL errors
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
		return branchesVO;
	}

	@Override
	public List<BranchesVO> getAll() {
		List<BranchesVO> list = new ArrayList<BranchesVO>();
		BranchesVO branchesVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				
				branchesVO = new BranchesVO();
				branchesVO.setEmpBranches(rs.getString("EMP_BRANCHES"));
				branchesVO.setBrcLat(rs.getDouble("BRC_LAT"));
				branchesVO.setBrcLon(rs.getDouble("BRC_LON"));
				branchesVO.setBrcName(rs.getString("BRC_NAME"));			
				list.add(branchesVO); // Store the row in the list
			}

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			// Handle any SQL errors
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

		BranchesJDBCDAO dao = new BranchesJDBCDAO();

		// 新增
		//EMP_BRANCHES,BRC_LAT,BRC_LON,BRC_NAME
//		BranchesVO branchesVO1 = new BranchesVO();
//
//		branchesVO1.setEmpBranches ("22");
//		branchesVO1.setBrcLat (44.44);
//		branchesVO1.setBrcLon (66.66);
//		branchesVO1.setBrcName ("七星關");
//		
//		dao.insert(branchesVO1);
//System.out.println("新增ＯＫ");

//		// 修改 UPDATE BRANCHES SET BRC_LAT=?,  BRC_LON=?, WHERE EMP_BRANCHES =?
//
//		BranchesVO branchesVO2 = new BranchesVO();
//		branchesVO2.setEmpBranches("77");
//		branchesVO2.setBrcLat(20.12);
//		branchesVO2.setBrcLon(20.12);	
//		dao.update(branchesVO2);
//		
//System.out.println("修改ＯＫ");
//
//
//		// 刪除
//		dao.delete("77");
//System.out.println("刪除ＯＫ");


		// 查詢
//		BranchesVO branchesVO3 = dao.findByPrimaryKey("10");
//		
//		System.out.print(branchesVO3.getEmpBranches() + ",");
//		System.out.print(branchesVO3.getBrcLat() + ",");	
//		System.out.print(branchesVO3.getBrcLon()+ "," );	
//		System.out.print(branchesVO3.getBrcName() );	
//		
//		System.out.println("---------------------");

		
		// 查詢
		List<BranchesVO> list = dao.getAll();
		for (BranchesVO aEmp : list) {

			System.out.print( aEmp.getEmpBranches() + ",");
			System.out.print( aEmp.getBrcLat() + ",");	
			System.out.print( aEmp.getBrcLon()+ "," );	
			System.out.print( aEmp.getBrcName() );	
	
			System.out.println();
		}
	}
}
	
	
	
	
