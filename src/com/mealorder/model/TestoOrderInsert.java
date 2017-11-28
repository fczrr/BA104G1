package com.mealorder.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;

public class TestoOrderInsert {
	private static final String URL = "jdbc:oracle:thin:@localhost:1521:xe";
	private static final String USER = "XEXEXD";
	private static final String PASSWORD = "XEXEXD";
	private static final String SQL = "INSERT INTO MEAL_ORDER(MO_NO,MEM_NO,MO_STATUS,RCPT_NAME,RCPT_ADD,RCPT_PHONE)"
			+ "VALUES(to_char(sysdate,'yyyymmdd')||'-'||LPAD(to_char(mealOrder_seq.NEXTVAL),6,'0'),?,?,?,?,?)";
	private static final String SQL2 = "INSERT INTO MEAL_ORDER_DETAIL VALUES(to_char(sysdate,'yyyymmdd')||'-'||LPAD(to_char(mealOrderDetail_seq.NEXTVAL),6,'0'),?,?,?,?,?)";

	public static void main(String[] args) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String next_orderid=null;

		try {
			
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection(URL, USER, PASSWORD);
			con.setAutoCommit(false);

			// 先新增訂單
			String[] cols = { "MO_NO" };
			pstmt = con.prepareStatement(SQL, cols);
			pstmt.setString(1, "MEM0001");
			pstmt.setString(2, "未處理");
			pstmt.setString(3, "王八蛋");
			pstmt.setString(4, "台南市新化區全興里101號之3");
			pstmt.setString(5, "0987390693");

			pstmt.executeUpdate();

			ResultSet rs = pstmt.getGeneratedKeys();
			if (rs.next()) {
				next_orderid = rs.getString(1);
				System.out.println("自增主鍵值 = " + next_orderid + "(剛新增成功的訂單編號)");
			} else {
				System.out.println("未取得自增主鍵值");
			}
			rs.close();
	
			String[] str = { "2017-11-02", "2017-11-03", "2017-11-04" };
			PreparedStatement pstmt2 = con.prepareStatement(SQL2);
			for (int i = 0; i < str.length; i++) {
				pstmt2.setString(1, next_orderid);
				pstmt2.setDate(2, java.sql.Date.valueOf(str[i]));
				pstmt2.setString(3, "早餐");
				pstmt2.setInt(4, 10);
				pstmt2.setInt(5, 1);
				pstmt2.executeUpdate();
				pstmt2.clearParameters();
			}

			pstmt2.close();
			con.commit();
			// PreparedStatement pstmt2 = con.prepareStatement(SQL2);
			// pstmt2.setString(1, key);
			// System.out.println(key);
			// pstmt2.setDate(2, java.sql.Date.valueOf("2017-11-02"));
			// pstmt2.setString(3, "早餐");
			// pstmt2.setInt(4, 10);
			// pstmt2.setInt(5, 1);
			// System.out.println("i'm here");
			//
			// pstmt2.executeUpdate();
			//
			// System.out.println("i'm here2");

		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}

			if (con != null) {
				try {
					con.close();
				} catch (SQLException se) {
					System.out.println(se);
				}
			}
		}

	}

}
