package com.android.member.model;

import java.util.*;

import javax.naming.Context;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.google.gson.Gson;

import java.sql.*;

public class BalanceDAO implements BalanceDAO_interface {

	private static final String INSERT_STMT = "INSERT INTO BALANCE (TOPUP_NO, MEM_NO,TOPUP_VALUE,TOPUP_WAY) VALUES "
			+ "(to_char('TPP'||to_char(sysdate,'yymm')||LPAD(to_char(SEQ_EMPLOYEE.NEXTVAL),3,'0')),?,?,?)";

	private static DataSource ds = null;
	static {
		try {
			Context ctx = new javax.naming.InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/BA104G1DB");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void insert(BalanceVO balanceVO) {

		Connection con = null;
		PreparedStatement pstmt = null;
		PreparedStatement ptmt2 = null;
		try {
			System.out.println(new Gson().toJson(balanceVO));
			con = ds.getConnection();
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(INSERT_STMT);
			
			
			pstmt.setString(1, balanceVO.getMemNo());
			pstmt.setInt(2, balanceVO.getTopupValue());
			pstmt.setString(3, balanceVO.getTopupWay());

			int i = pstmt.executeUpdate();
			System.out.println("儲值紀錄"+balanceVO.getTopupValue()+i);

			ptmt2 = con.prepareStatement("update member  set point = (select point from member where mem_no = ?)+? where mem_no = ? ");

			ptmt2.setString(1, balanceVO.getMemNo());
			ptmt2.setInt(2, balanceVO.getTopupValue());
			ptmt2.setString(3, balanceVO.getMemNo());

			int x = ptmt2.executeUpdate();
			
			System.out.println(x+"更新會員點數");
			
			con.commit();
			con.setAutoCommit(true);
			
		} catch (SQLException se) {
			try {
				se.printStackTrace();
				con.rollback();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} finally {
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
