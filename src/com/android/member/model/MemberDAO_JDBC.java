package com.android.member.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class MemberDAO_JDBC implements MemberDAO_interface {
	private static final String DRIVER = "oracle.jdbc.driver.OracleDriver";
	private static final String URL = "jdbc:oracle:thin:@localhost:1521:XE";
	private static final String USER = "BA104G1DB";
	private static final String PWD = "123456";

	private static final String INSERT_STMT = "INSERT INTO MEMBER(MEM_NO,MEM_NAME,MEM_PHONE,MEM_GENDER,MEM_EMAIL,ADDRESS,POINT,MEM_ID,MEM_PWD,MEM_SRATUS,CHK_IP,MEM_LOGINTIME)"
			+ "VALUES(to_char('MEM'||LPAD(to_char(SEQ_MEMBER.NEXTVAL),4,'0')),?,?,?,?,?,?,?,?,?,?,?)";
	private static final String GET_ALL_STMT = "SELECT * FROM MEMBER";
	private static final String GET_ONE_STMT = "SELECT * FROM MEMBER WHERE MEM_NO=?";
	private static final String GET_ONE_BY_MEMID = "SELECT * FROM MEMBER WHERE MEM_ID=?";
	private static final String DELETE = "DELETE FROM MEMBER WHERE MEM_NO = ?";
	private static final String UPDATE = "UPDATE MEMBER SET MEM_NAME=? ,MEM_PHONE=?,MEM_GENDER=?,MEM_EMAIL=?,ADDRESS=?,POINT=?,MEM_ID=?,MEM_PWD=?,MEM_SRATUS=?,CHK_IP=?,MEM_LOGINTIME=? WHERE MEM_NO=?";

	static {
		try {
			Class.forName(DRIVER);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public static void main(String[] args) {
		MemberDAO_JDBC MemberDAO_JDBC = new MemberDAO_JDBC();
		MemberVO memberVO = new MemberVO();
		
//		memberVO.setMemNo("MEM0005");
//		memberVO.setMemName("������");
//		memberVO.setMemPhone("99999999");
//		memberVO.setMemGender("�k");
//		memberVO.setMemEmail("zodiac@gmail.com");
//		memberVO.setAddress("��饫���c�Ϥ�����300��");
//		memberVO.setPoint(15000);
//		memberVO.setMemId("zodiac3012");
//		memberVO.setMemPwd("aaaaaa");
//		memberVO.setMemSratus("������");
//		memberVO.setChkIp("140.112.130.9.2");
//		memberVO.setMemLoginTime(new Timestamp(System.currentTimeMillis()));
		
		/*�s�W�|�����*/
//		MemberDAO_JDBC.insert(memberVO);
		
		/*��s�|�����*/
//		MemberDAO_JDBC.update(memberVO);
		
		/*�d�߳浧�|�����*/
//		memberVO = MemberDAO_JDBC.findByPrimaryKey("MEM0005");
//		System.out.println(memberVO);
		
		/*�d�ߥ����|�����*/
//		List<MemberVO> memberList  = MemberDAO_JDBC.getAll();
//		for(MemberVO memVO:memberList){
//			System.out.println(memVO.getMemId());
//			System.out.println();
//		}
		
		/*�R���浧�|�����*/
//		MemberDAO_JDBC.delete("MEM0005");
		
	}

	@Override
	public void insert(MemberVO memberVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = DriverManager.getConnection(URL, USER, PWD);
			pstmt = con.prepareStatement(INSERT_STMT);
			
			pstmt.setString(1, memberVO.getMemName());
			pstmt.setString(2, memberVO.getMemPhone());
			pstmt.setString(3, memberVO.getMemGender());
			pstmt.setString(4, memberVO.getMemEmail());
			pstmt.setString(5, memberVO.getAddress());
			pstmt.setInt(6, memberVO.getPoint());
			pstmt.setString(7, memberVO.getMemId());
			pstmt.setString(8, memberVO.getMemPwd());
			pstmt.setString(9, memberVO.getMemSratus());
			pstmt.setString(10, memberVO.getChkIp());
			pstmt.setTimestamp(11, memberVO.getMemLoginTime());

			int i = pstmt.executeUpdate();
			System.out.println("");

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

	}

	@Override
	public void update(MemberVO memberVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = DriverManager.getConnection(URL,USER,PWD);
			pstmt=con.prepareStatement(UPDATE);
			
			pstmt.setString(1, memberVO.getMemName());
			pstmt.setString(2, memberVO.getMemPhone());
			pstmt.setString(3, memberVO.getMemGender());
			pstmt.setString(4, memberVO.getMemEmail());
			pstmt.setString(5, memberVO.getAddress());
			pstmt.setInt(6, memberVO.getPoint());
			pstmt.setString(7, memberVO.getMemId());
			pstmt.setString(8, memberVO.getMemPwd());
			pstmt.setString(9, memberVO.getMemSratus());
			pstmt.setString(10, memberVO.getChkIp());
			pstmt.setTimestamp(11, memberVO.getMemLoginTime());
			pstmt.setString(12, memberVO.getMemNo());
			
			int i = pstmt.executeUpdate();
			System.out.println("");
			
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
	public MemberVO findByPrimaryKey(String memNo) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		MemberVO memberVO = null;
		
		try {
			con = DriverManager.getConnection(URL,USER,PWD);
			pstmt = con.prepareStatement(GET_ONE_STMT);
			pstmt.setString(1,memNo);
			rs = pstmt.executeQuery();
			if(rs.next()){
				memberVO = new MemberVO();
				memberVO.setMemNo(rs.getString("MEM_NO"));
				memberVO.setMemName(rs.getString("MEM_NAME"));
				memberVO.setMemPhone(rs.getString("MEM_PHONE"));
				memberVO.setMemGender(rs.getString("MEM_GENDER"));
				memberVO.setMemEmail(rs.getString("MEM_EMAIL"));
				memberVO.setAddress(rs.getString("ADDRESS"));
				memberVO.setPoint(rs.getInt("POINT"));
				memberVO.setMemId(rs.getString("MEM_ID"));
				memberVO.setMemPwd(rs.getString("MEM_PWD"));
				memberVO.setMemSratus(rs.getString("MEM_SRATUS"));
				memberVO.setChkIp(rs.getString("CHK_IP"));
				memberVO.setMemLoginTime(rs.getTimestamp("MEM_LOGINTIME"));
			}
			System.out.println("");
			return memberVO;
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
		return memberVO;
	}

	@Override
	public List<MemberVO> getAll() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<MemberVO> memberList = new ArrayList();
		
		try {
			con = DriverManager.getConnection(URL,USER,PWD);
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();
			while(rs.next()){
				MemberVO memberVO = new MemberVO();
				memberVO.setMemNo(rs.getString("MEM_NO"));
				memberVO.setMemName(rs.getString("MEM_NAME"));
				memberVO.setMemPhone(rs.getString("MEM_PHONE"));
				memberVO.setMemGender(rs.getString("MEM_GENDER"));
				memberVO.setMemEmail(rs.getString("MEM_EMAIL"));
				memberVO.setAddress(rs.getString("ADDRESS"));
				memberVO.setPoint(rs.getInt("POINT"));
				memberVO.setMemId(rs.getString("MEM_ID"));
				memberVO.setMemPwd(rs.getString("MEM_PWD"));
				memberVO.setMemSratus(rs.getString("MEM_SRATUS"));
				memberVO.setChkIp(rs.getString("CHK_IP"));
				memberVO.setMemLoginTime(rs.getTimestamp("MEM_LOGINTIME"));
				memberList.add(memberVO);
			}
			return memberList;
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
	
		return memberList;
	}

	@Override
	public void delete(String memNo) {
		Connection con  = null;
		PreparedStatement pstmt = null;
		
		try {
			con = DriverManager.getConnection(URL,USER,PWD);
			pstmt = con.prepareStatement(DELETE);
			pstmt.setString(1, memNo);
			int i = pstmt.executeUpdate();
			
			System.out.println(""+i+"");
			
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
	public MemberVO findByMemId(String memId) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		MemberVO memberVO = null;
		
		try {
			con = DriverManager.getConnection(URL,USER,PWD);
			pstmt = con.prepareStatement(GET_ONE_BY_MEMID);
			pstmt.setString(1,memId);
			rs = pstmt.executeQuery();
			if(rs.next()){
				memberVO = new MemberVO();
				memberVO.setMemNo(rs.getString("MEM_NO"));
				memberVO.setMemName(rs.getString("MEM_NAME"));
				memberVO.setMemPhone(rs.getString("MEM_PHONE"));
				memberVO.setMemGender(rs.getString("MEM_GENDER"));
				memberVO.setMemEmail(rs.getString("MEM_EMAIL"));
				memberVO.setAddress(rs.getString("ADDRESS"));
				memberVO.setPoint(rs.getInt("POINT"));
				memberVO.setMemId(rs.getString("MEM_ID"));
				memberVO.setMemPwd(rs.getString("MEM_PWD"));
				memberVO.setMemSratus(rs.getString("MEM_SRATUS"));
				memberVO.setChkIp(rs.getString("CHK_IP"));
				memberVO.setMemLoginTime(rs.getTimestamp("MEM_LOGINTIME"));
			}
			System.out.println("");
			return memberVO;
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
		return memberVO;
	}

	@Override
	public List<TheCaredVO> getCared(String memNo) {
		// TODO Auto-generated method stub
		return null;
	}

}
