package com.detail.promotion;

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

import com.shop.model.ShopVO;

public class ProDAO implements ProDAO_interface{
	private static final String PUT_SHOP_TO_PROMOTION="INSERT INTO PROMOTIONDETAIL (PROMOTIONNO,ITEMNO,PRICE) VALUES(?,?,?)";
	private static final String FIND_ALL_PRO="SELECT * FROM PROMOTION ORDER BY PROMOTIONNO";
	private static final String GET_ONE_PRO_SHOP="SELECT P.PROMOTIONNO,P.ITEMNO,P.PRICE,PT.NAME,BEGINDATE,ENDDATE,SP.NAME AS SHOPNAME,SP.DES,SP.PRICE AS OLDPRICE,SP.STOCK FROM PROMOTIONDETAIL P JOIN PROMOTION PT ON (P.PROMOTIONNO = PT.PROMOTIONNO) JOIN SHOPPINGMALL SP  ON SP.ITEMNO = P.ITEMNO where to_char(BEGINDATE,'yyyymmdd')<=to_char(sysdate,'yyyymmdd') and to_char(ENDDATE,'yyyymmdd')>=to_char(sysdate,'yyyymmdd') and P.ITEMNO=?";
	private static final String INSERT_STMT = "INSERT INTO PROMOTION (PROMOTIONNO,NAME,BEGINDATE,ENDDATE) VALUES(FORPROMOTION.NEXTVAL,?,?,?)";
	private static final String INSERT_STMT2 = "UPDATE PROMOTION set NAME=? WHERE PROMOTIONNO=?";
	private static final String GET_ALL_PRO_SHOP =
"SELECT P.PROMOTIONNO,P.ITEMNO,P.PRICE,PT.NAME,BEGINDATE,ENDDATE,SP.NAME AS SHOPNAME,SP.DES,STATE,SP.PRICE AS OLDPRICE FROM PROMOTIONDETAIL P JOIN PROMOTION PT ON (P.PROMOTIONNO = PT.PROMOTIONNO) JOIN SHOPPINGMALL SP  ON SP.ITEMNO = P.ITEMNO WHERE STATE=1 ORDER BY PT.NAME";
	private static final String GET_ALL_STMT_BY_NOW ="SELECT P.PROMOTIONNO,P.ITEMNO,P.PRICE,PT.NAME,BEGINDATE,ENDDATE,SP.NAME AS SHOPNAME,SP.DES,SP.PRICE AS OLDPRICE,SP.STOCK FROM PROMOTIONDETAIL P JOIN PROMOTION PT ON (P.PROMOTIONNO = PT.PROMOTIONNO) JOIN SHOPPINGMALL SP  ON SP.ITEMNO = P.ITEMNO where SP.STATE=1 and to_char(BEGINDATE,'yyyymmdd')<=to_char(sysdate,'yyyymmdd') and to_char(ENDDATE,'yyyymmdd')>=to_char(sysdate,'yyyymmdd')";
			private static final String GET_ONE_STMT =
"SELECT P.PROMOTIONNO, ITEMNO, PRICE,NAME,BEGINDATE,ENDDATE FROM PROMOTIONDETAIL P JOIN PROMOTION PT ON P.PROMOTIONNO = PT.PROMOTIONNO WHERE ITEMNO=?";
	private static final String activity="SELECT NAME FROM PROMOTION";
	private static final String DELETE = "DELETE  FROM PROMOTIONDETAIL where ITEMNO =?";
	private static final String UPDATE = "UPDATE PROMOTIONDETAIL set  PROMOTIONNO=?,  PRICE=?  where ITEMNO =?";
	private static final String UPDATE_TO_POR = "UPDATE PROMOTION set  NAME=?,BEGINDATE=?,ENDDATE=?  where PROMOTIONNO =?";
	private static final String GET_PRO_PROJECT_NOW = "SELECT PROMOTIONNO,NAME,BEGINDATE,ENDDATE FROM PROMOTION where to_char(BEGINDATE,'yyyymmdd')<=to_char(sysdate,'yyyymmdd') and to_char(ENDDATE,'yyyymmdd')>=to_char(sysdate,'yyyymmdd')";
	
	private static DataSource ds = null;
	
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/BA104G1DB");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	@Override
	public List<ProVO> activity() {
		List<ProVO> list = new ArrayList<ProVO>();
		ProVO proVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(activity);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				proVO=new ProVO();
				proVO.setACTIVITYNAME(rs.getString("NAME"));
				list.add(proVO);
			}

			// Handle any driver errors
		} catch (SQLException se) {
			System.out.println("全體促銷商品名稱查詢失敗");
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
	public void insert(ProVO proVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			
			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT_STMT);
			pstmt.setString(1, proVO.getNAME());
			pstmt.setDate(2, proVO.getBEGINDATE());
			pstmt.setDate(3, proVO.getENDDATE());
			pstmt.executeUpdate();
	
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("ProDAO新增促銷專案錯誤");
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
	public void update(ProVO proVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			//到目前為止還沒有傳日期進去要記得實做
			con = ds.getConnection();
			
			pstmt = con.prepareStatement(UPDATE);

			System.out.println("22222222222222222proVO.getBEGINDATE():"+proVO.getBEGINDATE());
			System.out.println("22222222222222222proVO.getENDDATE():"+proVO.getENDDATE());
			
			pstmt.setInt(1, proVO.getPROMOTIOMNO());
			pstmt.setInt(2, proVO.getPRICE());
			pstmt.setInt(3, proVO.getITEMNO());
			
			pstmt.executeUpdate();
			pstmt.clearParameters();
			
			pstmt = con.prepareStatement(UPDATE_TO_POR);
			pstmt.setString(1, proVO.getNAME());
			pstmt.setDate(2,proVO.getBEGINDATE());
			pstmt.setDate(3,proVO.getENDDATE());
			pstmt.setInt(4,proVO.getPROMOTIOMNO());
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("ProDAO.update修改錯誤");
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
	public void delete(Integer proVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(DELETE);

			pstmt.setInt(1, proVO);
		} catch (SQLException se) {
			System.out.println("刪除錯誤");
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
	public ProVO findByPrimaryKey(Integer pk) {
		
		ProVO proVO =null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ONE_STMT);
			pstmt.setInt(1, pk);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				proVO=new ProVO();
				proVO.setITEMNO(rs.getInt("ITEMNO"));
				proVO.setPROMOTIOMNO(rs.getInt("PROMOTIONNO"));
				proVO.setPRICE(rs.getInt("PRICE"));
				proVO.setBEGINDATE(rs.getDate("BEGINDATE"));
				proVO.setENDDATE(rs.getDate("ENDDATE"));
				proVO.setNAME(rs.getString("NAME"));
		//		proVO.setACTIVITYNAME(rs.getString("NAME"));
				
				// proVO 也稱為 Domain objects
			}

			// Handle any driver errors
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
		return proVO;
	}

	public List<ProVO> findByPrimaryKeyByString(String pk) {
		List<ProVO> list = new ArrayList<ProVO>();
	
		ProVO proVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement("SELECT P.PROMOTIONNO, ITEMNO, PRICE,NAME,BEGINDATE,ENDDATE FROM PROMOTIONDETAIL P JOIN PROMOTION PT ON P.PROMOTIONNO = PT.PROMOTIONNO WHERE NAME='"+pk+"'");

		//	pstmt.setString(1, pk);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				proVO=new ProVO();
				proVO.setPROMOTIOMNO(rs.getInt("PROMOTIONNO"));
				proVO.setITEMNO(rs.getInt("ITEMNO"));
				proVO.setPRICE(rs.getInt("PRICE"));
				proVO.setNAME(rs.getString("NAME"));
				proVO.setBEGINDATE(rs.getDate("BEGINDATE"));
				proVO.setENDDATE(rs.getDate("ENDDATE"));

				// empVo 也稱為 Domain objects
				list.add(proVO);
			}

			// Handle any driver errors
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
		return list;
	}
//findByPrimaryKey
	@Override
	public ProVO getOneEmpForStringName(String PK) {


		ProVO proVO =null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement("SELECT P.PROMOTIONNO,P.ITEMNO,P.PRICE,PT.NAME,BEGINDATE,ENDDATE,SP.NAME AS SHOPNAME,SP.DES,SP.PRICE AS OLDPRICE FROM PROMOTIONDETAIL P JOIN PROMOTION PT ON (P.PROMOTIONNO = PT.PROMOTIONNO) JOIN (SELECT * FROM SHOPPINGMALL WHERE NAME='"+PK+"')SP  ON SP.ITEMNO = P.ITEMNO");
			rs = pstmt.executeQuery();
			while (rs.next()) {
				proVO=new ProVO();
				proVO.setOLDPRICE(rs.getInt("OLDPRICE"));
				proVO.setDES(rs.getString("DES"));
				proVO.setITEMNO(rs.getInt("ITEMNO"));
				proVO.setPROMOTIOMNO(rs.getInt("PROMOTIONNO"));
				proVO.setPRICE(rs.getInt("PRICE"));
				proVO.setBEGINDATE(rs.getDate("BEGINDATE"));
				proVO.setENDDATE(rs.getDate("ENDDATE"));
				proVO.setNAME(rs.getString("NAME"));
				proVO.setSHOPNAME(rs.getString("SHOPNAME"));
		//		proVO.setACTIVITYNAME(rs.getString("NAME"));
				
				// proVO 也稱為 Domain objects
			}

			// Handle any driver errors
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
		return proVO;
	}

	@Override
	public ProVO getOneOnItemNO(int itemno) {
		
		ProVO proVO =null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement("SELECT P.PROMOTIONNO, ITEMNO, PRICE,NAME,BEGINDATE,ENDDATE FROM PROMOTIONDETAIL P JOIN PROMOTION PT ON P.PROMOTIONNO = PT.PROMOTIONNO WHERE ITEMNO='"+itemno+"'");
			rs = pstmt.executeQuery();
			while (rs.next()) {
				proVO=new ProVO();
				proVO.setITEMNO(rs.getInt("ITEMNO"));
				proVO.setPROMOTIOMNO(rs.getInt("PROMOTIONNO"));
				proVO.setPRICE(rs.getInt("PRICE"));
				proVO.setBEGINDATE(rs.getDate("BEGINDATE"));
				proVO.setENDDATE(rs.getDate("ENDDATE"));
				proVO.setNAME(rs.getString("NAME"));
		//		proVO.setACTIVITYNAME(rs.getString("NAME"));
				
				// proVO 也稱為 Domain objects
			}

			// Handle any driver errors
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
		return proVO;
	}

	//此方法取得所有促銷中的商品
	@Override
	public List<ProVO> getAllProNow() {
		List<ProVO> list = new ArrayList<ProVO>();
		ProVO proVO = null;
	
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_STMT_BY_NOW);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				proVO=new ProVO();
				proVO.setITEMNO(rs.getInt("ITEMNO"));
				proVO.setPROMOTIOMNO(rs.getInt("PROMOTIONNO"));
				proVO.setPRICE(rs.getInt("PRICE"));
				proVO.setBEGINDATE(rs.getDate("BEGINDATE"));
				proVO.setENDDATE(rs.getDate("ENDDATE"));
				proVO.setNAME(rs.getString("NAME"));
				proVO.setSHOPNAME(rs.getString("SHOPNAME"));
				proVO.setDES(rs.getString("DES"));
				proVO.setOLDPRICE(rs.getInt("OLDPRICE"));
				proVO.setQuantity(rs.getInt("STOCK"));
				// proVO 也稱為 Domain objects
				list.add(proVO);
			}
	
			// Handle any driver errors
		} catch (SQLException se) {
			System.out.println("全體查尋失敗 :"+se);
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

	//此方法取得所有的促銷活動
	@Override
	public List<ProVO> getAllPro() {
		List<ProVO> list = new ArrayList<ProVO>();
		ProVO proVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(FIND_ALL_PRO);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				proVO=new ProVO();
				proVO.setPROMOTIOMNO(rs.getInt("PROMOTIONNO"));
				proVO.setBEGINDATE(rs.getDate("BEGINDATE"));
				proVO.setENDDATE(rs.getDate("ENDDATE"));
				proVO.setNAME(rs.getString("NAME"));
				// proVO 也稱為 Domain objects
				list.add(proVO);
			}

			// Handle any driver errors
		} catch (SQLException se) {
			System.out.println("查詢全體促銷活動失敗-ProDAO-GetAllPro"+se);
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
	public List<ProVO> getAllProShop() {
		List<ProVO> list = new ArrayList<ProVO>();
		ProVO proVO = null;
	
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_PRO_SHOP);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				proVO=new ProVO();
				proVO.setITEMNO(rs.getInt("ITEMNO"));
				proVO.setPROMOTIOMNO(rs.getInt("PROMOTIONNO"));
				proVO.setPRICE(rs.getInt("PRICE"));
				proVO.setBEGINDATE(rs.getDate("BEGINDATE"));
				proVO.setENDDATE(rs.getDate("ENDDATE"));
				proVO.setNAME(rs.getString("NAME"));
				proVO.setSHOPNAME(rs.getString("SHOPNAME"));
				proVO.setDES(rs.getString("DES"));
				proVO.setOLDPRICE(rs.getInt("OLDPRICE"));
				// proVO 也稱為 Domain objects
				list.add(proVO);
			}
	
			// Handle any driver errors
		} catch (SQLException se) {
			System.out.println("全體查尋失敗 :"+se);
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
	
	public ProVO getOneProShop(Integer itemno) {
		ProVO proVO = null;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ONE_PRO_SHOP);
			pstmt.setInt(1,itemno);
			rs = pstmt.executeQuery();
			System.out.println("進來getOneProShop");
			while (rs.next()) {
				proVO=new ProVO();
				proVO.setITEMNO(rs.getInt("ITEMNO"));
				System.out.println("proVO.getITEMNO() :"+proVO.getITEMNO());
				proVO.setPROMOTIOMNO(rs.getInt("PROMOTIONNO"));
				proVO.setPRICE(rs.getInt("PRICE"));
				proVO.setBEGINDATE(rs.getDate("BEGINDATE"));
				proVO.setENDDATE(rs.getDate("ENDDATE"));
				proVO.setNAME(rs.getString("NAME"));
				proVO.setSHOPNAME(rs.getString("SHOPNAME"));
				proVO.setDES(rs.getString("DES"));
				proVO.setOLDPRICE(rs.getInt("OLDPRICE"));
				// proVO 也稱為 Domain objects
			}
	
			// Handle any driver errors
		} catch (SQLException se) {
			System.out.println("全體查尋失敗 :"+se);
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
		System.out.println("proVO.getITEMNO() :"+proVO.getITEMNO());
		return proVO;
	}

	@Override
	public ProVO getProProjectNow() {
		ProVO proVO = null;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_PRO_PROJECT_NOW);
			rs = pstmt.executeQuery();
			System.out.println("進來GET_PRO_PROJECT_NOW");
			while (rs.next()) {
				proVO=new ProVO();
				proVO.setPROMOTIOMNO(rs.getInt("PROMOTIONNO"));
				proVO.setACTIVITYNAME(rs.getString("NAME"));
				proVO.setBEGINDATE(rs.getDate("BEGINDATE"));
				proVO.setENDDATE(rs.getDate("ENDDATE"));
				// proVO 也稱為 Domain objects
			}
	
			// Handle any driver errors
		} catch (SQLException se) {
			System.out.println("全體查尋失敗 :"+se);
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
		return proVO;
	}

	@Override
	public void putShopInPromotion(Integer promotionno, Integer itemno, Integer price) {

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(PUT_SHOP_TO_PROMOTION);
			pstmt.setInt(1, promotionno);
			pstmt.setInt(2, itemno);
			pstmt.setInt(3, price);
			pstmt.executeUpdate();
			// Handle any driver errors
		} catch (SQLException se) {
			System.out.println("PUT_SHOP_TO_PROMOTION:"+se);
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
	}
}
