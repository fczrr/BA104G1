package com.dish.model;

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

public class DishDAO implements DishDAO_interface {
	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/BA104G1DB");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	private static final String INSERT_STMT = "INSERT INTO DISH (DISH_NO,DISH_NAME,DISH_PIC,DISH_INTRO,DISH_TYPE) VALUES ( dish_seq.NEXTVAL, ?, ?, ?, ?)";
	private static final String UPDATE = "UPDATE DISH SET DISH_NAME=?,DISH_PIC=?,DISH_INTRO=?,DISH_TYPE=? WHERE DISH_NO=?";
	private static final String GET_ONE_STMT = "SELECT DISH_NO,DISH_NAME,DISH_PIC,DISH_INTRO,DISH_TYPE FROM DISH WHERE DISH_NO=?";
	private static final String GET_ALL_STMT = "SELECT DISH_NO,DISH_NAME,DISH_PIC,DISH_INTRO,DISH_TYPE FROM DISH ORDER BY DISH_NO";
	private static final String GET_ALLBYTYPE_STMT = "SELECT DISH_NO,DISH_NAME,DISH_PIC,DISH_INTRO,DISH_TYPE FROM DISH WHERE DISH_TYPE=? ORDER BY DISH_NO";
	private static final String DELETE = "DELETE FROM DISH WHERE DISH_NO=?";

	@Override
	public void insert(DishVO dishVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setString(1, dishVO.getDishName());
			pstmt.setBytes(2, dishVO.getDishPic());
			pstmt.setString(3, dishVO.getDishIntro());
			pstmt.setString(4, dishVO.getDishType());

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
	public void update(DishVO dishVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setString(1, dishVO.getDishName());
			pstmt.setBytes(2, dishVO.getDishPic());
			pstmt.setString(3, dishVO.getDishIntro());
			pstmt.setString(4, dishVO.getDishType());
			pstmt.setInt(5, dishVO.getDishNo());

			pstmt.executeUpdate();

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
	public List<DishVO> getAll() {
		List<DishVO> list = new ArrayList<DishVO>();
		DishVO dishVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				// empVO 銋迂� Domain objects
				dishVO = new DishVO();
				dishVO.setDishNo(rs.getInt("DISH_NO"));
				dishVO.setDishName(rs.getString("DISH_NAME"));
				dishVO.setDishPic(rs.getBytes("DISH_PIC"));
				dishVO.setDishIntro(rs.getString("DISH_INTRO"));
				dishVO.setDishType(rs.getString("DISH_TYPE"));
				list.add(dishVO); // Store the row in the list
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
	public List<DishVO> getByType(String dishType) {
		List<DishVO> list = new ArrayList<DishVO>();
		DishVO dishVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALLBYTYPE_STMT);

			pstmt.setString(1, dishType);

			rs = pstmt.executeQuery();

			while (rs.next()) {

				dishVO = new DishVO();
				dishVO.setDishNo(rs.getInt("DISH_NO"));
				dishVO.setDishName(rs.getString("DISH_NAME"));
				dishVO.setDishPic(rs.getBytes("DISH_PIC"));
				dishVO.setDishIntro(rs.getString("DISH_INTRO"));
				dishVO.setDishType(rs.getString("DISH_TYPE"));
				list.add(dishVO); // Store the row in the list
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
	public DishVO findByPrimaryKey(Integer dishNo) {

		DishVO dishVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setInt(1, dishNo);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				// empVo 銋迂� Domain objects
				dishVO = new DishVO();
				dishVO.setDishNo(rs.getInt("DISH_NO"));
				dishVO.setDishName(rs.getString("DISH_NAME"));
				dishVO.setDishPic(rs.getBytes("DISH_PIC"));
				dishVO.setDishIntro(rs.getString("DISH_INTRO"));
				dishVO.setDishType(rs.getString("DISH_TYPE"));
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
		return dishVO;
	}

	@Override
	public void delete(Integer dishNo) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(DELETE);

			pstmt.setInt(1, dishNo);

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

}
