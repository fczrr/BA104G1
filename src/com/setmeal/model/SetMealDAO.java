package com.setmeal.model;

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

public class SetMealDAO implements SetMealDAO_interface {
	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/BA104G1DB");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	private static final String INSERT_STMT = "INSERT INTO SET_MEAL VALUES(setMeal_seq.NEXTVAL,?,?,?,?,?,?,?)";
	private static final String UPDATE = "UPDATE SET_MEAL SET SM_NAME=?,SM_PRICE=?,SUPPLY=?,SM_PIC1=?,SM_PIC2=?,SM_PIC3=?,SM_INTRO=?WHERE SM_NO=?";
	private static final String DELETE = "DELETE FROM SET_MEAL WHERE SM_NO=?";
	private static final String GET_ONE_STMT = "SELECT * FROM SET_MEAL WHERE SM_NO=?";
	private static final String GET_ALL_STMT = "SELECT * FROM SET_MEAL";

	@Override
	public void insert(SetMealVO setMealVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setString(1, setMealVO.getSmName());
			pstmt.setInt(2, setMealVO.getSmPrice());
			pstmt.setInt(3, setMealVO.getSupply());
			pstmt.setBytes(4, setMealVO.getSmPic1());
			pstmt.setBytes(5, setMealVO.getSmPic2());
			pstmt.setBytes(6, setMealVO.getSmPic3());
			pstmt.setString(7, setMealVO.getSmIntro());

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
	public void update(SetMealVO setMealVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setString(1, setMealVO.getSmName());
			pstmt.setInt(2, setMealVO.getSmPrice());
			pstmt.setInt(3, setMealVO.getSupply());
			pstmt.setBytes(4, setMealVO.getSmPic1());
			pstmt.setBytes(5, setMealVO.getSmPic2());
			pstmt.setBytes(6, setMealVO.getSmPic3());
			pstmt.setString(7, setMealVO.getSmIntro());
			pstmt.setInt(8, setMealVO.getSmNo());

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
	public void delete(Integer smNo) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(DELETE);

			pstmt.setInt(1, smNo);

			pstmt.executeUpdate();

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
	public SetMealVO findByPrimaryKey(Integer smNo) {

		SetMealVO setMealVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setInt(1, smNo);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				// empVo 銋迂� Domain objects
				setMealVO = new SetMealVO();
				setMealVO.setSmNo(rs.getInt("SM_NO"));
				setMealVO.setSmName(rs.getString("SM_NAME"));
				setMealVO.setSmPrice(rs.getInt("SM_PRICE"));
				setMealVO.setSupply(rs.getInt("SUPPLY"));
				setMealVO.setSmPic1(rs.getBytes("SM_PIC1"));
				setMealVO.setSmPic2(rs.getBytes("SM_PIC2"));
				setMealVO.setSmPic3(rs.getBytes("SM_PIC3"));
				setMealVO.setSmIntro(rs.getString("SM_INTRO"));
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
		return setMealVO;
	}

	@Override
	public List<SetMealVO> getAll() {
		List<SetMealVO> list = new ArrayList<SetMealVO>();
		SetMealVO setMealVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				// empVO 銋迂� Domain objects
				setMealVO = new SetMealVO();
				setMealVO.setSmNo(rs.getInt("SM_NO"));
				setMealVO.setSmName(rs.getString("SM_NAME"));
				setMealVO.setSmPrice(rs.getInt("SM_PRICE"));
				setMealVO.setSupply(rs.getInt("SUPPLY"));
				setMealVO.setSmPic1(rs.getBytes("SM_PIC1"));
				setMealVO.setSmPic2(rs.getBytes("SM_PIC2"));
				setMealVO.setSmPic3(rs.getBytes("SM_PIC3"));
				setMealVO.setSmIntro(rs.getString("SM_INTRO"));
				list.add(setMealVO); // Store the row in the list
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
