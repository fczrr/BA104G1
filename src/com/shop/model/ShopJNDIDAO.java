package com.shop.model;

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



public class ShopJNDIDAO implements ShopDAO_interface {
	private static final String INSERT_STMT = "INSERT INTO ShoppingMall(ITEMNO, STOCK, PRICE, STATE, CLASSNO, NAME, DES ,PICTURE1,PICTURE2,PICTURE3)  VALUES (?,?,?,?,?,?,?,?,?,?)";
	private static final String DELETE_PRO_SHOP = "DELETE FROM PROMOTIONDETAIL WHERE ITEMNO=? AND PROMOTIONNO=?";
	private static final String GET_ALL_STMT = "SELECT ITEMNO, STOCK, PRICE, STATE, CLASSNO, NAME, DES ,PICTURE1,PICTURE2,PICTURE3 FROM ShoppingMall WHERE STATE=1 order by ITEMNO";
	private static final String GET_ALL_BACK = "SELECT ITEMNO, STOCK, PRICE, STATE, CLASSNO, NAME, DES ,PICTURE1,PICTURE2,PICTURE3 FROM ShoppingMall order by ITEMNO";
	private static final String GET_ONE_STMT = "SELECT ITEMNO, STOCK, PRICE, STATE, CLASSNO, NAME, DES ,PICTURE1,PICTURE2,PICTURE3 FROM ShoppingMall where ITEMNO =?";
	private static final String GET_ONE_STMT_STRING = "SELECT ITEMNO, STOCK, PRICE, STATE, CLASSNO, NAME, DES ,PICTURE1,PICTURE2,PICTURE3 FROM ShoppingMall where NAME =?";
	private static final String DELETE = "DELETE FROM ShoppingMall where ITEMNO = ?";
	private static final String DELETE2 = "DELETE FROM PROMOTIONDETAIL where ITEMNO = ?";
	private static final String CHANGESTATE="UPDATE SHOPPINGMALL  SET STATE =? WHERE ITEMNO=?";
	// 注意table羅及是否有衝突
	private static final String UPDATE = "UPDATE ShoppingMall set  STOCK=?, PRICE=?, STATE=?, CLASSNO=?,NAME=?,DES=?,PICTURE1=?,PICTURE2=?,PICTURE3=? where ITEMNO = ?";
	private static final String UPDATE2 = "UPDATE ShoppingMall set  STOCK=?, PRICE=?,NAME=?,DES=? where ITEMNO = ?";
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
	public void insert(ShopVO shopVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT_STMT);
			pstmt.setInt(1, shopVO.getITEMNO());
			pstmt.setInt(2, shopVO.getSTOCK());
			pstmt.setInt(3, shopVO.getPRICE());
			pstmt.setInt(4, shopVO.getSTATE());
			pstmt.setInt(5, shopVO.getCLASSNO());
			pstmt.setString(6, shopVO.getNAME());
			pstmt.setString(7, shopVO.getDES());
			pstmt.setBytes(8, shopVO.getPicture1());
			pstmt.setBytes(9, shopVO.getPicture2());
			pstmt.setBytes(10, shopVO.getPicture3());
			pstmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("新增錯誤");
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
	public void update(ShopVO shopVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE);
			
			pstmt.setInt(1, shopVO.getSTOCK());
			pstmt.setInt(2, shopVO.getPRICE());
			pstmt.setInt(3, shopVO.getSTATE());
			pstmt.setInt(4, shopVO.getCLASSNO());
			pstmt.setString(5, shopVO.getNAME());
			pstmt.setString(6, shopVO.getDES());
			pstmt.setBytes(7, shopVO.getPicture1());
			pstmt.setBytes(8, shopVO.getPicture2());
			pstmt.setBytes(9, shopVO.getPicture3());
			pstmt.setInt(10, shopVO.getITEMNO());
			pstmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("修改錯誤");
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

	public void update2(ShopVO shopVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE2);

			pstmt.setInt(1, shopVO.getSTOCK());
			pstmt.setInt(2, shopVO.getPRICE());
			pstmt.setString(3, shopVO.getNAME());
			pstmt.setString(4, shopVO.getDES());
			pstmt.setInt(5, shopVO.getITEMNO());
			
			pstmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("修改錯誤");
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
	public void delete(Integer shopVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(DELETE2);
			pstmt.setInt(1, shopVO);
			pstmt.executeUpdate();
			pstmt.clearParameters();
			pstmt = con.prepareStatement(DELETE);
			pstmt.setInt(1, shopVO);
			pstmt.executeUpdate();



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
	public ShopVO findByPrimaryKey(Integer pk) {
		ShopVO shopVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setInt(1, pk);

			rs = pstmt.executeQuery();
			while (rs.next()) {
				shopVO=new ShopVO();
				shopVO.setITEMNO(rs.getInt("ITEMNO"));
				shopVO.setSTOCK(rs.getInt("STOCK"));
				shopVO.setPRICE(rs.getInt("PRICE"));
				shopVO.setSTATE(rs.getInt("STATE"));
				shopVO.setCLASSNO(rs.getInt("CLASSNO"));
				shopVO.setNAME(rs.getString("NAME"));
				shopVO.setDES(rs.getString("DES"));
				shopVO.setPicture1(rs.getBytes("PICTURE1"));
				shopVO.setPicture2(rs.getBytes("PICTURE2"));
				shopVO.setPicture3(rs.getBytes("PICTURE3"));
				// shopVO 也稱為 Domain objects
				
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
		return shopVO;
	}

	public ShopVO findByPrimaryKeyByString(String pk) {
		ShopVO shopVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = ds.getConnection();
//			pstmt = con.prepareStatement("SELECT ITEMNO, STOCK, PRICE, STATE, CLASSNO, NAME, DES ,PICTURE1,PICTURE2,PICTURE3 FROM ShoppingMall where NAME ='"+pk+"'");
			pstmt = con.prepareStatement("SELECT ITEMNO, STOCK, PRICE, STATE, CLASSNO, NAME, DES ,PICTURE1,PICTURE2,PICTURE3 FROM ShoppingMall where NAME LIKE '%"+pk+"%'");

		//	pstmt.setString(1, pk);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				shopVO=new ShopVO();
				shopVO.setITEMNO(rs.getInt("ITEMNO"));
				shopVO.setSTOCK(rs.getInt("STOCK"));
				shopVO.setPRICE(rs.getInt("PRICE"));
				shopVO.setSTATE(rs.getInt("STATE"));
				shopVO.setCLASSNO(rs.getInt("CLASSNO"));
				shopVO.setNAME(rs.getString("NAME"));
				shopVO.setDES(rs.getString("DES"));
				shopVO.setPicture1(rs.getBytes("PICTURE1"));
				shopVO.setPicture2(rs.getBytes("PICTURE2"));
				shopVO.setPicture3(rs.getBytes("PICTURE3"));
				// shopVO 也稱為 Domain objects
				
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
		return shopVO;
	}
	
	@Override
	public List<ShopVO> getAll() {
		List<ShopVO> list = new ArrayList<ShopVO>();
		ShopVO shopVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				shopVO=new ShopVO();
				shopVO.setITEMNO(rs.getInt("ITEMNO"));
				shopVO.setSTOCK(rs.getInt("STOCK"));
				shopVO.setPRICE(rs.getInt("PRICE"));
				shopVO.setSTATE(rs.getInt("STATE"));
				shopVO.setCLASSNO(rs.getInt("CLASSNO"));
				shopVO.setNAME(rs.getString("NAME"));
				shopVO.setDES(rs.getString("DES"));
				shopVO.setPicture1(rs.getBytes("PICTURE1"));
				shopVO.setPicture2(rs.getBytes("PICTURE2"));
				shopVO.setPicture3(rs.getBytes("PICTURE3"));
				// shopVO 也稱為 Domain objects
	
				list.add(shopVO); // Store the row in the list
				//System.out.println("getAll()查詢成功JNDA");
			}

			// Handle any driver errors
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
	public void changeState(Integer pk,Integer state) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(CHANGESTATE);
			pstmt.setInt(1, state);
			pstmt.setInt(2, pk);
			System.out.println("ChangeState開始");
			pstmt.executeUpdate();
			System.out.println("ChangeState完畢");
			pstmt.executeUpdate();
			System.out.println("ChangeState完畢");
		} catch (SQLException se) {
			System.out.println("ChangeState錯誤:"+se);
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
	public List<ShopVO> getAllFromBack() {

			List<ShopVO> list = new ArrayList<ShopVO>();
			ShopVO shopVO = null;

			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;

			try {

				con = ds.getConnection();
				pstmt = con.prepareStatement(GET_ALL_BACK);
				rs = pstmt.executeQuery();

				while (rs.next()) {
					shopVO=new ShopVO();
					shopVO.setITEMNO(rs.getInt("ITEMNO"));
					shopVO.setSTOCK(rs.getInt("STOCK"));
					shopVO.setPRICE(rs.getInt("PRICE"));
					shopVO.setSTATE(rs.getInt("STATE"));
					shopVO.setCLASSNO(rs.getInt("CLASSNO"));
					shopVO.setNAME(rs.getString("NAME"));
					shopVO.setDES(rs.getString("DES"));
					shopVO.setPicture1(rs.getBytes("PICTURE1"));
					shopVO.setPicture2(rs.getBytes("PICTURE2"));
					shopVO.setPicture3(rs.getBytes("PICTURE3"));
					// shopVO 也稱為 Domain objects
		
					list.add(shopVO); // Store the row in the list
					//System.out.println("getAll()查詢成功JNDA");
				}

				// Handle any driver errors
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
	public void deleteProShop(Integer itemno, Integer promotiomno) {

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(DELETE_PRO_SHOP);
			pstmt.setInt(1, itemno);
			pstmt.setInt(2, promotiomno);
			pstmt.executeUpdate();
			// Handle any driver errors
		} catch (SQLException se) {
			throw new RuntimeException("DELETE_PRO_SHOP " + se.getMessage());
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

	@Override
	public List<ShopVO> findByPrimaryKeyByString2(String pkName) {
		List<ShopVO> list = new ArrayList<ShopVO>();
		ShopVO shopVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			//con = ds.getConnection();		pstmt = con.prepareStatement("SELECT ITEMNO, STOCK, PRICE, STATE, CLASSNO, NAME, DES ,PICTURE1,PICTURE2,PICTURE3 FROM ShoppingMall where NAME ='"+pk+"'");
			con = ds.getConnection();
			pstmt = con.prepareStatement("SELECT ITEMNO, STOCK, PRICE, STATE, CLASSNO, NAME, DES ,PICTURE1,PICTURE2,PICTURE3 FROM ShoppingMall where NAME LIKE '%"+pkName+"%'");

			rs = pstmt.executeQuery();
	
			while (rs.next()) {
				shopVO=new ShopVO();
				shopVO.setITEMNO(rs.getInt("ITEMNO"));
				shopVO.setSTOCK(rs.getInt("STOCK"));
				shopVO.setPRICE(rs.getInt("PRICE"));
				shopVO.setSTATE(rs.getInt("STATE"));
				shopVO.setCLASSNO(rs.getInt("CLASSNO"));
				shopVO.setNAME(rs.getString("NAME"));
				shopVO.setDES(rs.getString("DES"));
				shopVO.setPicture1(rs.getBytes("PICTURE1"));
				shopVO.setPicture2(rs.getBytes("PICTURE2"));
				shopVO.setPicture3(rs.getBytes("PICTURE3"));
				// shopVO 也稱為 Domain objects
				list.add(shopVO);
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
	
}