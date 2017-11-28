package com.shop.tool;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.shop.model.*;
public class Test {

	public static void main(String[] args) {
		
		System.out.println(new java.sql.Date(1508170997424L));
		System.out.println(new java.sql.Date(1871222400L));

		System.out.println(new java.sql.Date(System.currentTimeMillis()));
		System.out.println(new java.sql.Date(System.currentTimeMillis()).getTime());
		
		ShopVO shopvo;
		ShopVO shopvo2;
		
		Vector<ShopVO> list =new Vector<ShopVO>();
		Vector<ShopVO> list2 =new Vector<ShopVO>();
		ArrayList<String> words = new ArrayList<String>();
		
		for(int i=0;i<5;i++){
			shopvo=new ShopVO();
			shopvo.setDES("測試"+i);
			shopvo.setITEMNO(0);
			list.add(shopvo);
			list.setElementAt(shopvo, i);
		}
		System.out.println(list.get(1).getDES());
		shopvo2=new ShopVO();
		shopvo2.setDES("測試0");
		shopvo2.setITEMNO(0);
		
		System.out.println(list.removeElement(shopvo2));
		System.out.println(list.size());
		System.out.println(list.get(0));
		System.out.println(list.get(1));
		System.out.println(list.get(2));
		System.out.println(list.get(3));
//		//刪除成功
//		String sqltext="SELECT OT.ORDERNO,OT.ITEMNO,ORDERCOUNT,MEM_NO,ORDER_DATE,CUSTOMER_ADDRESS,CUSTOMER_PHONE,CUSTOMER_NAME,SP.NAME,SP.PRICE,PD.PRICE AS NEWPRICE FROM SHOPORDER S JOIN ORDERDETAIL OT  ON (OT.ORDERNO = S.ORDERNO) JOIN SHOPPINGMALL SP  ON SP.ITEMNO = OT.ITEMNO JOIN PROMOTIONDETAIL PD ON SP.ITEMNO=PD.ITEMNO WHERE OT.ORDERNO='20171025-000040'";
//		DataSource ds = null;
//		Connection con = null;
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//			try {
//				Context ctx = new InitialContext();
//				ds = (DataSource) ctx.lookup("java:comp/env/jdbc/TestDB");
//				try {
//					con=ds.getConnection();
//					pstmt=con.prepareStatement(sqltext);
//					rs=pstmt.executeQuery();
//					System.out.println(rs.wasNull());
//					
//				} catch (SQLException e) {
//					// TODO Auto-generated catch block
//					e.printStackTrace();
//				}
//				
//				
//			} catch (NamingException e) {
//				e.printStackTrace();
//				
//		}
			
			
		
		
	}

}
