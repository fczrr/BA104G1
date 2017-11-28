package com.hcorder.modal;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.hcworkshifts.model.HcWorkShiftsVO;

import sun.security.jca.GetInstance;

public class HcOrderDetailJDBCDAO implements HcOrderDetailDAO_interface {
	
	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/BA104G1DB");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	
	private static final String INSERT_STMT = 
			"INSERT INTO HC_ORDER_DETAIL (ORDER_DETAIL_NO,ORDER_NO,SERVICE_DATE,SERVICE_TIME,EMP_NO,ORDER_DEDIAL_STATUS)"
			+"VALUES(TO_CHAR(SYSDATE,'yyyymmdd')||'-'||LPAD(HC_ORDER_DETAIL_NO_SEQ.NEXTVAL,6,'0'),?,?,?,?,?)";

	private static final String GET_ALL_STMT = 
		"SELECT ORDER_DETAIL_NO,ORDER_NO,to_char(SERVICE_DATE,'yyyy-mm-dd') SERVICE_DATE,SERVICE_TIME,EMP_NO,ORDER_DEDIAL_STATUS FROM HC_ORDER_DETAIL order by ORDER_DETAIL_NO";
	
	private static final String GET_ONE_STMT = 
		"SELECT ORDER_DETAIL_NO,ORDER_NO,to_char(SERVICE_DATE,'yyyy-mm-dd') SERVICE_DATE,SERVICE_TIME,EMP_NO,ORDER_DEDIAL_STATUS FROM HC_ORDER_DETAIL where ORDER_DETAIL_NO = ?";
	
	private static final String UPDATE = 
		"UPDATE HC_ORDER_DETAIL SET SERVICE_DATE=?, SERVICE_TIME=? ,EMP_NO=? ,ORDER_DEDIAL_STATUS=? where ORDER_DETAIL_NO = ?";
	
	@Override
	public void insert(HcOrderDetailVO hcOrderDetailVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setString(1, hcOrderDetailVO.getOrderNo());
			pstmt.setDate(2, hcOrderDetailVO.getServiceDate());
			pstmt.setString(3, hcOrderDetailVO.getServiceTime());
			pstmt.setString(4, hcOrderDetailVO.getEmpNo());
			pstmt.setString(5, hcOrderDetailVO.getOrderDetailStataus());
			
			
			int i =pstmt.executeUpdate();
			
			System.out.println("update  "+i+"  row");


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
	public void update(HcOrderDetailVO hcOrderDetailVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setDate(1, hcOrderDetailVO.getServiceDate());
			pstmt.setString(2, hcOrderDetailVO.getServiceTime());
			pstmt.setString(3, hcOrderDetailVO.getEmpNo());
			pstmt.setString(4, hcOrderDetailVO.getOrderDetailStataus());
			pstmt.setString(5, hcOrderDetailVO.getOrderDetailNo());


			int i = pstmt.executeUpdate();
			System.out.println("Update  "+i+" row");

			// Handle any driver errors
		}  catch (SQLException se) {
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
	public void updateAll(List<HcOrderDetailVO> hcOrderDetailVOList, HcWorkShiftsVO hcWorkShiftsVO) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			
			con = ds.getConnection();
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(UPDATE);
			
			for(HcOrderDetailVO hcOrderDetailVO :hcOrderDetailVOList ){			
			pstmt.setDate(1, hcOrderDetailVO.getServiceDate());
			pstmt.setString(2, hcOrderDetailVO.getServiceTime());
			pstmt.setString(3, hcOrderDetailVO.getEmpNo());
			pstmt.setString(4, hcOrderDetailVO.getOrderDetailStataus());
			pstmt.setString(5, hcOrderDetailVO.getOrderDetailNo());
			int i = pstmt.executeUpdate();
			System.out.println("Update hcdetail "+i+" row");
			}
			
			new com.hcworkshifts.model.HcWorkShiftsService()
			.updateHcWorkShifts(hcWorkShiftsVO.getMonthOfYear(), hcWorkShiftsVO.getEmpNo(), hcWorkShiftsVO.getWorkShiftStatus());
			
			con.commit();
			
			
			// Handle any driver errors
		}  catch (SQLException se) {
			try {
				con.rollback();
			} catch (SQLException e) {
				System.out.println("rollback fail!");
				e.printStackTrace();
			};

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
	public HcOrderDetailVO findByPrimaryKey(String OrderDetailNo) {
		HcOrderDetailVO hcOrderDetail = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setString(1, OrderDetailNo);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				
				hcOrderDetail = new HcOrderDetailVO();
				hcOrderDetail.setOrderDetailNo(rs.getString("ORDER_DETAIL_NO"));
				hcOrderDetail.setOrderNo(rs.getString("ORDER_NO"));;
				hcOrderDetail.setServiceDate(rs.getDate("service_date"));
				hcOrderDetail.setServiceTime(rs.getString("service_time"));
				hcOrderDetail.setEmpNo(rs.getString("EMP_NO"));
				hcOrderDetail.setOrderDetailStataus(rs.getString("ORDER_DEDIAL_STATUS"));

			}

			// Handle any driver errors
		}  catch (SQLException se) {
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
		return hcOrderDetail;
	}

	@Override
	public List<HcOrderDetailVO> getAll() {
		
		List<HcOrderDetailVO> list = new ArrayList<HcOrderDetailVO>();
		HcOrderDetailVO hcOrderDetail = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();
			

			while (rs.next()) {				
				
				hcOrderDetail = new HcOrderDetailVO();
				hcOrderDetail.setOrderDetailNo(rs.getString("ORDER_DETAIL_NO"));
				hcOrderDetail.setOrderNo(rs.getString("ORDER_NO"));;
				hcOrderDetail.setServiceDate(rs.getDate("service_date"));
				hcOrderDetail.setServiceTime(rs.getString("service_time"));
				hcOrderDetail.setEmpNo(rs.getString("EMP_NO"));
				hcOrderDetail.setOrderDetailStataus(rs.getString("ORDER_DEDIAL_STATUS"));

				list.add(hcOrderDetail); // Store the row in the list
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
	private static final String GETALL_BY_ORDERNO =
			"SELECT ORDER_DETAIL_NO,ORDER_NO,to_char(SERVICE_DATE,'yyyy-mm-dd') SERVICE_DATE,SERVICE_TIME,"
			+ "EMP_NO,ORDER_DEDIAL_STATUS FROM HC_ORDER_DETAIL WHERE ORDER_NO=?";
 	@Override
	public List<HcOrderDetailVO> getAllByOrderNo(String orderNo) {
 		
		List<HcOrderDetailVO> list = new ArrayList<HcOrderDetailVO>();
		HcOrderDetailVO hcOrderDetail = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GETALL_BY_ORDERNO);
			
			pstmt.setString(1, orderNo);
			rs = pstmt.executeQuery();
			

			while (rs.next()) {				
				
				hcOrderDetail = new HcOrderDetailVO();
				hcOrderDetail.setOrderDetailNo(rs.getString("ORDER_DETAIL_NO"));
				hcOrderDetail.setOrderNo(rs.getString("ORDER_NO"));;
				hcOrderDetail.setServiceDate(rs.getDate("service_date"));
				hcOrderDetail.setServiceTime(rs.getString("service_time"));
				hcOrderDetail.setEmpNo(rs.getString("EMP_NO"));
				hcOrderDetail.setOrderDetailStataus(rs.getString("ORDER_DEDIAL_STATUS"));

				list.add(hcOrderDetail); // Store the row in the list
			}

			// Handle any driver errors
		}  catch (SQLException se) {
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
 	
 	private static final String GETALl_ONE_MONTH = "SELECT  ORDER_DETAIL_NO,ORDER_NO,to_char(SERVICE_DATE,'yyyy-mm-dd') SERVICE_DATE,SERVICE_TIME,"
			+ "EMP_NO,ORDER_DEDIAL_STATUS  FROM HC_ORDER_DETAIL WHERE SERVICE_DATE "
 			+ "BETWEEN ? AND ?  ORDER BY SERVICE_DATE";

	@Override
	public List<HcOrderDetailVO> getAllOneMonth(Integer month) {
		List<HcOrderDetailVO> list = new ArrayList<HcOrderDetailVO>();
		HcOrderDetailVO hcOrderDetail = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		//取得每個月月份的開頭跟結尾
		Integer realMonth = new Integer(month-1);
		java.util.Calendar cal = Calendar.getInstance();
		cal.set(Calendar.MONTH,realMonth);
		cal.set(Calendar.DATE,cal.getActualMinimum(Calendar.DATE));
		Date firstDayofMonth =  new Date(cal.getTime().getTime());
		cal.set(Calendar.DATE, cal.getActualMaximum(Calendar.DATE));
		Date lastDayofMonth =  new Date(cal.getTime().getTime());

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GETALl_ONE_MONTH);
			
			pstmt.setDate(1, firstDayofMonth);
			pstmt.setDate(2, lastDayofMonth);
			rs = pstmt.executeQuery();
			

			while (rs.next()) {				
				
				hcOrderDetail = new HcOrderDetailVO();
				hcOrderDetail.setOrderDetailNo(rs.getString("ORDER_DETAIL_NO"));
				hcOrderDetail.setOrderNo(rs.getString("ORDER_NO"));;
				hcOrderDetail.setServiceDate(rs.getDate("service_date"));
				hcOrderDetail.setServiceTime(rs.getString("service_time"));
				hcOrderDetail.setEmpNo(rs.getString("EMP_NO"));
				hcOrderDetail.setOrderDetailStataus(rs.getString("ORDER_DEDIAL_STATUS"));

				list.add(hcOrderDetail); // Store the row in the list
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
	
	private static final String GETALL_BY_SERVICEDATE = 
			"SELECT ORDER_DETAIL_NO,ORDER_NO,to_char(SERVICE_DATE,'yyyy-mm-dd') SERVICE_DATE,SERVICE_TIME,EMP_NO,ORDER_DEDIAL_STATUS "
			+ "FROM HC_ORDER_DETAIL WHERE SERVICE_DATE = ? ORDER BY ORDER_DETAIL_NO ";

	@Override
	public List<HcOrderDetailVO> getAllBySreviceDate(String date) {
		List<HcOrderDetailVO> list = new ArrayList<HcOrderDetailVO>();
		HcOrderDetailVO hcOrderDetail = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		

		try {
			Date SreviceDate = Date.valueOf(date);			
			
			con = ds.getConnection();
			pstmt = con.prepareStatement(GETALL_BY_SERVICEDATE);
			
			pstmt.setDate(1, SreviceDate);
			rs = pstmt.executeQuery();
			

			while (rs.next()) {				
				
				hcOrderDetail = new HcOrderDetailVO();
				hcOrderDetail.setOrderDetailNo(rs.getString("ORDER_DETAIL_NO"));
				hcOrderDetail.setOrderNo(rs.getString("ORDER_NO"));;
				hcOrderDetail.setServiceDate(rs.getDate("service_date"));
				hcOrderDetail.setServiceTime(rs.getString("service_time"));
				hcOrderDetail.setEmpNo(rs.getString("EMP_NO"));
				hcOrderDetail.setOrderDetailStataus(rs.getString("ORDER_DEDIAL_STATUS"));

				list.add(hcOrderDetail); // Store the row in the list
			}

			// Handle any driver errors
		}  catch (SQLException se) {
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


	private static final String GETALL_BY_SERVIECTIME = 
			"SELECT ORDER_DETAIL_NO,ORDER_NO,to_char(SERVICE_DATE,'yyyy-mm-dd') SERVICE_DATE,"
			+ "SERVICE_TIME,EMP_NO,ORDER_DEDIAL_STATUS FROM HC_ORDER_DETAIL "
			+ "WHERE SERVICE_DATE = ? AND SERVICE_TIME=? ORDER BY EMP_NO ";
	
	@Override
	public List<HcOrderDetailVO> getAllBySreviceTime(String date , String time) {

		List<HcOrderDetailVO> list = new ArrayList<HcOrderDetailVO>();
		HcOrderDetailVO hcOrderDetail = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			Date SreviceDate = Date.valueOf(date);

			con = ds.getConnection();
			pstmt = con.prepareStatement(GETALL_BY_SERVIECTIME);
			pstmt.setDate(1, SreviceDate);
			pstmt.setString(2, time);
			rs = pstmt.executeQuery();
			

			while (rs.next()) {				
				
				hcOrderDetail = new HcOrderDetailVO();
				hcOrderDetail.setOrderDetailNo(rs.getString("ORDER_DETAIL_NO"));
				hcOrderDetail.setOrderNo(rs.getString("ORDER_NO"));;
				hcOrderDetail.setServiceDate(rs.getDate("service_date"));
				hcOrderDetail.setServiceTime(rs.getString("service_time"));
				hcOrderDetail.setEmpNo(rs.getString("EMP_NO"));
				hcOrderDetail.setOrderDetailStataus(rs.getString("ORDER_DEDIAL_STATUS"));

				list.add(hcOrderDetail); // Store the row in the list
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
	private static final String GETALL_ONEMONTH_IN_PERSON = 
			"SELECT ORDER_DETAIL_NO,ORDER_NO,to_char(SERVICE_DATE,'yyyy-mm-dd') SERVICE_DATE,SERVICE_TIME,"
			+ "EMP_NO,ORDER_DEDIAL_STATUS FROM HC_ORDER_DETAIL WHERE SERVICE_DATE BETWEEN ? "
			+ "AND ? AND EMP_NO =?  ORDER BY SERVICE_DATE";

	@Override
	public List<HcOrderDetailVO> getAllOneMonthInPerson(Integer month ,String empNo) {

		List<HcOrderDetailVO> list = new ArrayList<HcOrderDetailVO>();
		HcOrderDetailVO hcOrderDetail = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		//取得每個月月份的開頭跟結尾
		Integer realMonth = new Integer(month-1);
		java.util.Calendar cal = Calendar.getInstance();
		cal.set(Calendar.MONTH,realMonth);
		cal.set(Calendar.DATE,cal.getActualMinimum(Calendar.DATE));
		Date firstDayofMonth =  new Date(cal.getTime().getTime());
		cal.set(Calendar.DATE, cal.getActualMaximum(Calendar.DATE));
		Date lastDayofMonth =  new Date(cal.getTime().getTime());

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GETALL_ONEMONTH_IN_PERSON);
			pstmt.setDate(1, firstDayofMonth);
			pstmt.setDate(2, lastDayofMonth);
			pstmt.setString(3, empNo);
			rs = pstmt.executeQuery();
			

			while (rs.next()) {				
				
				hcOrderDetail = new HcOrderDetailVO();
				hcOrderDetail.setOrderDetailNo(rs.getString("ORDER_DETAIL_NO"));
				hcOrderDetail.setOrderNo(rs.getString("ORDER_NO"));;
				hcOrderDetail.setServiceDate(rs.getDate("service_date"));
				hcOrderDetail.setServiceTime(rs.getString("service_time"));
				hcOrderDetail.setEmpNo(rs.getString("EMP_NO"));
				hcOrderDetail.setOrderDetailStataus(rs.getString("ORDER_DEDIAL_STATUS"));

				list.add(hcOrderDetail); // Store the row in the list
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
	
	private static final String GETALL_BY_SERVICESDATE_IN_PERSON=
			"SELECT ORDER_DETAIL_NO,ORDER_NO,to_char(SERVICE_DATE,'yyyy-mm-dd') SERVICE_DATE,SERVICE_TIME,"
			+ "EMP_NO,ORDER_DEDIAL_STATUS FROM HC_ORDER_DETAIL WHERE SERVICE_DATE = ?"
			+ " AND EMP_NO =?  ORDER BY SERVICE_DATE ";

	@Override
	public List<HcOrderDetailVO> getAllBySreviceDateInPerson(String date, String empNo) {

		List<HcOrderDetailVO> list = new ArrayList<HcOrderDetailVO>();
		HcOrderDetailVO hcOrderDetail = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			Date SreviceDate = Date.valueOf(date);

			con = ds.getConnection();
			pstmt = con.prepareStatement(GETALL_BY_SERVICESDATE_IN_PERSON);
			pstmt.setDate(1, SreviceDate);
			pstmt.setString(2, empNo);
			rs = pstmt.executeQuery();
			

			while (rs.next()) {				
				
				hcOrderDetail = new HcOrderDetailVO();
				hcOrderDetail.setOrderDetailNo(rs.getString("ORDER_DETAIL_NO"));
				hcOrderDetail.setOrderNo(rs.getString("ORDER_NO"));;
				hcOrderDetail.setServiceDate(rs.getDate("service_date"));
				hcOrderDetail.setServiceTime(rs.getString("service_time"));
				hcOrderDetail.setEmpNo(rs.getString("EMP_NO"));
				hcOrderDetail.setOrderDetailStataus(rs.getString("ORDER_DEDIAL_STATUS"));

				list.add(hcOrderDetail); // Store the row in the list
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
	
	private static final String GETALL_BYSERVICETIME_IN_PERSON=
			"SELECT ORDER_DETAIL_NO,ORDER_NO,to_char(SERVICE_DATE,'yyyy-mm-dd') SERVICE_DATE,SERVICE_TIME,EMP_NO,"
			+ "ORDER_DEDIAL_STATUS FROM HC_ORDER_DETAIL WHERE SERVICE_DATE = ? "
			+ "AND SERVICE_TIME=?  AND EMP_NO =?  ORDER BY SERVICE_DATE ";

	@Override
	public HcOrderDetailVO getAllBySreviceTimeInPerson(String date , String time,String empNo) {
		HcOrderDetailVO hcOrderDetail = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			System.out.println("DATE:" + date);
			Date SreviceDate = Date.valueOf(date);

			con = ds.getConnection();
			pstmt = con.prepareStatement(GETALL_BYSERVICETIME_IN_PERSON);

			pstmt.setDate(1, SreviceDate);
			pstmt.setString(2, time);
			pstmt.setString(3, empNo);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				
				hcOrderDetail = new HcOrderDetailVO();
				hcOrderDetail.setOrderDetailNo(rs.getString("ORDER_DETAIL_NO"));
				hcOrderDetail.setOrderNo(rs.getString("ORDER_NO"));;
				hcOrderDetail.setServiceDate(rs.getDate("service_date"));
				hcOrderDetail.setServiceTime(rs.getString("service_time"));
				hcOrderDetail.setEmpNo(rs.getString("EMP_NO"));
				hcOrderDetail.setOrderDetailStataus(rs.getString("ORDER_DEDIAL_STATUS"));

			}

			// Handle any driver errors
		}  catch (SQLException se) {
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
		return hcOrderDetail;
	}
	
	public static void main( String[] args) throws ParseException{
		HcOrderDetailJDBCDAO dao = new HcOrderDetailJDBCDAO();
		
		//inster
//		HcOrderDetailVO OrderDetail = new HcOrderDetailVO();
//		OrderDetail.setOrderNo("20171025-500001");
//		OrderDetail.setServiceDate( new java.sql.Date(new java.util.Date().getTime()));
//		OrderDetail.setServiceTime("下午");
//		OrderDetail.setEmpNo("EMP0002001");
//		OrderDetail.setOrderDetailStataus("未確認");
//		dao.insert(OrderDetail);
		
//		HcOrderDetailVO OrderDetail2 = new HcOrderDetailVO();
//		
//
//		OrderDetail2.setServiceDate( new java.sql.Date(new java.util.Date().getTime()));
//		OrderDetail2.setServiceTime("上午");
//		OrderDetail2.setEmpNo("EMP0002001");
//		OrderDetail2.setOrderDetailStataus("未確認");
//		OrderDetail2.setOrderDetailNo("20171027-600007");
//		dao.update(OrderDetail2);
		
//		HcOrderDetailVO OrderDetail3 = dao.findByPrimaryKey("20171027-600007");
//		System.out.println(OrderDetail3.getOrderDetailNo());
//		System.out.println(OrderDetail3.getOrderNo());
//		System.out.println(OrderDetail3.getServiceDate());
//		System.out.println(OrderDetail3.getServiceTime());
//		System.out.println(OrderDetail3.getOrderDetailStataus());
//		System.out.println(OrderDetail3.getEmpNo());
		
//		List<HcOrderDetailVO> list = dao.getAll();
//		System.out.println("getAll-------------------------------------------------");
//		for(HcOrderDetailVO detail : list ){
//			System.out.println(detail.getOrderDetailNo());
//			System.out.println(detail.getOrderNo());
//			System.out.println(detail.getServiceDate());
//			System.out.println(detail.getServiceTime());
//			System.out.println(detail.getOrderDetailStataus());
//			System.out.println(detail.getEmpNo());
//			System.out.println("-------------------------------------------------");
//		}
		
		
//		List<HcOrderDetailVO> list2 = dao.getAllByOrderNo("20171112-500007");
//		System.out.println("getAllByOrderNo-------------------------------------------------");
//		for(HcOrderDetailVO detail : list2 ){
//			System.out.println(detail.getOrderDetailNo());
//			System.out.println(detail.getOrderNo());
//			System.out.println(detail.getServiceDate());
//			System.out.println(detail.getServiceTime());
//			System.out.println(detail.getOrderDetailStataus());
//			System.out.println(detail.getEmpNo());
//			System.out.println("-------------------------------------------------");
//		}
		
//		List<HcOrderDetailVO> list3 = dao.getAllOneMonth(new Integer(10));
//		System.out.println("getAllOneMonth-------------------------------------------------");
//		for(HcOrderDetailVO detail : list3 ){
//			System.out.println(detail.getOrderDetailNo());
//			System.out.println(detail.getOrderNo());
//			System.out.println(detail.getServiceDate());
//			System.out.println(detail.getServiceTime());
//			System.out.println(detail.getOrderDetailStataus());
//			System.out.println(detail.getEmpNo());
//			System.out.println("-------------------------------------------------");	
//		}
		
//		List<HcOrderDetailVO> list4 = dao.getAllBySreviceDate("2017/11/18");
//		System.out.println("getAllBySreviceDate-------------------------------------------------");
//		for(HcOrderDetailVO detail : list4 ){
//			System.out.println(detail.getOrderDetailNo());
//			System.out.println(detail.getOrderNo());
//			System.out.println(detail.getServiceDate());
//			System.out.println(detail.getServiceTime());
//			System.out.println(detail.getOrderDetailStataus());
//			System.out.println(detail.getEmpNo());
//			System.out.println("-------------------------------------------------");	
//		}
		
//		List<HcOrderDetailVO> list5 = dao.getAllBySreviceTime("2017/11/17","上午");
//		System.out.println("getAllBySreviceTime-------------------------------------------------");
//		for(HcOrderDetailVO detail : list5 ){
//			System.out.println(detail.getOrderDetailNo());
//			System.out.println(detail.getOrderNo());
//			System.out.println(detail.getServiceDate());
//			System.out.println(detail.getServiceTime());
//			System.out.println(detail.getOrderDetailStataus());
//			System.out.println(detail.getEmpNo());
//			System.out.println("-------------------------------------------------");	
//		}
		
		List<HcOrderDetailVO> list6 = dao.getAllOneMonthInPerson(new Integer(11),"EMP0000");
		System.out.println("getAllOneMonthInPerson-------------------------------------------------");
		for(HcOrderDetailVO detail : list6 ){
			System.out.println(detail.getOrderDetailNo());
			System.out.println(detail.getOrderNo());
			System.out.println(detail.getServiceDate());
			System.out.println(detail.getServiceTime());
			System.out.println(detail.getOrderDetailStataus());
			System.out.println(detail.getEmpNo());
			System.out.println("-------------------------------------------------");	
		}
		
		
//		List<HcOrderDetailVO> list7 = dao.getAllBySreviceDateInPerson("2017/11/17","EMP0002");
//		System.out.println("getAllBySreviceDateInPerson-------------------------------------------------");
//		for(HcOrderDetailVO detail : list7 ){
//			System.out.println(detail.getOrderDetailNo());
//			System.out.println(detail.getOrderNo());
//			System.out.println(detail.getServiceDate());
//			System.out.println(detail.getServiceTime());
//			System.out.println(detail.getOrderDetailStataus());
//			System.out.println(detail.getEmpNo());
//			System.out.println("-------------------------------------------------");	
//		}
		
//		HcOrderDetailVO hcOrderDetailVO = dao.getAllBySreviceTimeInPerson("2017-11-30","晚","EMP0020");
//		System.out.println("getAllBySreviceDateInPerson-------------------------------------------------");
//		
//			System.out.println(hcOrderDetailVO.getOrderDetailNo());
//			System.out.println(hcOrderDetailVO.getOrderNo());
//			System.out.println(hcOrderDetailVO.getServiceDate());
//			System.out.println(hcOrderDetailVO.getServiceTime());
//			System.out.println(hcOrderDetailVO.getOrderDetailStataus());
//			System.out.println(hcOrderDetailVO.getEmpNo());
			
		
	}



}
