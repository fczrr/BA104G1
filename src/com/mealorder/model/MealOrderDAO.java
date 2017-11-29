package com.mealorder.model;

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

import com.dish.model.DishVO;
import com.mealorderdetail.model.MealOrderDetailVO;

public class MealOrderDAO implements MealOrderDAO_interface {
	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/BA104G1DB");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	private static final String INSERT_STMT = "INSERT INTO MEAL_ORDER(MO_NO,MEM_NO,RCPT_NAME,RCPT_ADD,RCPT_PHONE,MO_STATUS)"
			+ "VALUES(to_char(sysdate,'yyyymmdd')||'-'||LPAD(to_char(mealOrder_seq.NEXTVAL),6,'0'),?,?,?,?,'未處理')";
	private static final String INSERT_STMT2 = "INSERT INTO MEAL_ORDER_DETAIL(MO_DETAIL_NO,MO_NO,DELIVER_DATE,MEALTIME,SM_NO,ORDER_QTY)"
			+ "VALUES(to_char(sysdate,'yyyymmdd')||'-'||LPAD(to_char(mealOrderDetail_seq.NEXTVAL),6,'0'),?,?,?,?,?)";
	private static final String UPDATE = "UPDATE MEAL_ORDER SET MO_STATUS=? WHERE MO_NO=?";
	private static final String DELETE = "DELETE FROM MEAL_ORDER WHERER MO_NO=?";
	private static final String GET_ONE_STMT = "SELECT * FROM MEAL_ORDER WHERE MO_NO=? ";
	private static final String GET_ALL_STMT = "SELECT * FROM MEAL_ORDER ORDER BY MO_NO";
	private static final String GET_ALL_BY_STATUS_STMT = "SELECT * FROM MEAL_ORDER WHERE MO_STATUS=? ORDER BY MO_NO";
	private static final String GET_ALL_BY_MEMBER_STMT = "SELECT * FROM MEAL_ORDER WHERE MEM_NO=? ORDER BY MO_NO";

	@Override 
	public void insert(MealOrderVO mealOrderVO, List<MealOrderDetailVO> mealOrderDetailVOList) {
		Connection con = null;
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		String next_orderid = null;
		try {

			con = ds.getConnection();
			con.setAutoCommit(false);
			String[] cols = { "MO_NO" };
			pstmt = con.prepareStatement(INSERT_STMT, cols);

			pstmt.setString(1, mealOrderVO.getMemNo());
			pstmt.setString(2, mealOrderVO.getRcptName());
			pstmt.setString(3, mealOrderVO.getRcptAdd());
			pstmt.setString(4, mealOrderVO.getRcptPhone());
			int k = pstmt.executeUpdate();
			System.out.println("成功"+k+"筆");
			ResultSet rs = pstmt.getGeneratedKeys();
			if (rs.next()) {
				next_orderid = rs.getString(1);
				System.out.println("自增主鍵值 = " + next_orderid + "(剛新增成功的訂單編號)");
			} else {
				System.out.println("未取得自增主鍵值");
			}
			rs.close();

			pstmt2 = con.prepareStatement(INSERT_STMT2);
			for (int i = 0; i < mealOrderDetailVOList.size(); i++) {
				pstmt2.setString(1, next_orderid);
				pstmt2.setDate(2, mealOrderDetailVOList.get(i).getDeliverDate());
				pstmt2.setString(3, mealOrderDetailVOList.get(i).getMealTime());
				pstmt2.setInt(4, mealOrderDetailVOList.get(i).getSmNo());
				pstmt2.setInt(5, mealOrderDetailVOList.get(i).getOrderQty());
				int e =  pstmt2.executeUpdate();
				System.out.println("成功"+e+"明細");
//				pstmt2.clearParameters();
			}
			pstmt2.close();
			con.commit();
			con.setAutoCommit(true);
		} catch (SQLException se) {
			try {
				con.rollback();
			} catch (SQLException e) {
				throw new RuntimeException("A database error occured. " + se.getMessage());
				// Clean up JDBC resources
			}
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
	public void updateStatus(String moNo, String moStatus) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setString(1, moStatus);
			pstmt.setString(2, moNo);

			pstmt.executeUpdate();

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
	public MealOrderVO findByPrimaryKey(String moNo) {

		MealOrderVO mealOrderVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setString(1, moNo);

			rs = pstmt.executeQuery();

			while (rs.next()) {

				mealOrderVO = new MealOrderVO();
				mealOrderVO.setMoNo(rs.getString("MO_NO"));
				mealOrderVO.setMemNo(rs.getString("MEM_NO"));
				mealOrderVO.setMoDate(rs.getTimestamp("MO_DATE"));
				mealOrderVO.setMoStatus(rs.getString("MO_STATUS"));
				mealOrderVO.setRcptName(rs.getString("RCPT_NAME"));
				mealOrderVO.setRcptAdd(rs.getString("RCPT_ADD"));
				mealOrderVO.setRcptPhone(rs.getString("RCPT_PHONE"));
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
		return mealOrderVO;

	}

	@Override
	public List<MealOrderVO> getAll() {
		List<MealOrderVO> list = new ArrayList<MealOrderVO>();
		MealOrderVO mealOrderVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {

				mealOrderVO = new MealOrderVO();
				mealOrderVO.setMoNo(rs.getString("MO_NO"));
				mealOrderVO.setMemNo(rs.getString("MEM_NO"));
				mealOrderVO.setMoDate(rs.getTimestamp("MO_DATE"));
				mealOrderVO.setMoStatus(rs.getString("MO_STATUS"));
				mealOrderVO.setRcptName(rs.getString("RCPT_NAME"));
				mealOrderVO.setRcptAdd(rs.getString("RCPT_ADD"));
				mealOrderVO.setRcptPhone(rs.getString("RCPT_PHONE"));
				list.add(mealOrderVO); // Store the row in the list
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

	@Override
	public List<MealOrderVO> getByStatus(String moStatus) {
		List<MealOrderVO> list = new ArrayList<MealOrderVO>();
		MealOrderVO mealOrderVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_BY_STATUS_STMT);
			pstmt.setString(1, moStatus);
			rs = pstmt.executeQuery();

			while (rs.next()) {

				mealOrderVO = new MealOrderVO();
				mealOrderVO.setMoNo(rs.getString("MO_NO"));
				mealOrderVO.setMemNo(rs.getString("MEM_NO"));
				mealOrderVO.setMoDate(rs.getTimestamp("MO_DATE"));
				mealOrderVO.setMoStatus(rs.getString("MO_STATUS"));
				mealOrderVO.setRcptName(rs.getString("RCPT_NAME"));
				mealOrderVO.setRcptAdd(rs.getString("RCPT_ADD"));
				mealOrderVO.setRcptPhone(rs.getString("RCPT_PHONE"));
				list.add(mealOrderVO); // Store the row in the list
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
	

	@Override
	public List<MealOrderVO> getByMember(String memNo) {
		List<MealOrderVO> list = new ArrayList<MealOrderVO>();
		MealOrderVO mealOrderVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_BY_MEMBER_STMT);
			pstmt.setString(1, memNo);
			rs = pstmt.executeQuery();

			while (rs.next()) {

				mealOrderVO = new MealOrderVO();
				mealOrderVO.setMoNo(rs.getString("MO_NO"));
				mealOrderVO.setMemNo(rs.getString("MEM_NO"));
				mealOrderVO.setMoDate(rs.getTimestamp("MO_DATE"));
				mealOrderVO.setMoStatus(rs.getString("MO_STATUS"));
				mealOrderVO.setRcptName(rs.getString("RCPT_NAME"));
				mealOrderVO.setRcptAdd(rs.getString("RCPT_ADD"));
				mealOrderVO.setRcptPhone(rs.getString("RCPT_PHONE"));
				list.add(mealOrderVO); // Store the row in the list
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
