package com.detail.cart;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class CartDAO implements CartDAO_Interface{

	//用編號找出沒促銷的商品資訊
	private static final String GET_ONE_SHOP="SELECT ITEMNO, STOCK, PRICE, STATE, CLASSNO, NAME, DES ,PICTURE1,PICTURE2,PICTURE3 FROM ShoppingMall where ITEMNO =?";
	//用編號找出有促銷的商品資訊
	private static final String GET_ONE_PROSHOP=
			"SELECT P.PROMOTIONNO,P.ITEMNO,P.PRICE,PT.NAME,BEGINDATE,ENDDATE,SP.NAME AS SHOPNAME,SP.DES FROM PROMOTIONDETAIL P JOIN PROMOTION PT ON (P.PROMOTIONNO = PT.PROMOTIONNO) JOIN (SELECT * FROM SHOPPINGMALL WHERE ITEMNO= ? )SP  ON SP.ITEMNO = P.ITEMNO";
			private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/BA104G1DB");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	public CartVO findshop(Integer number,Integer quantity) {
		CartVO cartVO=null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ONE_SHOP);
			pstmt.setInt(1, number);
			rs = pstmt.executeQuery();
			cartVO = new CartVO();
			cartVO.setQUANTITY(quantity);
			while (rs.next()) {
				cartVO.setITEMNO(number);
				cartVO.setNAME(rs.getString("NAME"));
				cartVO.setPRICE(rs.getInt("PRICE"));
				cartVO.setDES(rs.getString("DES"));
				System.out.println("DAO成功在購物車新增一筆資料");
			}
			
		} catch (SQLException se) {
			System.out.println("單項查尋失敗");
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
		
		return cartVO;
	}
	
	public CartVO findshopbypro(Integer number,Integer quantity) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		CartVO cartVO=null;
		try {
			con = ds.getConnection();
			pstmt=con.prepareStatement(GET_ONE_PROSHOP);
			pstmt.setInt(1, number);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				cartVO=new CartVO();
				cartVO.setITEMNO(number);
				cartVO.setQUANTITY(quantity);
				cartVO.setNAME(rs.getString("SHOPNAME"));
				cartVO.setPRICE(rs.getInt("PRICE"));
				cartVO.setDES(rs.getString("DES"));
			}
			
		} catch (SQLException e) {
			System.out.println("CartDATO促銷商品查詢失敗");
			e.printStackTrace();
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
		
		return cartVO;
	}
}
