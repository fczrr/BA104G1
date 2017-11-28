package com.employee_photo.model;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class EmpPhotosDAO implements EmpPhotosDAO_interface {
	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/BA104G1DB");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	private static final String INSERT_STMT = 
		"insert into emp_photos (EMP_PHOTO_NO,EMP_NO,EMP_PHOTO) "
		+ "VALUES (to_char('EPHMEM'||LPAD(to_char(SEQ_EMPPHOTONO.NEXTVAL),4,'0')),?,?)";
	private static final String GET_ALL_STMT =
			"select * from emp_photos";
	private static final String GET_ALL_BY_EMPNO = 
			"select * from emp_photos where EMP_NO=?";
	private static final String GET_ONE_STMT = 
		"select * from emp_photos where EMP_PHOTO_NO = ?";
	private static final String UPDATE = 
		"update emp_photos set  EMP_NO=?, EMP_PHOTO = ? where EMP_PHOTO_NO = ?";
	
	private static final String DELETE = 
			"DELETE from emp_photos where EMP_PHOTO_NO = ?";

	@Override
	public void insert(EmpPhotosVO EmpPhotos) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		
		try {
			  
			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT_STMT);
			pstmt.setString(1, EmpPhotos.getEmpNo());
			pstmt.setBytes(2, EmpPhotos.getEmpPhoto());

			int i =pstmt.executeUpdate();
			System.out.println("新增"+i+"一筆");
			
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
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
	public void update(EmpPhotosVO EmpPhotos) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		
		try {
			  
			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE);
			pstmt.setString(1, EmpPhotos.getEmpNo());
			pstmt.setBytes(2, EmpPhotos.getEmpPhoto());
			pstmt.setString(3, EmpPhotos.getEmpPhtoNo());

			int i =pstmt.executeUpdate();
			System.out.println("修改"+i+"一筆");
			
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
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
	public void delete(String empPhotoNo) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		
		try {
			  
			con = ds.getConnection();
			pstmt = con.prepareStatement(DELETE);
			pstmt.setString(1, empPhotoNo);


			int i =pstmt.executeUpdate();
			System.out.println("刪除"+i+"一筆");
			
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
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
	public EmpPhotosVO findByPK(String empPhotoNo) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;  
		EmpPhotosVO empPhotosVO =null;
		
		try {
			  
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ONE_STMT);
			pstmt.setString(1, empPhotoNo);


			rs = pstmt.executeQuery();
			while(rs.next()){
				empPhotosVO = new EmpPhotosVO();
				empPhotosVO.setEmpPhtoNo(rs.getString("Emp_Photo_no"));
				empPhotosVO.setEmpNo(rs.getString("EMP_NO"));
				empPhotosVO.setEmpPhoto(rs.getBytes("EMP_PHOTO"));
			}
			
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
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
		
		return empPhotosVO;
	}


	@Override
	public List<EmpPhotosVO> getAllByEMPNO(String empNo) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;  
		List<EmpPhotosVO> list = new ArrayList<EmpPhotosVO>();
		
		try {
			  
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_BY_EMPNO );
			pstmt.setString(1, empNo);


			rs = pstmt.executeQuery();
			while(rs.next()){
				EmpPhotosVO empPhotosVO = new EmpPhotosVO();
				empPhotosVO.setEmpPhtoNo(rs.getString("Emp_Photo_no"));
				empPhotosVO.setEmpNo(rs.getString("EMP_NO"));
				empPhotosVO.setEmpPhoto(rs.getBytes("EMP_PHOTO"));
				list.add(empPhotosVO);
			}
			
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
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
	public List<EmpPhotosVO> getAll() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;  
		List<EmpPhotosVO> list = new ArrayList<EmpPhotosVO>();
		
		try {
			  
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_STMT );

			rs = pstmt.executeQuery();
			while(rs.next()){
				EmpPhotosVO empPhotosVO = new EmpPhotosVO();
				empPhotosVO.setEmpPhtoNo(rs.getString("Emp_Photo_no"));
				empPhotosVO.setEmpNo(rs.getString("EMP_NO"));
				empPhotosVO.setEmpPhoto(rs.getBytes("EMP_PHOTO"));
				list.add(empPhotosVO);
				System.out.println("yea  get one EmpPhotosVO");
			}
			
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
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
	
	public static void main(String[] args) throws IOException {
		// TODO Auto-generated method stub
		EmpPhotosDAO dao = new EmpPhotosDAO();
		
//		EmpPhotosVO empPhotosVO = new EmpPhotosVO();
//		empPhotosVO.setEmpPhtoNo("EPHMEM0001");
//		empPhotosVO.setEmpNo("EMP0003");
//		empPhotosVO.setEmpPhoto(getPictureByteArray("D:\\BA104_webApp\\worksapce_for_BA104G1\\BA104G1-1\\WebContent\\front-end\\image\\a001.jpg"));
//		
//		dao.insert(empPhotosVO);
//		dao.update(empPhotosVO);
//		dao.delete("EPHMEM0021");
		
//		EmpPhotosVO empPhotosVO2 = dao.findByPK("EPHMEM0024");
//		System.out.println(empPhotosVO2.getEmpNo());
//		System.out.println(empPhotosVO2.getEmpPhtoNo());
//		System.out.println(empPhotosVO2.getEmpPhoto());
		
		List<EmpPhotosVO> list = dao.getAll();
		for(EmpPhotosVO empPhotosVO1 : list){
			System.out.println("-------------------------------");
			System.out.println(empPhotosVO1.getEmpNo());
			System.out.println(empPhotosVO1.getEmpPhtoNo());
			System.out.println(empPhotosVO1.getEmpPhoto());
		}
		
		
		

	}
	
	public static byte[] getPictureByteArray(String path) throws IOException {
		FileInputStream fis = new FileInputStream(new File(path));
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
