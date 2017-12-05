package com.android.mealOrder.model;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.android.mealOrder.model.*;
import com.android.mealOrderDetail.model.MealOrderDetailVO;
import com.android.member.model.MemberVO;
import com.android.setMeal.model.SetMealService;

public class MealOrderDAO implements MealOrderDAO_interface {
	private static DataSource ds;
	private static final String FIND_MEMNO_ORDER = "SELECT * FROM MEAL_ORDER WHERE MEM_NO=?";

	private static final String INSERT_MEAL_ORDER = "INSERT INTO MEAL_ORDER(MO_NO,MEM_NO,MO_DATE,MO_STATUS,RCPT_NAME,RCPT_ADD,RCPT_PHONE)"
			+ "VALUES(to_char(sysdate,'yyyymmdd')||'-'||LPAD(to_char(mealOrder_seq.NEXTVAL),6,'0'),?,?,?,?,?,?)";
	private static final String INSERT_MEAL_DETAIL = "INSERT INTO MEAL_ORDER_DETAIL(MO_DETAIL_NO,MO_NO,DELIVER_DATE,MEALTIME,SM_NO,ORDER_QTY)"
			+ "VALUES(to_char(sysdate,'yyyymmdd')||'-'||LPAD(to_char(mealOrderDetail_seq.NEXTVAL),6,'0'),?,?,?,?,?)";
	private static final String UPDATE_MEMBER_POINT = "UPDATE MEMBER SET POINT = ? WHERE MEM_NO=?";

	private static final String GET_DETAIL_BY_ORDERNO = "SELECT * FROM MEAL_ORDER_DETAIL WHERE MO_NO = ?";

	private static final String GET_ALL_STMT = "SELECT * FROM MEAL_ORDER_DETAIL WHERE DELIVER_DATE=to_date('2017-12-08', 'yyyy-mm-dd')";
	static {
		try {
			Context ctx = new javax.naming.InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/BA104G1DB");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void addMealOrder(MealOrderVO mealOrderVO, MemberVO memberVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String moNo = null;
		try {
			con = ds.getConnection();
			con.setAutoCommit(false);

			String[] cols = { "MO_NO" };

			pstmt = con.prepareStatement(INSERT_MEAL_ORDER, cols);
			pstmt.setString(1, mealOrderVO.getMemNo());
			pstmt.setTimestamp(2, mealOrderVO.getMoDate());
			pstmt.setString(3, mealOrderVO.getMoStatus());
			pstmt.setString(4, mealOrderVO.getRcptName());
			pstmt.setString(5, mealOrderVO.getRcptAdd());
			pstmt.setString(6, mealOrderVO.getRcptPhone());

			pstmt.executeUpdate();
			System.out.println("成功新增送餐訂單");
			rs = pstmt.getGeneratedKeys();
			if (rs.next()) {
				moNo = rs.getString(1);
				System.out.println("moNo" + moNo);
			}
			rs.close();

			for (MealOrderDetailVO mealOrderDetailVO : mealOrderVO.getDetailList()) {
				mealOrderDetailVO.setMoNo(moNo);
				pstmt = con.prepareStatement(INSERT_MEAL_DETAIL);
				pstmt.setString(1, mealOrderDetailVO.getMoNo());
				pstmt.setDate(2, mealOrderDetailVO.getDeliverDate());
				pstmt.setString(3, mealOrderDetailVO.getMealTime());
				pstmt.setInt(4, mealOrderDetailVO.getSmNo());
				pstmt.setInt(5, mealOrderDetailVO.getOrderQty());
				pstmt.executeUpdate();
				System.out.println("成功新增送餐明細");
			}

			// =========儲值============
			pstmt = con.prepareStatement(UPDATE_MEMBER_POINT);
			pstmt.setInt(1, memberVO.getPoint());
			pstmt.setString(2, memberVO.getMemNo());
			pstmt.executeUpdate();
			System.out.println("成功更新會員點數");

			// =======================

			con.commit();
			con.setAutoCommit(true);
		} catch (SQLException e) {
			e.printStackTrace();
			try {
				con.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
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
	public List<MealOrderVO> findByMemNo(String memNo) {
		Connection con = null;
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		ResultSet rs = null;
		ResultSet rs2 = null;
		List<MealOrderVO> orderList = null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(FIND_MEMNO_ORDER);
			pstmt.setString(1, memNo);
			rs = pstmt.executeQuery();
			orderList = new ArrayList<>();
			while (rs.next()) {
				MealOrderVO mealOrderVO = new MealOrderVO();
				mealOrderVO.setMoNo(rs.getString("MO_NO"));
				mealOrderVO.setMemNo(rs.getString("MEM_NO"));
				mealOrderVO.setMoDate(rs.getTimestamp("MO_DATE"));
				mealOrderVO.setMoStatus(rs.getString("MO_STATUS"));
				mealOrderVO.setRcptName(rs.getString("RCPT_NAME"));
				mealOrderVO.setRcptAdd(rs.getString("RCPT_ADD"));
				mealOrderVO.setRcptPhone(rs.getString("RCPT_PHONE"));
				System.out.println("抓出一筆會員訂餐定單");

				pstmt2 = con.prepareStatement(GET_DETAIL_BY_ORDERNO);
				pstmt2.setString(1, mealOrderVO.getMoNo());
				rs2 = pstmt2.executeQuery();
				List<MealOrderDetailVO> list = mealOrderVO.getDetailList();
				while (rs2.next()) {
					MealOrderDetailVO mealOrderDetailVO = new MealOrderDetailVO();
					mealOrderDetailVO.setMoDetailNo(rs2.getString("MO_DETAIL_NO"));
					mealOrderDetailVO.setDeliverDate(rs2.getDate("DELIVER_DATE"));
					mealOrderDetailVO.setMealTime(rs2.getString("MEALTIME"));
					mealOrderDetailVO.setSmNo(rs2.getInt("SM_NO"));
					mealOrderVO.setSetMealVO((new SetMealService()).getOneByNo(rs2.getInt("SM_NO")));
					mealOrderDetailVO.setOrderQty(rs2.getInt("ORDER_QTY"));
					System.out.println("抓出一筆會員訂餐明細");
					list.add(mealOrderDetailVO);
				}
				orderList.add(mealOrderVO);
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
		return orderList;
	}

	@Override
	public List<MealOrderDetailVO> getAll() {
		List<MealOrderDetailVO> detail = new ArrayList<MealOrderDetailVO>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				MealOrderDetailVO mealOrderDetailVO = new MealOrderDetailVO();
				mealOrderDetailVO.setMoDetailNo(rs.getString("MO_DETAIL_NO"));
				mealOrderDetailVO.setDeliverDate(rs.getDate("DELIVER_DATE"));
				mealOrderDetailVO.setMealTime(rs.getString("MEALTIME"));
				mealOrderDetailVO.setSmNo(rs.getInt("SM_NO"));
				mealOrderDetailVO.setOrderQty(rs.getInt("ORDER_QTY"));
				System.out.println("抓出一筆會員訂餐明細");
				detail.add(mealOrderDetailVO);
			}
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
		} finally {
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return detail;
	}
}
