package com.mealorderdetail.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class MealOrderDetailDAO implements MealOrderDetailDAO_interface {
	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/BA104G1DB");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	private static final String GET_ALL_BY_MO_NO = "SELECT * FROM MEAL_ORDER_DETAIL WHERE MO_NO=? ORDER BY MO_DETAIL_NO";

	@Override
	public List<MealOrderDetailVO> getAllByMealOrderNo(String moNo) {
		List<MealOrderDetailVO> list = new ArrayList<>();
		MealOrderDetailVO mealOrderDetailVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_BY_MO_NO);
			pstmt.setString(1, moNo);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				mealOrderDetailVO = new MealOrderDetailVO();
				mealOrderDetailVO.setMoDetailNo(rs.getString("MO_DETAIL_NO"));
				mealOrderDetailVO.setMoNo(rs.getString("MO_NO"));
				mealOrderDetailVO.setDeliverDate(rs.getDate("DELIVER_DATE"));
				mealOrderDetailVO.setMealTime(rs.getString("MEALTIME"));
				mealOrderDetailVO.setSmNo(rs.getInt("SM_NO"));
				mealOrderDetailVO.setOrderQty(rs.getInt("ORDER_QTY"));
				list.add(mealOrderDetailVO);
			}

			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
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

}
