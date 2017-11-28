package com.shoporder.model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Savepoint;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.shop.model.ShopVO;

public class ShopOrderDAO implements ShopOrderDAO_interface {
	private static final String ADD_POINT_TO_MEMBER ="UPDATE MEMBER SET POINT =POINT+(?) WHERE MEM_NO=?";
	private static final String CHANGE_ORDER_TO_OK ="UPDATE SHOPORDER SET ORDER_STATUS =2 WHERE ORDERNO=?";
	private static final String CHANGE_ORDER_TO_CANCEL="UPDATE SHOPORDER SET ORDER_STATUS =3 WHERE ORDERNO=?";
	private static final String GET_PROMOTIONPRICE_BY_ORDERNO ="SELECT OT.ORDERNO,OT.ITEMNO,ORDERCOUNT,MEM_NO,ORDER_DATE,CUSTOMER_ADDRESS,CUSTOMER_PHONE,CUSTOMER_NAME,SP.NAME,SP.PRICE FROM SHOPORDER S JOIN ORDERDETAIL OT  ON (OT.ORDERNO = S.ORDERNO) JOIN SHOPPINGMALL SP  ON SP.ITEMNO = OT.ITEMNO  WHERE OT.ORDERNO=?"; 
	private static final String GET_ALL_BUY_PRICE_BY_ORDERNO = "SELECT OT.ORDERNO,PD.PROMOTIONNO,OT.ITEMNO,ORDERCOUNT,MEM_NO,ORDER_DATE,CUSTOMER_ADDRESS,CUSTOMER_PHONE,CUSTOMER_NAME,SP.NAME,SP.PRICE,PD.PRICE AS NEWPRICE FROM SHOPORDER S JOIN ORDERDETAIL OT  ON (OT.ORDERNO = S.ORDERNO)  JOIN SHOPPINGMALL SP  ON SP.ITEMNO = OT.ITEMNO JOIN PROMOTIONDETAIL PD ON SP.ITEMNO=PD.ITEMNO WHERE OT.ORDERNO=? AND PD.PROMOTIONNO=?";
	private static final String GET_ALL_BUY_PRICE_BY_ORDERNO2 = "SELECT OT.ORDERNO,PD.PROMOTIONNO,OT.ITEMNO,ORDERCOUNT,MEM_NO,ORDER_DATE,CUSTOMER_ADDRESS,CUSTOMER_PHONE,CUSTOMER_NAME,SP.NAME,SP.PRICE,PD.PRICE AS NEWPRICE FROM SHOPORDER S JOIN ORDERDETAIL OT  ON (OT.ORDERNO = S.ORDERNO)  JOIN SHOPPINGMALL SP  ON SP.ITEMNO = OT.ITEMNO JOIN PROMOTIONDETAIL PD ON SP.ITEMNO=PD.ITEMNO WHERE OT.ORDERNO=?";
	private static final String GET_POINT_BYMEMNO = "SELECT POINT FROM MEMBER WHERE MEM_NO=?";
	private static final String UPDATE_MEMBER_POINT = "UPDATE MEMBER  SET POINT=? WHERE MEM_NO=?";
	private static final String GET_ALL = "SELECT ORDERNO ,MEM_NO,ORDER_DATE,CUSTOMER_NAME,ORDER_STATUS FROM SHOPORDER ORDER BY ORDERNO DESC";
	private static final String GET_ALL_ORDER_BY_DATE = "SELECT ORDERNO ,MEM_NO,ORDER_DATE,CUSTOMER_NAME FROM SHOPORDER ORDER BY ORDER_DATE DESC";
	private static final String GET_ALL_ORDER_BY_ORDERNO = "SELECT ORDERNO ,MEM_NO,ORDER_DATE,CUSTOMER_NAME FROM SHOPORDER ORDER BY ORDERNO";
	private static final String DELETE_ORDERDETAIL = "DELETE FROM ORDERDETAIL where ORDERNO =?";
	private static final String DELETE_SHOPORDER = "DELETE FROM SHOPORDER where ORDERNO =?";

	private static final String GET_ALL_BY_ORDERNO = "SELECT  OT.ORDERNO,ITEMNO,ORDERCOUNT,MEM_NO,ORDER_DATE,CUSTOMER_ADDRESS,CUSTOMER_PHONE,CUSTOMER_NAME FROM ORDERDETAIL OT JOIN SHOPORDER S ON (OT.ORDERNO = S.ORDERNO) WHERE OT.orderno=?";
	private static final String GET_ALL_BY_MEMNO = "SELECT  OT.ORDERNO,ITEMNO,ORDERCOUNT,MEM_NO,ORDER_DATE,CUSTOMER_ADDRESS,CUSTOMER_PHONE,CUSTOMER_NAME FROM ORDERDETAIL OT JOIN SHOPORDER S ON (OT.ORDERNO = S.ORDERNO) WHERE MEM_NO=?";
	private static final String GET_SALES_BY_ITEMNO = "SELECT  OT.ORDERNO,ITEMNO,ORDERCOUNT,MEM_NO,ORDER_DATE,CUSTOMER_ADDRESS,CUSTOMER_PHONE,CUSTOMER_NAME FROM ORDERDETAIL OT JOIN SHOPORDER S ON (OT.ORDERNO = S.ORDERNO) WHERE ITEMNO=?";
	private static final String ADD_SHOPORDER = "INSERT INTO SHOPORDER(ORDERNO,ORDER_DATE,MEM_NO,CUSTOMER_ADDRESS,CUSTOMER_PHONE,CUSTOMER_NAME,ORDER_STATUS) VALUES(to_char(sysdate,'yyyymmdd')||'-'||LPAD(to_char(FORSHOPORDER.Nextval),6,'0'),CURRENT_TIMESTAMP,?,?,?,?,'1')";
	private static final String ADD_ORDERDETAIL = "INSERT INTO ORDERDETAIL (ORDERNO,ITEMNO,ORDERCOUNT) VALUES(?,?,?)";
	private static final String UPDATE_EXIST_ORDERDETAIL = "UPDATE  ORDERDETAIL SET  ORDERCOUNT=700 WHERE ORDERNO='20171027-000001' AND ITEMNO=4;";

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
	public List<ShopOrderVO> getAllByOrderNo(String orderno) {
		List<ShopOrderVO> list = new ArrayList<ShopOrderVO>();
		ShopOrderVO shoporderVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_BY_ORDERNO);
			pstmt.setString(1, orderno);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				shoporderVO = new ShopOrderVO();
				shoporderVO.setOrderno(rs.getString("ORDERNO"));
				list.add(shoporderVO);
			}

		} catch (SQLException e) {
			System.out.println("GET_ONE_BY_ORDERNO錯誤 :" + e);

		}finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {

					e.printStackTrace();
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return list;
	}

	@Override
	// 取得該會員所購買的商品
	public List<ShopOrderVO> getAllByMenNO(String menno) {
		List<ShopOrderVO> list = new ArrayList<ShopOrderVO>();
		ShopOrderVO shoporderVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_BY_MEMNO);
			pstmt.setString(1, menno);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				shoporderVO = new ShopOrderVO();
				shoporderVO.setOrderno(rs.getString("orderno"));
				shoporderVO.setCustomer_address(rs.getString("customer_address"));
				shoporderVO.setCustomer_name(rs.getString("customer_name"));
				shoporderVO.setCustomer_phone(rs.getString("customer_phone"));
				shoporderVO.setOrdercount(rs.getInt("ordercount"));
				shoporderVO.setItemno(rs.getInt("itemno"));
				shoporderVO.setMemberno(rs.getString("MEM_NO"));
				shoporderVO.setOrder_date(rs.getDate("order_date"));

				list.add(shoporderVO);
			}

		} catch (SQLException e) {
			System.out.println("GET_ALL_NO錯誤 :" + e);

		}finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {

					e.printStackTrace();
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return list;
	}

	@Override
	public List<ShopOrderVO> getOneByItemNo(Integer itemno) {

		List<ShopOrderVO> list = new ArrayList<ShopOrderVO>();
		ShopOrderVO shoporderVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_SALES_BY_ITEMNO);
			pstmt.setInt(1, itemno);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				shoporderVO = new ShopOrderVO();
				shoporderVO.setOrderno(rs.getString("orderno"));
				shoporderVO.setCustomer_address(rs.getString("customer_address"));
				shoporderVO.setCustomer_name(rs.getString("customer_name"));
				shoporderVO.setCustomer_phone(rs.getString("customer_phone"));
				shoporderVO.setOrdercount(rs.getInt("ordercount"));
				shoporderVO.setItemno(rs.getInt("itemno"));
				shoporderVO.setMemberno(rs.getString("MEM_NO"));
				shoporderVO.setOrder_date(rs.getDate("order_date"));
				list.add(shoporderVO);
			}
		} catch (SQLException e) {
			System.out.println("GET_ONE_BY_ORDERNO錯誤 :" + e);
		}
		return list;
	}

	@Override
	public List<ShopOrderVO> getAllOrder() {
		List<ShopOrderVO> list = new ArrayList<ShopOrderVO>();
		ShopOrderVO shoporderVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				shoporderVO = new ShopOrderVO();
				shoporderVO.setOrderno(rs.getString("orderno"));
				shoporderVO.setMemberno(rs.getString("MEM_NO"));
				shoporderVO.setOrder_date(rs.getDate("ORDER_DATE"));
				shoporderVO.setCustomer_name(rs.getString("CUSTOMER_NAME"));
				shoporderVO.setOrder_state(rs.getString("ORDER_STATUS"));
				list.add(shoporderVO);
			}
		} catch (SQLException e) {
			System.out.println("GET_ONE_BY_ORDERNO錯誤 :" + e);
		}finally {
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
	public List<ShopOrderVO> updateShopOrder(List<ShopOrderVO> shoporderVO,Integer finalTotal) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String key = null;
		Integer Point = null;
		String orderno=shoporderVO.get(0).getOrderno();
		String memno=shoporderVO.get(0).getMemberno();
		
		try {
			con = ds.getConnection();
			// 大量更動資料庫，不能有錯誤。
			con.setAutoCommit(false);
			// 再同時新增訂單明細內容
			for (int i = 0; i < shoporderVO.size(); i++) {
				if(shoporderVO.get(i).getOrdercount()!=0) {
				pstmt = con.prepareStatement("UPDATE ORDERDETAIL SET ORDERCOUNT=? WHERE ITEMNO=? AND ORDERNO=?");

				
				pstmt.setInt(1, shoporderVO.get(i).getOrdercount());
				pstmt.setInt(2, shoporderVO.get(i).getItemno());
				pstmt.setString(3, shoporderVO.get(i).getOrderno());
				pstmt.executeUpdate();
				}else if (shoporderVO.get(i).getOrdercount()==0) {
					pstmt = con.prepareStatement("DELETE  FROM ORDERDETAIL WHERE ITEMNO=? AND ORDERNO=?");
					pstmt.setInt(1, shoporderVO.get(i).getItemno());
					pstmt.setString(2, shoporderVO.get(i).getOrderno());
					pstmt.executeUpdate();
				}
			}
			pstmt=con.prepareStatement("UPDATE MEMBER SET POINT =POINT+(?) WHERE MEM_NO=?");
			pstmt.setInt(1, finalTotal);
			pstmt.setString(2, memno);
			pstmt.executeUpdate();
			con.commit();
			con.setAutoCommit(true);
		} catch (SQLException e) {
			try {
				con.rollback();
				System.out.println("updateShopOrder.java新增訂單錯誤,執行rollback :" + e);
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			e.printStackTrace();
			System.out.println("ShopOrderDAO錯誤");
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
		return shoporderVO;
	}
	@Override
	public void addShopOrder(ShopOrderVO shoporderVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String key = null;
		try {
			String[] cols = { "ORDERNO" };
			con = ds.getConnection();
			pstmt = con.prepareStatement(ADD_SHOPORDER, cols);
			pstmt.setString(1, shoporderVO.getMemberno());
			pstmt.setString(2, shoporderVO.getCustomer_address());
			pstmt.setString(3, shoporderVO.getCustomer_phone());
			pstmt.setString(4, shoporderVO.getCustomer_name());
			pstmt.executeUpdate();

			ResultSet rs = pstmt.getGeneratedKeys();
			ResultSetMetaData rsmd = rs.getMetaData();
			int columnCount = rsmd.getColumnCount();

			if (rs.next()) {
				do {
					for (int i = 1; i <= columnCount; i++) {
						key = rs.getString(i);
						System.out.println("自增主鍵值 = " + key + "(剛新增成功的員工編號)");
					}
				} while (rs.next());
			} else {
				System.out.println("NO KEYS WERE GENERATED.");
			}

			rs.close();

			pstmt.clearParameters();
			pstmt = con.prepareStatement(ADD_ORDERDETAIL);
			System.out.println("DB5");
			// 須取得自增主鍵來一次完成
			pstmt.setString(1, key);
			System.out.println("DB6");
			pstmt.setInt(2, shoporderVO.getItemno());
			System.out.println("DB7");
			pstmt.setInt(3, shoporderVO.getOrdercount());
			System.out.println("DB8");
			pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("addShopOrder錯誤");
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
	public void addShopCartOrder(List<ShopOrderVO> shoporderVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		Savepoint savePoint = null;
		String key = null;

		try {
			String[] cols = { "ORDERNO" };
			con = ds.getConnection();
			// 把購物車的東西新增進去不得有錯，所以關閉AUTOCOMMIT
			con.setAutoCommit(false);
			// 儲存點
			savePoint = con.setSavepoint();
			pstmt = con.prepareStatement(ADD_SHOPORDER, cols);
			// 下面這一段只要新增一次就可以，從會員資料取得非前面表單
			pstmt.setString(1, "MEM0001");
			pstmt.setString(2, "地址");
			pstmt.setString(3, "電話");
			pstmt.setString(4, "姓名");
			pstmt.executeUpdate();
			System.out.println("DB01");

			// 取得對應的自增主鍵值
			ResultSet rs = pstmt.getGeneratedKeys();
			System.out.println("DB02");
			ResultSetMetaData rsmd = rs.getMetaData();
			System.out.println("DB03");
			int columnCount = rsmd.getColumnCount();
			if (rs.next()) {
				System.out.println("DB04");
				do {
					for (int i = 1; i <= columnCount; i++) {
						key = rs.getString(i);
						System.out.println("自增主鍵值 = " + key + "(剛新增成功的訂單編號)");
					}
				} while (rs.next());
			} else {
				System.out.println("NO KEYS WERE GENERATED.");
			}
			rs.close();
			pstmt.clearParameters();
			// 再同時新增訂單明細內容
			for (int i = 0; i < shoporderVO.size(); i++) {
				pstmt = con.prepareStatement(ADD_ORDERDETAIL);
				// 須取得自增主鍵來一次完成
				pstmt.setString(1, key);
				pstmt.setInt(2, shoporderVO.get(i).getItemno());
				pstmt.setInt(3, shoporderVO.get(i).getOrdercount());
				pstmt.executeUpdate();
				System.out.println("第" + i + " 次新增");
			}
			con.commit();
			con.setAutoCommit(true);
		} catch (SQLException e) {
			try {
				con.rollback();
				System.out.println("ShopOrderDAO.java新增訂單錯誤,執行rollback :" + e);
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			e.printStackTrace();
			System.out.println("ShopOrderDAO錯誤");
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
	public void delete(String Orderno, String memno) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(DELETE_ORDERDETAIL);
			pstmt.setString(1, Orderno);
			pstmt.executeUpdate();
			pstmt.clearParameters();

			pstmt = con.prepareStatement(DELETE_SHOPORDER);
			pstmt.setString(1, Orderno);
			pstmt.executeUpdate();
			pstmt.execute();
			System.out.println("DAO訂單刪除完畢");

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {

					e.printStackTrace();
				}
			}
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
	public Integer returnPoint(String memno) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Integer Point = null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_POINT_BYMEMNO);
			pstmt.setString(1, memno);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Point = rs.getInt("POINT");
			}

			System.out.println("Point" + Point);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {

					e.printStackTrace();
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return Point;
	}

	@Override
	public Integer returnAfterShoppingPoint(Integer total, String memno) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Integer Point = null;
		Integer NewPoint = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_POINT_BYMEMNO);
			pstmt.setString(1, memno);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Point = rs.getInt("POINT");
			}
			NewPoint = Point - total;
			pstmt.clearParameters();
			pstmt = con.prepareStatement(UPDATE_MEMBER_POINT);
			pstmt.setInt(1, (NewPoint));
			pstmt.setString(2, memno);
			pstmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {

					e.printStackTrace();
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return NewPoint;
	}

	@Override
	public Integer returnPointback(String Orderno) {
		return null;
	}

	@Override
	public List<ShopOrderVO> getPriceByOrderNoIfHave(String orderno) {
		List<ShopOrderVO> list = new ArrayList<ShopOrderVO>();
		ShopOrderVO shoporderVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_PROMOTIONPRICE_BY_ORDERNO);
			pstmt.setString(1, orderno);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				shoporderVO = new ShopOrderVO();
				shoporderVO.setOrderno(rs.getString("ORDERNO"));
				shoporderVO.setItemno(rs.getInt("ITEMNO"));
				shoporderVO.setOrdercount(rs.getInt("ORDERCOUNT"));
				shoporderVO.setMemberno(rs.getString("MEM_NO"));
				shoporderVO.setOrder_date(rs.getDate("ORDER_DATE"));
				shoporderVO.setCustomer_address(rs.getString("CUSTOMER_ADDRESS"));
				shoporderVO.setCustomer_phone(rs.getString("CUSTOMER_PHONE"));
				shoporderVO.setCustomer_name(rs.getString("NAME"));
				shoporderVO.setShopname(rs.getString("CUSTOMER_NAME"));
				shoporderVO.setPrice(rs.getInt("PRICE"));
				// System.out.println("拿到的BEAN內容 :[ ORDERNO :"+shoporderVO.getOrderno()+"
				// ,ITEMNO :"+shoporderVO.getOrdercount() +" ,ORDERCOUNT
				// :"+shoporderVO.getOrdercount());
				// System.out.println(" ,MEM_NO :"+shoporderVO.getMemberno()+" ,ORDER_DATE
				// :"+shoporderVO.getOrder_date() +" ,CUSTOMER_ADDRESS
				// :"+shoporderVO.getCustomer_address());
				// System.out.println(" ,CUSTOMER_PHONE :"+shoporderVO.getCustomer_phone()+"
				// ,NAME :"+shoporderVO.getCustomer_name() +" ,PRICE :"+shoporderVO.getPrice());
				// System.out.println(" ,NEWPRICE :"+shoporderVO.getPromotionprice());

				list.add(shoporderVO);
			}
		} catch (SQLException e) {
			System.out.println("GET_PROMOTIONPRICE_BY_ORDERNO錯誤 :" + e);
		}finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {

					e.printStackTrace();
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
		}
		return list;
	}

	@Override
	public List<ShopOrderVO> getPriceByOrderNo(String orderno) {
		List<ShopOrderVO> list = new ArrayList<ShopOrderVO>();
		ShopOrderVO shoporderVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Statement stat = null;
		Date ORDERDATE = null;
		Integer PROMOTIONNO = null;
		try {

			con = ds.getConnection();
			stat = con.createStatement();
			rs = stat.executeQuery("SELECT ORDER_DATE FROM SHOPORDER WHERE ORDERNO='" + orderno + "'");
			while (rs.next()) {
				ORDERDATE = rs.getDate("ORDER_DATE");
			}
			System.out.println(ORDERDATE);

			pstmt = con.prepareStatement("SELECT PROMOTIONNO FROM PROMOTION WHERE BEGINDATE<=? AND ENDDATE>=?");
			pstmt.setDate(1, ORDERDATE);
			pstmt.setDate(2, ORDERDATE);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				PROMOTIONNO = rs.getInt("PROMOTIONNO");
			}
			System.out.println("PROMOTIONNO :" + PROMOTIONNO);

			pstmt.clearParameters();

			if (PROMOTIONNO != null) {
				pstmt = con.prepareStatement(GET_ALL_BUY_PRICE_BY_ORDERNO);
				pstmt.setString(1, orderno);
				pstmt.setInt(2, PROMOTIONNO);
				
				rs = pstmt.executeQuery();
				while (rs.next()) {
					shoporderVO = new ShopOrderVO();
					shoporderVO.setOrderno(rs.getString("ORDERNO"));
					shoporderVO.setItemno(rs.getInt("ITEMNO"));
					shoporderVO.setOrdercount(rs.getInt("ORDERCOUNT"));
					shoporderVO.setMemberno(rs.getString("MEM_NO"));
					shoporderVO.setOrder_date(rs.getDate("ORDER_DATE"));
					shoporderVO.setCustomer_address(rs.getString("CUSTOMER_ADDRESS"));
					shoporderVO.setCustomer_phone(rs.getString("CUSTOMER_PHONE"));
					shoporderVO.setCustomer_name(rs.getString("NAME"));
					shoporderVO.setPrice(rs.getInt("NEWPRICE"));
					System.out.println("拿到的BEAN內容 :[ ORDERNO :" + shoporderVO.getOrderno() + " ,ITEMNO :"
							+ shoporderVO.getOrdercount() + " ,ORDERCOUNT :" + shoporderVO.getOrdercount());
					System.out.println(" ,MEM_NO :" + shoporderVO.getMemberno() + " ,ORDER_DATE :"
							+ shoporderVO.getOrder_date() + " ,CUSTOMER_ADDRESS :" + shoporderVO.getCustomer_address());
					System.out.println(" ,CUSTOMER_PHONE :" + shoporderVO.getCustomer_phone() + " ,SHOPNAME :"
							+ shoporderVO.getCustomer_name() +",NAME :"+shoporderVO.getCustomer_name()+ " ,PRICE :" + shoporderVO.getPrice());

					list.add(shoporderVO);
				}
			} else if (PROMOTIONNO == null) {
				pstmt = con.prepareStatement(GET_ALL_BUY_PRICE_BY_ORDERNO2);
				pstmt.setString(1, orderno);
				rs = pstmt.executeQuery();
				while (rs.next()) {
					shoporderVO = new ShopOrderVO();
					shoporderVO.setOrderno(rs.getString("ORDERNO"));
					shoporderVO.setItemno(rs.getInt("ITEMNO"));
					shoporderVO.setOrdercount(rs.getInt("ORDERCOUNT"));
					shoporderVO.setMemberno(rs.getString("MEM_NO"));
					shoporderVO.setOrder_date(rs.getDate("ORDER_DATE"));
					shoporderVO.setCustomer_address(rs.getString("CUSTOMER_ADDRESS"));
					shoporderVO.setCustomer_phone(rs.getString("CUSTOMER_PHONE"));
					shoporderVO.setCustomer_name(rs.getString("NAME"));
					shoporderVO.setPrice(rs.getInt("PRICE"));
					System.out.println("拿到的BEAN內容 :[ ORDERNO :" + shoporderVO.getOrderno() + " ,ITEMNO :"
							+ shoporderVO.getOrdercount() + " ,ORDERCOUNT :" + shoporderVO.getOrdercount());
					System.out.println(" ,MEM_NO :" + shoporderVO.getMemberno() + " ,ORDER_DATE :"
							+ shoporderVO.getOrder_date() + " ,CUSTOMER_ADDRESS :" + shoporderVO.getCustomer_address());
					System.out.println(" ,CUSTOMER_PHONE :" + shoporderVO.getCustomer_phone() + " ,NAME :"
							+ shoporderVO.getCustomer_name() + " ,PRICE :" + shoporderVO.getPrice());

					list.add(shoporderVO);
				}
			}
		} catch (SQLException e) {
			System.out.println("GET_ONE_BY_ORDERNO2錯誤 :" + e);
		}finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {

					e.printStackTrace();
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
		}
		return list;
	}

	@Override
	public void changeOrderToOK(String orderid) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(CHANGE_ORDER_TO_OK);
			pstmt.setString(1, orderid);
			pstmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {

					e.printStackTrace();
				}
			}
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
	public void changeOrderToCancel(String orderid) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(CHANGE_ORDER_TO_CANCEL);
			pstmt.setString(1, orderid);
			pstmt.executeUpdate();


		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {

					e.printStackTrace();
				}
			}
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
	public void addPointForMember(Integer point, String memno) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(ADD_POINT_TO_MEMBER);

			pstmt.setInt(1, point);
			pstmt.setString(2, memno);
			pstmt.executeUpdate();


		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {

					e.printStackTrace();
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
	}
}
