package com.android.hcOrderMaster.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.android.hcOrderDetail.model.HcOrderDetailVO;

public class HcOrderMasterDAO implements HcOrderMasterDAO_interface {
	private static DataSource ds = null;

	private static final String INSERT_STMT = "INSERT INTO HC_ORDER_MASTER (ORDER_NO,MEM_NO,CARED_NO,ORDER_DATE,ORDER_STATUS) "
			+ "VALUES(TO_CHAR(SYSDATE,'yyyymmdd')||'-'||LPAD(HC_ORDER_NO_SEQ.NEXTVAL,6,'0'),?,?,?,?)";
	private static final String GET_ALL_STMT = "SELECT * FROM HC_ORDER_MASTER ";
	private static final String GET_ONE_STMT = "SELECT * FROM HC_ORDER_MASTER WHERE ORDER_NO = ?";
	private static final String DELETE = "DELETE FROM HC_ORDER_MASTER WHERE ORDER_NO=?";
	private static final String UPDATE = "UPDATE HC_ORDER_MASTER SET MEM_NO=?,CARED_NO=?,ORDER_DATE=?,ORDER_STATUS=? WHERE ORDER_NO=?";

	private static final String GET_BY_MEMNO = "SELECT * FROM HC_ORDER_MASTER WHERE MEM_NO=?";
	private static final String GET_BY_MEMNO_DETAIL = "SELECT * FROM HC_ORDER_DETAIL WHERE ORDER_NO=?";
	static {
		try {
			Context ctx = new javax.naming.InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/BA104G1DB");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void insert(HcOrderMasterVO hcOrderMasterVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT_STMT);
			pstmt.setString(1, hcOrderMasterVO.getMemNo());
			pstmt.setString(2, hcOrderMasterVO.getCaredNo());
			pstmt.setTimestamp(3, hcOrderMasterVO.getOrderDate());
			pstmt.setString(4, hcOrderMasterVO.getOrderStatus());

			int i = pstmt.executeUpdate();
			System.out.println("");

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}

	}

	@Override
	public void update(HcOrderMasterVO hcOrderMasterVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setString(1, hcOrderMasterVO.getMemNo());
			pstmt.setString(2, hcOrderMasterVO.getCaredNo());
			pstmt.setTimestamp(3, hcOrderMasterVO.getOrderDate());
			pstmt.setString(4, hcOrderMasterVO.getOrderStatus());
			pstmt.setString(5, hcOrderMasterVO.getOrderNo());

			int i = pstmt.executeUpdate();

			System.out.println("");

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
	}

	@Override
	public void delete(String orderNo) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(DELETE);
			pstmt.setString(1, orderNo);
			int i = pstmt.executeUpdate();
			System.out.println("");

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}

	}

	@Override
	public HcOrderMasterVO findByPrimaryKey(String orderNo) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		HcOrderMasterVO hcOrderMasterVO = new HcOrderMasterVO();

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ONE_STMT);
			pstmt.setString(1, orderNo);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				hcOrderMasterVO.setOrderNo(rs.getString("ORDER_NO"));
				hcOrderMasterVO.setMemNo(rs.getString("MEM_NO"));
				hcOrderMasterVO.setCaredNo(rs.getString("CARED_NO"));
				hcOrderMasterVO.setOrderDate(rs.getTimestamp("ORDER_DATE"));
				hcOrderMasterVO.setOrderStatus(rs.getString("ORDER_STATUS"));
			}

			return hcOrderMasterVO;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return hcOrderMasterVO;
	}

	@Override
	public List<HcOrderMasterVO> getAll() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<HcOrderMasterVO> hcOrderList = new ArrayList();

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				HcOrderMasterVO hcOrderMasterVO = new HcOrderMasterVO();
				hcOrderMasterVO.setOrderNo(rs.getString("ORDER_NO"));
				hcOrderMasterVO.setMemNo(rs.getString("MEM_NO"));
				hcOrderMasterVO.setCaredNo(rs.getString("CARED_NO"));
				hcOrderMasterVO.setOrderDate(rs.getTimestamp("ORDER_DATE"));
				hcOrderMasterVO.setOrderStatus(rs.getString("ORDER_STATUS"));
				hcOrderList.add(hcOrderMasterVO);
			}
			return hcOrderList;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return hcOrderList;
	}
///////////////////////////////////交易////////////////////////////////////////
	@Override
	public void transaction(HcOrderMasterVO hcOrderMasterVO, List<HcOrderDetailVO> detailList) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = ds.getConnection();
			con.setAutoCommit(false);

			pstmt = con.prepareStatement(INSERT_STMT);

		} catch (SQLException e) {
			e.printStackTrace();
		}

	}
///////////////////////////////////交易////////////////////////////////////////
	
///////////////////////////////////查訂單+明細////////////////////////////////////////	
	@Override
	public List<HcOrderMasterVO> getByMemNo(String memNo) {
		Connection con = null;
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		ResultSet rs = null;
		ResultSet rs2 = null;
		List<HcOrderMasterVO> hcOrderList = new ArrayList();

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_BY_MEMNO);
			pstmt.setString(1, memNo);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				HcOrderMasterVO hcOrderMasterVO = new HcOrderMasterVO();
				hcOrderMasterVO.setOrderNo(rs.getString("ORDER_NO"));
				hcOrderMasterVO.setMemNo(rs.getString("MEM_NO"));
				hcOrderMasterVO.setCaredNo(rs.getString("CARED_NO"));
				hcOrderMasterVO.setOrderDate(rs.getTimestamp("ORDER_DATE"));
				hcOrderMasterVO.setOrderStatus(rs.getString("ORDER_STATUS"));
				System.out.println("get 1 ");
				
				pstmt2 = con.prepareStatement(GET_BY_MEMNO_DETAIL);
				System.out.println(hcOrderMasterVO.getOrderNo());
				pstmt2.setString(1, hcOrderMasterVO.getOrderNo());
				rs2 = pstmt2.executeQuery();
				List<HcOrderDetailVO> detailList = hcOrderMasterVO.getDetailList();
				while (rs2.next()) {
					HcOrderDetailVO hcOrderDetailVO = new HcOrderDetailVO();
					hcOrderDetailVO.setOrderDetailNo(rs2.getString("ORDER_DETAIL_NO"));
					hcOrderDetailVO.setOrderNo(rs2.getString("ORDER_NO"));
					hcOrderDetailVO.setServiceDate(rs2.getDate("SERVICE_DATE"));
					hcOrderDetailVO.setServiceTime(rs2.getString("SERVICE_TIME"));
					hcOrderDetailVO.setEmpNo(rs2.getString("EMP_NO"));
					hcOrderDetailVO.setOrderDetailStatus(rs2.getString("ORDER_DEDIAL_STATUS"));
					detailList.add(hcOrderDetailVO);
					System.out.println("get 2");
				}
				hcOrderList.add(hcOrderMasterVO);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return hcOrderList;
	}

}
