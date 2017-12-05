package com.android.setMeal.model;

import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.NamingException;
import javax.sql.DataSource;

import java.io.*;
import java.sql.*;

public class SetMealDAO implements SetMealDAO_interface {

	private static DataSource ds = null;

	private static final String GET_ALL = "SELECT * FROM SET_MEAL";
	private static final String GET_IMG = "SELECT SM_PIC1 FROM SET_MEAL WHERE SM_NO=?";
	private static final String GET_ONE_SET_MEAL = "SELECT SM_NAME,SM_PRICE,SUPPLY,SM_INTRO FROM SET_MEAL WHERE SM_NO=?";
	private static final String INSERT = "INSERT INTO SET_MEAL(SM_NO,SM_NAME,SM_PRICE,SUPPLY,SM_PIC1,SM_INTRO)"
			+ "VALUES(setMeal_seq.NEXTVAL,?,?,?,?,?);";
	
	static {
		try {
			Context ctx = new javax.naming.InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/BA104G1DB");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
		
	@Override
	public List<SetMealVO> getAll() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<SetMealVO> setMealList = new ArrayList();

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				SetMealVO setMealVO = new SetMealVO();
				setMealVO.setSmNo(rs.getInt("SM_NO"));
				setMealVO.setSmName(rs.getString("SM_NAME"));
				setMealVO.setSmPrice(rs.getInt("SM_PRICE"));
				setMealVO.setSupply(rs.getInt("SUPPLY"));
				setMealVO.setSmIntro(rs.getString("SM_INTRO"));
				setMealList.add(setMealVO);
			}
			return setMealList;
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
		return setMealList;
	}

	@Override
	public byte[] getImgByNo(Integer smNo) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		byte[] img = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_IMG);
			pstmt.setInt(1, smNo);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				img = rs.getBytes("SM_PIC1");
			}
			return img;
		}catch (SQLException e) {
			
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
		return img;
	}

	@Override
	public void insert(SetMealVO setMealVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT);
			pstmt.setString(1,setMealVO.getSmName());
			pstmt.setInt(2, setMealVO.getSmPrice());
			pstmt.setInt(3, setMealVO.getSupply());
			pstmt.setBytes(4, setMealVO.getSmPic1());
			pstmt.setString(5, setMealVO.getSmIntro());
			int i = pstmt.executeUpdate();
			System.out.println("新增一筆套餐");
			
		} catch (SQLException e) {
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
	}

	@Override
	public SetMealVO getOneByNo(Integer smNo) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		SetMealVO setMealVO = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ONE_SET_MEAL);
			pstmt.setInt(1, smNo);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				System.out.println("查套餐");
				setMealVO = new SetMealVO();
				setMealVO.setSmNo(smNo);
				setMealVO.setSmName(rs.getString("SM_NAME"));
				setMealVO.setSmPrice(rs.getInt("SM_PRICE"));
				setMealVO.setSupply(rs.getInt("SUPPLY"));
				setMealVO.setSmIntro(rs.getString("SM_INTRO"));
			}
		}catch (SQLException e) {
			
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
		return setMealVO;
	}

}
