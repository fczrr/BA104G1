package com.expertlist.model;

import java.util.*;

import javax.naming.Context;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.*;

public class ExpertlistJDBCDAO implements ExpertlistDAO_interface {
//	String driver = "oracle.jdbc.driver.OracleDriver";
//	String userid = "BA104G1DB";
//	String passwd = "BA104G1DB";
	
//  ************** AWS Ollie**************
//	String url = "jdbc:oracle:thin:@13.229.86.22:1521:XE";
//  ************** AWS Aerin**************
//	String url = "jdbc:oracle:thin:@13.124.90.221:1521:XE";	
//  ************** BA104 **************
//	String url = "jdbc:oracle:thin:@10.120.25.6:1521:XE";
//	************* Localhost **********
//	String url = "jdbc:oracle:thin:@localhost:1521:XE";

	
	
	//---------------前端------------------
	//設定：可增
	private static final String INSERT_STMT =
		"INSERT INTO EXPERT_LIST (EXP_NO,EXP_NAME,EXP_SPEC,EXP_PRICE) VALUES (?, ?, ?,?)";
		
		//設定：可刪
	private static final String DELETE =
		"DELETE FROM EXPERT_LIST WHERE EXP_NO = ?";

	
	//設定：可改
	private static final String UPDATE = 
		"UPDATE EXPERT_LIST SET  EXP_NAME=?,  EXP_SPEC=?, EXP_PRICE=? WHERE EXP_NO =?";
	 
	//設定：可查
	private static final String GET_ONE_STMT = 
				
		" SELECT EXP_NO, EXP_NAME, EXP_SPEC, EXP_PRICE"
		+ " FROM EXPERT_LIST"
		+ " WHERE EXP_NO =?";
	
	//---------------後端-------------------
	//設定：不增
	//設定：不刪 
	//設定：不改 
	//設定：可查
	private static final String GET_ALL_STMT =  						
			" SELECT EXP_NO,"
			+ " EXP_NAME,"
			+ " EXP_SPEC, EXP_PRICE"
			+ " FROM EXPERT_LIST";
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
	@Override
	public void insert(ExpertlistVO expertlistVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = ds.getConnection();		
//			Class.forName(driver);
//			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_STMT);
		
			pstmt.setString(1, expertlistVO.getExpNo());
			pstmt.setString(2, expertlistVO.getExpName());
			pstmt.setString(3, expertlistVO.getExpSpec());
			pstmt.setInt(4, expertlistVO.getExpPrice());
		
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
	@Override
	public void update( String expName, String expSpec, Integer expPrice, String expNo) {

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
	@Override
	public void update(ExpertlistVO expertlistVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = ds.getConnection();
//			Class.forName(driver);
//			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setString(1, expertlistVO.getExpName());
			pstmt.setString(2, expertlistVO.getExpSpec());
			pstmt.setInt(3, expertlistVO.getExpPrice());
			pstmt.setString(4, expertlistVO.getExpNo());
			
			
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

	@Override
	public void delete(String expNo) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = ds.getConnection();
//			Class.forName(driver);
//			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(DELETE);
			pstmt.setString(1, expNo);

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

	@Override
	public ExpertlistVO findByPrimaryKey(String expNo) {

		ExpertlistVO expertlistVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = ds.getConnection();
//			Class.forName(driver);
//			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ONE_STMT);
			pstmt.setString(1, expNo);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				expertlistVO = new ExpertlistVO();
				expertlistVO.setExpNo(rs.getString("exp_no"));
				expertlistVO.setExpName(rs.getString("exp_name"));
				expertlistVO.setExpSpec(rs.getString("exp_spec"));
				expertlistVO.setExpPrice(rs.getInt("exp_Price"));
			}		
				
//		} catch (ClassNotFoundException e) {
//			throw new RuntimeException("Couldn't load database driver. "
//					+ e.getMessage());
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
//			Class.forName(driver);
//			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				
				expertlistVO = new ExpertlistVO();
				expertlistVO.setExpNo(rs.getString("exp_no"));
				expertlistVO.setExpName(rs.getString("exp_name"));
				expertlistVO.setExpSpec(rs.getString("exp_spec"));
				expertlistVO.setExpPrice(rs.getInt("exp_Price"));
				
				list.add(expertlistVO); // Store the row in the list
			}

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

//		// 修改
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
//

		// 查詢
		ExpertlistVO expertlistVO3 = dao.findByPrimaryKey("101");
		
		System.out.print(expertlistVO3.getExpNo() + ",");
		System.out.print(expertlistVO3.getExpName() + ",");	
		System.out.print(expertlistVO3.getExpSpec() );		
		System.out.println("---------------------");

		
		// 查詢
		List<ExpertlistVO> list = dao.getAll();
		for (ExpertlistVO aEmp : list) {

			System.out.print(aEmp.getExpNo() + ",");
			System.out.print(aEmp.getExpName() + ",");	
			System.out.print(aEmp.getExpSpec() );
			System.out.println();
		}
	}
}
	
	
	
	
