package com.carorder.model;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.cardetail.model.CarDetailVO;
import com.carorder.model.CarOrderVO;

public class CarOrderDAO implements CarOrder_interface {

//	String driver = "oracle.jdbc.driver.OracleDriver";
//	String url = "jdbc:oracle:thin:@localhost:1521:XE";
//	String userid = "BA104G1";
//	String passwd = "BA104G1";

	 private static DataSource ds = null;
	 static {
	 try {
	 Context ctx = new InitialContext();
	 ds = (DataSource) ctx.lookup("java:comp/env/jdbc/BA104G1DB");
	 } catch (NamingException e) {
	 e.printStackTrace();
	 }
	 }
	private static final String INSERT_STMT = "INSERT INTO CAR_ORDER (ORDER_NO,MEM_NO,ORDER_DATE,ORDER_STATUS) VALUES (to_char(sysdate,'yyyymmdd')||'-'||LPAD(to_char(CARORDER_SEQ.Nextval),6,'0'),?,CURRENT_TIMESTAMP,?)";
	private static final String INSERT_DETAIL_STMT = "INSERT INTO CAR_DETAIL (DETAIL_NO,ORDER_NO,VEHICLE_NO,DETAIL_DATE,DETAIL_TIME,PASSENGER_NAME,PASSENGER_PHONE,GETINTO_ADDRESS,ARRIVAL_ADDRESS,SENDCAR_STATUS)"
			+" VALUES (to_char(sysdate,'yyyymmdd')||'-'||LPAD(to_char(cardetail_seq.Nextval),6,'0'),?,?,?,?,?,?,?,?,?)";	
	private static final String GET_ALL_STMT = "SELECT * FROM CAR_ORDER order by ORDER_NO";
	private static final String GET_ONE_STMT = "SELECT ORDER_NO,MEM_NO,ORDER_DATE,ORDER_STATUS FROM CAR_ORDER WHERE ORDER_NO = ?";
	private static final String DELETE = "DELETE FROM CAR_ORDER WHERE ORDER_NO = ?";
	private static final String UPDATE = "UPDATE CAR_ORDER SET MEM_NO = ?, ORDER_STATUS = ? WHERE ORDER_NO = ?";
	private static final String SELECT_ATTENDANCE ="select ATTENDANCE, WORK_HOURS from CAR_SCHEDUL where YEAR_MONTH = ? and EMP_NO = ?";
//----------------------------------------------------------------------------------------------------------------------------------------------------------
	private static final String SELECT_BY_MEM = "SELECT * FROM CAR_ORDER WHERE MEM_NO=?";
	@Override
	public List<CarOrderVO> getByMemNo(String memNo) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<CarOrderVO> list = new ArrayList<>();
		
		try {
			 con = ds.getConnection();
			 
			pstmt = con.prepareStatement(SELECT_BY_MEM);
			
			pstmt.setString(1,memNo);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				CarOrderVO carorderVO = new CarOrderVO();
				carorderVO.setOrder_no(rs.getString("order_no"));
				carorderVO.setMem_no(rs.getString("mem_no"));
				carorderVO.setOrder_date(rs.getDate("order_date"));
				carorderVO.setOrder_status(rs.getString("order_status"));
				list.add(carorderVO);
			}

		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
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
		return list;
	}
//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	@Override
	public String insert(CarOrderVO carorderVO,List<CarDetailVO> list) {
		Connection con = null;
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 =null;
		String nextNo = null;
		ResultSet rs = null;
		
		try {

			 con = ds.getConnection();
			 
//			Class.forName(driver);
//			con = DriverManager.getConnection(url, userid, passwd);
			 con.setAutoCommit(false);
			 
			String cols[] = {"ORDER_NO"}; 
			pstmt = con.prepareStatement(INSERT_STMT,cols);
			
			pstmt.setString(1, carorderVO.getMem_no());
			pstmt.setString(2, carorderVO.getOrder_status());
			pstmt.executeUpdate();
			rs = pstmt.getGeneratedKeys();
			rs.next();
			nextNo = rs.getString(1);
			pstmt.close();
			
			pstmt = con.prepareStatement(INSERT_DETAIL_STMT);
			
			for(CarDetailVO carDetailVO :list){
				pstmt.setString(1, nextNo);
				pstmt.setInt(2, carDetailVO.getVehicle_no());
				pstmt.setDate(3, carDetailVO.getDetail_date());
				pstmt.setString(4, carDetailVO.getDetail_time());
				pstmt.setString(5, carDetailVO.getPassenger_name());
				pstmt.setString(6, carDetailVO.getPassenger_phone());
				pstmt.setString(7, carDetailVO.getGetinto_address());
				pstmt.setString(8, carDetailVO.getArrival_address());
				pstmt.setString(9, carDetailVO.getSendcar_status());
				pstmt.executeUpdate();
				pstmt.clearParameters();
				
			
			}
			con.commit();

//		} catch (ClassNotFoundException e) {
//			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
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
		return nextNo;

	}

	@Override
	public void update(CarOrderVO carorderVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
//			Class.forName(driver);
//			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setString(1, carorderVO.getMem_no());
			pstmt.setString(2, carorderVO.getOrder_status());
			pstmt.setString(3, carorderVO.getOrder_no());

			pstmt.executeUpdate();

//		} catch (ClassNotFoundException e) {
//			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
			// Handle any driver errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
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
	public void delete(String order_no) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
//			Class.forName(driver);
//			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(DELETE);

			pstmt.setString(1, order_no);
			System.out.println("刪除編號:" + order_no);
			pstmt.executeUpdate();

//		} catch (ClassNotFoundException e) {
//			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());

			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
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
	public CarOrderVO findByPrimaryKey(String order_no) {

		CarOrderVO carorderVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = ds.getConnection();
//			Class.forName(driver);
//			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setString(1, order_no);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				carorderVO = new CarOrderVO();
				carorderVO.setOrder_no(rs.getString("order_no"));
				carorderVO.setMem_no(rs.getString("mem_no"));
				carorderVO.setOrder_date(rs.getDate("order_date"));
				carorderVO.setOrder_status(rs.getString("order_status"));
			}

//		} catch (ClassNotFoundException e) {
//			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());

		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
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
		return carorderVO;
	}

	@Override
	public List<CarOrderVO> getAll() {
		List<CarOrderVO> list = new ArrayList<CarOrderVO>();
		CarOrderVO carorderVO = null;

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

				carorderVO = new CarOrderVO();
				carorderVO.setOrder_no(rs.getString("order_no"));
				carorderVO.setMem_no(rs.getString("mem_no"));
				carorderVO.setOrder_date(rs.getDate("order_date"));
				carorderVO.setOrder_status(rs.getString("order_status"));

				list.add(carorderVO);
			}
//		} catch (ClassNotFoundException e) {
//			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());

		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
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

	public static void main(String[] args) throws IOException {
		// String picName = "WebContent/images/tomcat.png";
		// File pic = new File(picName);
		// byte[] buffer = Files.readAllBytes(pic.toPath());

		CarOrderDAO dao = new CarOrderDAO();

		// 修改

//		 CarOrderVO carorderVO1 = new CarOrderVO();
//		 carorderVO1.setOrder_no("20171113-000002");
//		 carorderVO1.setMem_no("MEM0002");
//		 carorderVO1.setOrder_status("B");
//		 dao.update(carorderVO1);
//		 System.out.println("修改成功");

		// 新增
//		 CarOrderVO carorderVO2 = new CarOrderVO();
//		 carorderVO2.setMem_no("MEM000");
//		 carorderVO2.setOrder_status("A");
//		 dao.insert(carorderVO2);
//		 System.out.println("新增成功");

		// 刪除

//		 dao.delete("20171113-000001");
//		 System.out.println("刪除成功");

		// 查詢單筆

		 CarOrderVO carorderVO3 = dao.findByPrimaryKey("20171113-000001");//注意訂單編號日期，與資料建立日期時間相同
		 	System.out.print(carorderVO3.getOrder_no() + ",");
			System.out.print(carorderVO3.getMem_no() + ",");
			System.out.print(carorderVO3.getOrder_date() + ",");
			System.out.print(carorderVO3.getOrder_status());
			System.out.println("查詢成功");

		// 查詢全部
//		List<CarOrderVO> list = dao.getAll();
//		for (CarOrderVO carorderList : list) {
//			System.out.print(carorderList.getOrder_no() + ",");
//			System.out.print(carorderList.getMem_no() + ",");
//			System.out.print(carorderList.getOrder_date() + ",");
//			System.out.print(carorderList.getOrder_status() + ",");
//			System.out.println("查詢成功");
//			System.out.println();
//		}
	}

	
}
