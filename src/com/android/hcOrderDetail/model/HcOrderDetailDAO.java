package com.android.hcOrderDetail.model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.android.member.model.TheCaredVO;

public class HcOrderDetailDAO implements HcOrderDetailDAO_interface {
	private static DataSource ds = null;
	static {
		try {
			Context ctx = new javax.naming.InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/BA104G1DB");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	private static final String INSERT_STMT = "INSERT INTO HC_ORDER_DETAIL(ORDER_DETAIL_NO,ORDER_NO,SERVICE_DATE,SERVICE_TIME,EMP_NO,ORDER_DEDIAL_STATUS)"
			+ "VALUES(TO_CHAR(SYSDATE,'yyyymmdd')||'-'||LPAD(HC_ORDER_DETAIL_NO_SEQ.NEXTVAL,6,'0'),?,?,?,?,?)";

	private static final String GET_ALL_STMT = "SELECT * FROM HC_ORDER_DETAIL";
	private static final String GET_ONE_STMT = "SELECT * FROM HC_ORDER_DETAIL WHERE ORDER_DETAIL_NO=?";
	private static final String DELETE = "DELETE FROM HC_ORDER_DETAIL WHERE ORDER_DETAIL_NO=?";
	private static final String UPDATE = "UPDATE HC_ORDER_DETAIL SET ORDER_NO = ?,SERVICE_DATE=?,SERVICE_TIME = ?,EMP_NO=?,ORDER_DEDIAL_STATUS=? WHERE ORDER_DETAIL_NO = ?";
	private static final String GET_EMP_NO = "SELECT * FROM HC_ORDER_DETAIL JOIN HC_ORDER_MASTER ON HC_ORDER_DETAIL.ORDER_NO=HC_ORDER_MASTER.ORDER_NO JOIN THECARED ON HC_ORDER_MASTER.CARED_NO =THECARED.CARED_NO  WHERE EMP_NO=?";
	@Override
	public void insert(HcOrderDetailVO hcOrderDetail) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT_STMT);
			pstmt.setString(1, hcOrderDetail.getOrderNo());
			pstmt.setDate(2, hcOrderDetail.getServiceDate());
			pstmt.setString(3, hcOrderDetail.getServiceTime());
			pstmt.setString(4, hcOrderDetail.getEmpNo());
			pstmt.setString(5, hcOrderDetail.getOrderDetailStatus());

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
	public void update(HcOrderDetailVO hcOrderDetail) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setString(1, hcOrderDetail.getOrderNo());
			pstmt.setDate(2, hcOrderDetail.getServiceDate());
			pstmt.setString(3, hcOrderDetail.getServiceTime());
			pstmt.setString(4, hcOrderDetail.getEmpNo());
			pstmt.setString(5, hcOrderDetail.getOrderDetailStatus());
			pstmt.setString(6, hcOrderDetail.getOrderDetailNo());

			int i = pstmt.executeUpdate();
			System.out.println("");

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
				;
			}
		}
	}

	@Override
	public void delete(String orderDetailNo) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(DELETE);
			pstmt.setString(1, orderDetailNo);
			int i = pstmt.executeUpdate();
			System.out.println("" + i + "�����ӭq�����");

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
	public HcOrderDetailVO findByPrimaryKey(String orderDetailNo) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		HcOrderDetailVO HcOrderDetailVO = new HcOrderDetailVO();

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ONE_STMT);
			pstmt.setString(1, orderDetailNo);

			rs = pstmt.executeQuery();
			if (rs.next()) {
				HcOrderDetailVO.setOrderDetailNo(rs.getString("ORDER_DETAIL_NO"));
				HcOrderDetailVO.setOrderNo(rs.getString("ORDER_NO"));
				HcOrderDetailVO.setServiceDate(rs.getDate("SERVICE_DATE"));
				HcOrderDetailVO.setServiceTime(rs.getString("SERVICE_TIME"));
				HcOrderDetailVO.setEmpNo(rs.getString("EMP_NO"));
				HcOrderDetailVO.setOrderDetailStatus(rs.getString("ORDER_DEDIAL_STATUS"));
			}
			return HcOrderDetailVO;

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
		return HcOrderDetailVO;
	}

	@Override
	public List<HcOrderDetailVO> getAll() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<HcOrderDetailVO> hcOrderDetailList = new ArrayList();

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				HcOrderDetailVO HcOrderDetailVO = new HcOrderDetailVO();
				HcOrderDetailVO.setOrderDetailNo(rs.getString("ORDER_DETAIL_NO"));
				HcOrderDetailVO.setOrderNo(rs.getString("ORDER_NO"));
				HcOrderDetailVO.setServiceDate(rs.getDate("SERVICE_DATE"));
				HcOrderDetailVO.setServiceTime(rs.getString("SERVICE_TIME"));
				HcOrderDetailVO.setEmpNo(rs.getString("EMP_NO"));
				HcOrderDetailVO.setOrderDetailStatus(rs.getString("ORDER_DEDIAL_STATUS"));
				hcOrderDetailList.add(HcOrderDetailVO);
			}
			return hcOrderDetailList;

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

		return hcOrderDetailList;
	}

	@Override
	public List<HcOrderDetailVO> getByEmpNo(String empNo) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<HcOrderDetailVO> hcOrderDetailList = new ArrayList();

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_EMP_NO);
			pstmt.setString(1,empNo);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				HcOrderDetailVO HcOrderDetailVO = new HcOrderDetailVO();
				HcOrderDetailVO.setOrderDetailNo(rs.getString("ORDER_DETAIL_NO"));
				HcOrderDetailVO.setOrderNo(rs.getString("ORDER_NO"));
				HcOrderDetailVO.setServiceDate(rs.getDate("SERVICE_DATE"));
				HcOrderDetailVO.setServiceTime(rs.getString("SERVICE_TIME"));
				HcOrderDetailVO.setEmpNo(rs.getString("EMP_NO"));
				HcOrderDetailVO.setOrderDetailStatus(rs.getString("ORDER_DEDIAL_STATUS"));
				HcOrderDetailVO.setMemNo(rs.getString("MEM_NO"));
				
				TheCaredVO theCaredVO = new TheCaredVO();
				theCaredVO.setCaredName(rs.getString("CARED_NAME"));
				theCaredVO.setCaredAddress(rs.getString("CARED_ADDRESS"));
				theCaredVO.setCaredPhone(rs.getString("CARED_PHONE"));
				HcOrderDetailVO.setTheCaredVO(theCaredVO);
				
				hcOrderDetailList.add(HcOrderDetailVO);
			}
			return hcOrderDetailList;

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
		return hcOrderDetailList;
	}

}
