
package com.thecared.model;

import java.util.*;
import java.sql.*;
import java.sql.Date;

public class ThecaredJDBCDAO implements ThecaredDAO_interface {
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@13.124.90.221:1521:XE";
	String userid = "BA104G1DB";
	String passwd = "BA104G1DB";
	
	
	
	//---------------前端------------------
	//設定：可增
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
	
	//設定：可刪
	private static final String DELETE =
		"DELETE FROM THECARED WHERE CARED_NO = ?";
	
	//設定：可改
	private static final String UPDATE = 
		"UPDATE THECARED SET "
			+ "CARED_NAME=?, "
			+ "CARED_WEIGHT=? ,"
			+ "CARED_ADDRESS=? ,"
			+ "CARED_PHONE=? ,"
			+ "CON_STATUS=?, "
			+ "BIO_STATUS=? "
		+ "WHERE CARED_NO =?";
	 
	//設定：可查
	private static final String GET_ONESTMT = "SELECT * FROM THECARED WHERE cared_No = ?";
		

	private static final String GETALL_MEM = "SELECT * FROM THECARED WHERE MEM_NO = ?";
	//---------------後端-------------------
	//設定：不增
	//設定：不刪 
	//設定：不改 
	//設定：可查
	private static final String GETALLSTMT =  
				" SELECT * FROM THECARED ";

	@Override
	public void insert(ThecaredVO thecaredVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {
					
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
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
	public void update(ThecaredVO thecaredVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {
				
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setString(1, thecaredVO.getCaredName());
			pstmt.setInt(2, thecaredVO.getCaredWeight());
			pstmt.setString(3, thecaredVO.getCaredAddress());
			pstmt.setString(4, thecaredVO.getCaredPhone());
			pstmt.setString(5, thecaredVO.getConStatus());
			pstmt.setString(6, thecaredVO.getBioStatus());
			pstmt.setString(7, thecaredVO.getCaredNo());
			
			
			int i= pstmt.executeUpdate();
			System.out.println("修改ＯＫ"+i);

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
	public void delete(String caredNo) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(DELETE);

			pstmt.setString(1, caredNo);

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
	public ThecaredVO findByPrimaryKey(String caredNo) {

		ThecaredVO thecaredVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ONESTMT);
			pstmt.setString(1, caredNo);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				thecaredVO = new ThecaredVO();
				thecaredVO.setCaredNo(rs.getString("CARED_NO"));
				thecaredVO.setMemNo(rs.getString("MEM_NO"));
				thecaredVO.setCaredName(rs.getString("CARED_NAME"));
				thecaredVO.setCaredGender(rs.getString("CARED_GENDER"));
				thecaredVO.setKinship(rs.getString("KINSHIP"));
				thecaredVO.setCaredHeight(rs.getInt("CARED_HEIGHT"));
				thecaredVO.setCaredWeight(rs.getInt("CARED_WEIGHT"));
				thecaredVO.setCaredAddress(rs.getString("CARED_ADDRESS"));
				thecaredVO.setCaredPhone(rs.getString("CARED_PHONE"));
				thecaredVO.setConStatus(rs.getString("CON_STATUS"));
				thecaredVO.setBioStatus(rs.getString("BIO_STATUS"));
				thecaredVO.setModifyTime(rs.getTimestamp("MODIFY_TIME"));
							
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
		return thecaredVO;
	}
	@Override
	public List<ThecaredVO> getAllByMemNo(String MemNo) {

		List<ThecaredVO> list = new ArrayList<ThecaredVO>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GETALL_MEM);
			pstmt.setString(1, MemNo);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				ThecaredVO thecaredVO = new ThecaredVO();
				thecaredVO.setCaredNo(rs.getString("CARED_NO"));
				thecaredVO.setMemNo(rs.getString("MEM_NO"));
				thecaredVO.setCaredName(rs.getString("CARED_NAME"));
				thecaredVO.setCaredGender(rs.getString("CARED_GENDER"));
				thecaredVO.setKinship(rs.getString("KINSHIP"));
				thecaredVO.setCaredHeight(rs.getInt("CARED_HEIGHT"));
				thecaredVO.setCaredWeight(rs.getInt("CARED_WEIGHT"));
				thecaredVO.setCaredAddress(rs.getString("CARED_ADDRESS"));
				thecaredVO.setCaredPhone(rs.getString("CARED_PHONE"));
				thecaredVO.setConStatus(rs.getString("CON_STATUS"));
				thecaredVO.setBioStatus(rs.getString("BIO_STATUS"));
				thecaredVO.setModifyTime(rs.getTimestamp("MODIFY_TIME"));
				
				
				list.add(thecaredVO);
							
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

	@Override
	public List<ThecaredVO> getAll() {
		List<ThecaredVO> list = new ArrayList<ThecaredVO>();
		ThecaredVO thecaredVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GETALLSTMT);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				
				thecaredVO = new ThecaredVO();
				thecaredVO.setCaredNo(rs.getString("CARED_NO"));
				thecaredVO.setMemNo(rs.getString("MEM_NO"));
				thecaredVO.setCaredName(rs.getString("CARED_NAME"));
				thecaredVO.setCaredGender(rs.getString("CARED_GENDER"));
				thecaredVO.setKinship(rs.getString("KINSHIP"));
				thecaredVO.setCaredHeight(rs.getInt("CARED_HEIGHT"));
				thecaredVO.setCaredWeight(rs.getInt("CARED_WEIGHT"));
				thecaredVO.setCaredAddress(rs.getString("CARED_ADDRESS"));
				thecaredVO.setCaredPhone(rs.getString("CARED_PHONE"));
				thecaredVO.setConStatus(rs.getString("CON_STATUS"));
				thecaredVO.setBioStatus(rs.getString("BIO_STATUS"));
				thecaredVO.setModifyTime(rs.getTimestamp("MODIFY_TIME"));
				
				list.add(thecaredVO); // Store the row in the list
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

		ThecaredJDBCDAO dao = new ThecaredJDBCDAO();

		 //新增
		ThecaredVO thecaredVO1 = new ThecaredVO();

	    thecaredVO1.setMemNo("MEM0003");
		thecaredVO1.setCaredName("王武");
		thecaredVO1.setCaredGender("M");
		thecaredVO1.setKinship("父親");
		thecaredVO1.setCaredHeight(168);
		thecaredVO1.setCaredWeight(55);
		thecaredVO1.setCaredAddress("臥龍崗");
		thecaredVO1.setCaredPhone("000012312");
		thecaredVO1.setConStatus("輕度");
		thecaredVO1.setBioStatus("輕度");		
		dao.insert(thecaredVO1);


		// 修改

//		ThecaredVO thecaredVO2 = new ThecaredVO();
//		thecaredVO2.setCaredNo("CRD0021");
//		thecaredVO2.setCaredName("王六");
//		thecaredVO2.setCaredWeight(65);
//		thecaredVO2.setCaredPhone("000123456");
//		thecaredVO2.setConStatus("中度");
//		thecaredVO2.setBioStatus("中度");
//		thecaredVO2.setCaredAddress("南陽郡臥龍里");
//		dao.update(thecaredVO2);



		// 刪除

//		dao.delete("CRD0022");
//System.out.println("刪除ＯＫ");
//
//
//		// 查詢
//		ThecaredVO thecaredVO3 = dao.findByPrimaryKey("CRD0001");
//		
//		System.out.print(thecaredVO3.getCaredNo() );
//		System.out.print(thecaredVO3.getCaredName() );	
//		System.out.print(thecaredVO3.getCaredGender() );	
//		System.out.print(thecaredVO3.getKinship() );
//		System.out.print(thecaredVO3.getCaredHeight() );
//		System.out.print(thecaredVO3.getCaredWeight() );	
//		System.out.print(thecaredVO3.getCaredAddress() );	
//		System.out.print(thecaredVO3.getCaredPhone() );	
//		System.out.print(thecaredVO3.getCaredName() );	
//		System.out.print(thecaredVO3.getCaredName() );	
//		System.out.print(thecaredVO3.getCaredName() );
//		
//		System.out.println("---------------------");
		


		
		
		
		
		List<ThecaredVO> list = dao.getAllByMemNo("MEM0002");
		System.out.println("getAllByMemNo*--------------------------------*");
		for(ThecaredVO thecaredVO:list){
			
			System.out.println(thecaredVO.getCaredName());
			System.out.println("*--------------------------------*");
		
		}
		 //查詢
		
//		List<ThecaredVO> list2 = dao.getAll();
//		System.out.println("getAll*--------------------------------*");
//		for (ThecaredVO aEmp : list2) {
//			
//			System.out.print(aEmp.getCaredNo() + ",");
//			System.out.print(aEmp.getCaredName() );
//	
//			System.out.println();
//		}
	
	}

}
	
	