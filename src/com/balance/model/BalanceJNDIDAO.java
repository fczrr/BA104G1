package com.balance.model;

import java.util.*;

import javax.naming.Context;
import javax.naming.NamingException;
import javax.sql.DataSource;

import java.sql.*;

public class BalanceJNDIDAO implements BalanceDAO_interface {
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
		"INSERT INTO BALANCE (TOPUP_NO, MEM_NO,TOPUP_VALUE,TOPUP_WAY) VALUES "
		+ "(to_char('TPP'||to_char(sysdate,'yymm')||LPAD(to_char(SEQ_EMPLOYEE.NEXTVAL),3,'0')),?,?,?)";
	
	//設定：不刪
	//設定：不改
	//設定：可查
	private static final String GET_ONE_STMT = 
		"SELECT TOPUP_NO, MEM_NO,TOPUP_VALUE,STATUS,TOPUP_WAY,"
		+ "to_char(TOPUP_TIME,'yyyy-mm-dd-hh:mm:ss') TOPUP_TIME FROM BALANCE WHERE MEM_NO=?";
	
	private static final String GET_ONE_TOPUPNO_STMT = 
			"SELECT TOPUP_NO, MEM_NO,TOPUP_VALUE,STATUS,TOPUP_WAY,"
			+ "to_char(TOPUP_TIME,'yyyy-mm-dd-hh:mm:ss') TOPUP_TIME FROM BALANCE WHERE TOPUP_NO=?";
	
	private static final String GET_SOMEONE_STMT = 
		"SELECT TOPUP_NO, MEM_NO,TOPUP_VALUE,STATUS,TOPUP_WAY,"
		+ "to_char(TOPUP_TIME,'yyyy-mm-dd-hh:mm:ss') TOPUP_TIME FROM BALANCE WHERE MEM_NO=?";
	
	//---------------後端-------------------
	//設定：不增
	//設定：不刪 （下行為練習用的）
	private static final String DELETE =
		"DELETE FROM BALANCE WHERE TOPUP_NO = ?";	
	
	//設定：不改 （下行為練習用的）
	private static final String UPDATE = 
		"UPDATE BALANCE set STATUS=? WHERE TOPUP_NO =?";
	
	//設定：可查
	private static final String GET_ALL_STMT =  
			"SELECT TOPUP_NO, MEM_NO,TOPUP_VALUE,STATUS,TOPUP_WAY,to_char"
			+ "(TOPUP_TIME,'yyyy-mm-dd hh:mm:ss') TOPUP_TIME FROM BALANCE";
	//JDNI
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
	public void insert(BalanceVO balanceVO)  {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = ds.getConnection();
//			Class.forName(driver);
//			con = DriverManager.getConnection(url, userid, passwd);
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setString(1, balanceVO.getMemNo());
			pstmt.setInt(2, balanceVO.getTopupValue());
			pstmt.setString(3, balanceVO.getTopupWay());
		
			int i =pstmt.executeUpdate();
			System.out.println(i+"++++++");
			pstmt.close();
			
			pstmt = con.prepareStatement("update member  set point = (select point from member where mem_no = ?)+? where mem_no = ? ");
			System.out.println(i+"++++++2");

			pstmt.setString(1, balanceVO.getMemNo());
			pstmt.setInt(2, balanceVO.getTopupValue());
			pstmt.setString(3, balanceVO.getMemNo());
			System.out.println(i+"++++++3");

			pstmt.executeUpdate();
			
			con.commit();
			System.out.println("YY");

			// Handle any driver errors
//		} catch (ClassNotFoundException e) {
//			throw new RuntimeException("Couldn't load database driver. "
//					+ e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			try {
				con.rollback();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
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
	public void update(String status, String topupNo) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
//			Class.forName(driver);
//			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE);
 
			pstmt.setString(1, status);
			pstmt.setString(2, topupNo);
			
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
	public void delete(String topupNo) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = ds.getConnection();
//			Class.forName(driver);
//			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(DELETE);

			pstmt.setString(1, topupNo);

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
	public BalanceVO findByPrimaryKey(String memNo) {

		BalanceVO balanceVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = ds.getConnection();
//			Class.forName(driver);
//			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setString(1, memNo);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				// balanceVO 也稱為 Domain objects
				balanceVO = new BalanceVO();
				balanceVO.setTopupNo(rs.getString("topup_no"));
				balanceVO.setMemNo(rs.getString("mem_no"));
				balanceVO.setTopupValue(rs.getInt("topup_value"));
				balanceVO.setStatus(rs.getString("status"));
				balanceVO.setTopupWay(rs.getString("topup_way"));
				balanceVO.setTopupTime(rs.getString("topup_time"));
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
		return balanceVO;
	}

	@Override
	public BalanceVO findByTopupNo(String topupNo) {

		BalanceVO balanceVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = ds.getConnection();
//			Class.forName(driver);
//			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ONE_TOPUPNO_STMT);

			pstmt.setString(1, topupNo);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				// balanceVO 也稱為 Domain objects
				balanceVO = new BalanceVO();
				balanceVO.setTopupNo(rs.getString("topup_no"));
				balanceVO.setMemNo(rs.getString("mem_no"));
				balanceVO.setTopupValue(rs.getInt("topup_value"));
				balanceVO.setStatus(rs.getString("status"));
				balanceVO.setTopupWay(rs.getString("topup_way"));
				balanceVO.setTopupTime(rs.getString("topup_time"));
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
		return balanceVO;
	}
	
	@Override
	public List<BalanceVO> getAll() {
		
		List<BalanceVO> list = new ArrayList<BalanceVO>();
		
		
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
				// balanceVO 也稱為 Domain objects
				BalanceVO balanceVO = new BalanceVO();
				balanceVO.setTopupNo(rs.getString("topup_no"));
				balanceVO.setMemNo(rs.getString("mem_no"));
				balanceVO.setTopupValue(rs.getInt("topup_value"));
				balanceVO.setStatus(rs.getString("status"));
				balanceVO.setTopupWay(rs.getString("topup_way"));
				balanceVO.setTopupTime(rs.getString("topup_time"));
				list.add(balanceVO); // Store the row in the list
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
	@Override
	public List<BalanceVO> getAllByMemNo(String memNo) {
		List<BalanceVO> list = new ArrayList<BalanceVO>();
		BalanceVO balanceVO = null;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = ds.getConnection();
//			Class.forName(driver);
//			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_SOMEONE_STMT);
			pstmt.setString(1, memNo);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				// balanceVO 也稱為 Domain objects
				balanceVO = new BalanceVO();
				balanceVO.setTopupNo(rs.getString("topup_no"));
				balanceVO.setMemNo(rs.getString("mem_no"));
				balanceVO.setTopupValue(rs.getInt("topup_value"));
				balanceVO.setStatus(rs.getString("status"));
				balanceVO.setTopupWay(rs.getString("topup_way"));
				balanceVO.setTopupTime(rs.getString("topup_time"));
				list.add(balanceVO); // Store the row in the list
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

		BalanceJNDIDAO dao = new BalanceJNDIDAO();
//
//		// 新增
		BalanceVO balanceVO1 = new BalanceVO();		
		balanceVO1.setMemNo("MEM0002");
		balanceVO1.setTopupValue(2000);
		balanceVO1.setTopupWay("credit");
		dao.insert(balanceVO1);
System.out.println("新增ＯＫ");

//		// 修改
//// "UPDATE BALANCE set TOPUP_VALUE=?, STATUS=? WHERE TOPUP_NO =?";
//
//		BalanceVO balanceVO2 = new BalanceVO();
//		balanceVO2.setTopupNo("TPP1710022");
//		balanceVO2.setTopupValue(7002);
//		balanceVO2.setStatus("ok");
//		dao.update(balanceVO2);
//System.out.println("修改ＯＫ");
//
//		// 刪除
//
//		dao.delete("TPP1710028");
//System.out.println("刪除ＯＫ");
//

		// 查詢

/*
 * "SELECT TOPUP_NO, MEM_NO,TOPUP_VALUE,STATUS,TOPUP_WAY,
 * to_char(TOPUP_TIME,'yyyy-mm-dd-hh:mm:ss') TOPUP_TIME FROM BALANCE WHERE TOPUP_NO=?";
*/
//		BalanceVO balanceVO3 = dao.findByPrimaryKey("TPP1711001");
//		System.out.print(balanceVO3.getTopupNo() + ",");
//		System.out.print(balanceVO3.getMemNo() + ",");
//		System.out.print(balanceVO3.getTopupValue() + ",");
//		System.out.print(balanceVO3.getStatus() + ",");
//		System.out.print(balanceVO3.getTopupWay() + ",");
//		System.out.print(balanceVO3.getTopupTime()+ ",");
//		System.out.print(balanceVO3.getTopupNo() );
//		
//		System.out.println("---------------------");

//				"SELECT TOPUP_NO, MEM_NO,TOPUP_VALUE,STATUS,TOPUP_WAY,to_char(TOPUP_TIME,'yyyy-mm-dd-hh:mm:ss') TOPUP_TIME FROM BALANCE ORDER BY TOPUP_NO";
		// 查詢
//		List<BalanceVO> list = dao.getAll();
//		for (BalanceVO aEmp : list) {
//			System.out.print(aEmp.getTopupNo() + ",");
//			System.out.print(aEmp.getMemNo() + ",");
//			System.out.print(aEmp.getTopupValue() + ",");
//			System.out.print(aEmp.getTopupWay() + ",");
//			System.out.print(aEmp.getStatus() +",");
//			System.out.print(aEmp.getTopupTime());
//			System.out.println();
//		}	
//			List<BalanceVO> list2 = dao.getAllByMemNo("MEM0001");
//			for (BalanceVO aEmp : list2) {
//				System.out.print(aEmp.getTopupNo() + ",");
//				System.out.print(aEmp.getMemNo() + ",");
//				System.out.print(aEmp.getTopupValue() + ",");
//				System.out.print(aEmp.getStatus() + ",");
//				System.out.print(aEmp.getStatus() +",");
//				System.out.print(aEmp.getTopupTime());
//			
//			System.out.println();
//		}
	}
}
	
	
	
	
