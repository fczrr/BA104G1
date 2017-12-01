package com.shop.tool;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;



public class upload {
	private static final String URL = "jdbc:oracle:thin:@localhost:1521:xe";
	private static final String USER = "BA104G1DB";
	private static final String PASSWORD = "BA104G1DB";
	private static final String INSERT_STMT = "UPDATE ShoppingMall set PICTURE1=? where ITEMNO = ?";
	
	
	public static void main(String[] args) throws SQLException, ClassNotFoundException {
		// TODO Auto-generated method stub
			Connection con = null;
			int j = 1;
			PreparedStatement pstmt = null;
			for(int i=1;i<21;i++){
			try {
				Class.forName("oracle.jdbc.driver.OracleDriver");
				con = DriverManager.getConnection(URL, USER, PASSWORD);
				pstmt = con.prepareStatement(INSERT_STMT);
				byte[] pic1 = getPictureByteArray("WebContent/hotage/"+j+".jpeg");
				System.out.println(pic1.length);
				pstmt.setBytes(1, pic1);
			//	blob.setBytes(1, pic1);
				pstmt.setInt(2, j);
				pstmt.executeUpdate();
				j=j+1;
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
			
//			for(int i=0;i<10;i++){
//			try {
//				Class.forName("oracle.jdbc.driver.OracleDriver");
//				con = DriverManager.getConnection(URL, USER, PASSWORD);
//				pstmt = con.prepareStatement(INSERT_STMT);
//				Blob blob = con.createBlob();
//				byte[] pic1 = getPictureByteArray("WebContent/hotage/1"+k+".jpeg");
//				System.out.println(pic1.length);
//				pstmt.setBytes(1, pic1);
//			//	blob.setBytes(1, pic1);
//				pstmt.setInt(2, 10+k);
//				pstmt.executeUpdate();
//				k=k+1;
//			} catch (IOException e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			}
//		}
	}
	public static byte[] getPictureByteArray(String path) throws IOException {
		File file = new File(path);
		FileInputStream fis = new FileInputStream(file);
		ByteArrayOutputStream baos = new ByteArrayOutputStream();
		byte[] buffer = new byte[8192];
		int i;
		while ((i = fis.read(buffer)) != -1) {
			baos.write(buffer, 0, i);
		}
		baos.close();
		fis.close();

		return baos.toByteArray();
	}
}
