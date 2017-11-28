package com.hcorder.modal;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class HcOrderMasterDAO implements HcOrderMasterDAO_interface{

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
			"INSERT INTO HC_ORDER_MASTER (ORDER_NO,MEM_NO,ORDER_DATE,CARED_NO,ORDER_STATUS) "
			+ "VALUES(TO_CHAR(SYSDATE,'yyyymmdd')||'-'||LPAD(HC_ORDER_NO_SEQ.NEXTVAL,6,'0'),?,CURRENT_TIMESTAMP,?,?)";
	
	private static final String INSERT_DETAIL_STMT = 
			"INSERT INTO HC_ORDER_DETAIL (ORDER_DETAIL_NO,ORDER_NO,SERVICE_DATE,SERVICE_TIME,EMP_NO,ORDER_DEDIAL_STATUS)"
			+"VALUES(TO_CHAR(SYSDATE,'yyyymmdd')||'-'||LPAD(HC_ORDER_DETAIL_NO_SEQ.NEXTVAL,6,'0'),?,?,?,?,?)";
	
	private static final String GET_ALL_STMT = 
		"SELECT ORDER_NO,MEM_NO,to_char(ORDER_DATE,'yyyy-mm-dd') ORDER_DATE,CARED_NO,ORDER_STATUS FROM HC_ORDER_MASTER order by ORDER_NO";
	
	private static final String GET_ONE_STMT = 
		"SELECT ORDER_NO,MEM_NO,to_char(ORDER_DATE,'yyyy-mm-dd') ORDER_DATE,CARED_NO,ORDER_STATUS FROM HC_ORDER_MASTER where ORDER_NO = ?";
	
	private static final String UPDATE = 
		"UPDATE HC_ORDER_MASTER SET CARED_NO=?, ORDER_STATUS=? where ORDER_NO = ?";
	
	private static final String GET_BY_MEM_NO = "SELECT * FROM HC_ORDER_MASTER WHERE MEM_NO = ?";
	
	
	
	
	
	public String insert(HcOrderMasterVO hcOrderMasterVO,List<HcOrderDetailVO> list) {

		Connection con = null;
		PreparedStatement pstmt = null;
		String nextOrderNo = null;

		try {

			con = ds.getConnection();
			con.setAutoCommit(false);
			String cols[] = {"ORDER_NO"};
			pstmt = con.prepareStatement(INSERT_STMT,cols);

			pstmt.setString(1, hcOrderMasterVO.getMemNo());
			pstmt.setString(2, hcOrderMasterVO.getCaredNo());
			pstmt.setString(3, hcOrderMasterVO.getOrderStatus());
			int i =pstmt.executeUpdate();
			System.out.println("update  "+i+"  row");
			ResultSet rs = pstmt.getGeneratedKeys();
			if (rs.next()) {
				nextOrderNo = rs.getString(1);
				System.out.println("自增主鍵值 = " + nextOrderNo + "(剛新增成功的訂單編號)");
			} else {
				System.out.println("未取得自增主鍵值");
			}
			

			
			pstmt = con.prepareStatement(INSERT_DETAIL_STMT);
			for(HcOrderDetailVO hcOrderDetailVO :list){
				pstmt.setString(1, nextOrderNo);
				pstmt.setDate(2, hcOrderDetailVO.getServiceDate());
				pstmt.setString(3, hcOrderDetailVO.getServiceTime());
				pstmt.setString(4, hcOrderDetailVO.getEmpNo());
				pstmt.setString(5, hcOrderDetailVO.getOrderDetailStataus());
				int j = pstmt.executeUpdate();
				System.out.println("update detail "+j+"  row");

			}
			con.commit();
			// Handle any driver errors
		} catch (SQLException se) {
			try {
				con.rollback();
			} catch (SQLException se2) {
				se2.printStackTrace(System.err);
				System.out.println("rollback失敗");
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
		return nextOrderNo;

	}
		@Override
		public void update(HcOrderMasterVO hcOrderMasterVO) {
			Connection con = null;
			PreparedStatement pstmt = null;

			try {

				con = ds.getConnection();
				pstmt = con.prepareStatement(UPDATE);

				pstmt.setString(1, hcOrderMasterVO.getCaredNo());
				pstmt.setString(2, hcOrderMasterVO.getOrderStatus());
				pstmt.setString(3, hcOrderMasterVO.getOrderNo());

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
		public HcOrderMasterVO findByPrimaryKey(String orderNo) {
			HcOrderMasterVO hcOrder = null;
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;

			try {


				con = ds.getConnection();
				pstmt = con.prepareStatement(GET_ONE_STMT);

				pstmt.setString(1, orderNo);

				rs = pstmt.executeQuery();

				while (rs.next()) {
					
					hcOrder = new HcOrderMasterVO();
					hcOrder.setOrderNo(rs.getString("ORDER_NO"));
					hcOrder.setMemNo(rs.getString("MEM_NO"));
					hcOrder.setOrderDate(rs.getDate("ORDER_DATE"));
					hcOrder.setCaredNo(rs.getString("CARED_NO"));
					hcOrder.setOrderStatus(rs.getString("ORDER_STATUS"));

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
			return hcOrder;
		}
		@Override
		public List<HcOrderMasterVO> getAll() {
			List<HcOrderMasterVO> list = new ArrayList<HcOrderMasterVO>();
			HcOrderMasterVO hcOrder = null;

			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;

			try {


				con = ds.getConnection();
				pstmt = con.prepareStatement(GET_ALL_STMT);
				rs = pstmt.executeQuery();

				while (rs.next()) {				
					hcOrder = new HcOrderMasterVO();
					hcOrder.setOrderNo(rs.getString("ORDER_NO"));
					hcOrder.setMemNo(rs.getString("MEM_NO"));
					hcOrder.setOrderDate(rs.getDate("ORDER_DATE"));
					hcOrder.setCaredNo(rs.getString("CARED_NO"));
					hcOrder.setOrderStatus(rs.getString("ORDER_STATUS"));
					list.add(hcOrder); // Store the row in the list
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
		@Override
		public List<HcOrderMasterVO> getAll(Map map) {
			// TODO Auto-generated method stub
			return null;
		}
		@Override
		public List<HcOrderMasterVO> getByMemNo(String memNo) {
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			List<HcOrderMasterVO> orderList = new ArrayList<>();
			try {
				con = ds.getConnection();
				pstmt = con.prepareStatement(GET_BY_MEM_NO);
				pstmt.setString(1, memNo);
				rs = pstmt.executeQuery();
				while(rs.next()){
					HcOrderMasterVO order = new HcOrderMasterVO();
					order.setOrderNo(rs.getString("ORDER_NO"));
					order.setOrderDate(rs.getDate("ORDER_DATE"));
					order.setOrderStatus(rs.getString("ORDER_STATUS"));
					order.setCaredNo(rs.getString("CARED_NO"));
					orderList.add(order);
				}
				
				
			} catch (SQLException e){ 
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
			
			return orderList;
		}
		
		

}
