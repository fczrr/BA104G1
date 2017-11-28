package com.detail.controller;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;
import java.util.Vector;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.detail.cart.CartDAO;
import com.detail.cart.CartService;
import com.detail.cart.CartVO;

@WebServlet("/CartServlet")
public class CartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req,res);
	}
	
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
System.out.println("進入cartservlet");
		req.setCharacterEncoding("UTF-8");
		// res.setContentType("text/html; charset=UTF-8");
		// PrintWriter out = res.getWriter();
		System.out.println(req.getParameter("STOCK"));
		System.out.println(req.getParameter("action"));
		System.out.println(req.getParameter("ITEMNO"));
		HttpSession session = req.getSession();
		Vector<CartVO> buylist = (Vector<CartVO>) session.getAttribute("shoppingcart");
		String action = req.getParameter("action");
		
		List<String> errorMsgs = new LinkedList<String>();
		req.setAttribute("errorMsgs", errorMsgs);
		
		if (action.equals("CLEARCART")) {
			buylist.clear();
		}
		if (!action.equals("CHECKOUT")) {

			// 刪除購物車中的書籍
			if (action.equals("DELETE")) {
				System.out.println("進入cartservlet.DELETE");
				String del = req.getParameter("del");
//				String price = req.getParameter("price");
				int d = Integer.parseInt(del);
				buylist.removeElementAt(d);
				
			}
			// 新增書籍至購物車中
			else if (action.equals("ADD")) {
				boolean match = false;
				// 取得後來新增的書籍
				CartService CartSvc = new CartService();
				// 這邊測試用stock配合前網頁參數,實際參數是quantity
				Integer ITEMNO = Integer.parseInt(req.getParameter("ITEMNO"));
				Integer STOCK = Integer.parseInt(req.getParameter("STOCK"));
				

				if (STOCK == 0) {
					errorMsgs.add("商品數量不可為0");
				}
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/listAll.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}
				
				CartVO CartVO = CartSvc.findshop(ITEMNO, STOCK);
				// CartVO CartVO = getCartVO(req);
				// 新增第一本書籍至購物車時
				if (buylist == null) {
					buylist = new Vector<CartVO>();
					buylist.add(CartVO);
				}  else {
					for (int i = 0; i < buylist.size(); i++) {
						CartVO cartVO = buylist.get(i);

						// 假若新增的書籍和購物車的書籍一樣時
						if (cartVO.getNAME().equals(CartVO.getNAME())) {
							cartVO.setQUANTITY(cartVO.getQUANTITY() + CartVO.getQUANTITY());
							buylist.setElementAt(cartVO, i);
							System.out.println("新增到重複的商品名稱 :" + cartVO.getNAME());
							match = true;
							System.out.println("期標已被更改");
						} // end of if name matches
						// System.out.println("選擇的商品名稱"+cartVO.getNAME());
						// System.out.println("選擇的商品數量"+cartVO.getQuantity());
						// System.out.println("選擇的商品描述"+cartVO.getDES());
						// System.out.println("選擇的商品編號"+cartVO.getITEMNO());
						// System.out.println("選擇的商品價格"+cartVO.getPRICE());
					} // end of for

					// 假若新增的書籍和購物車的書籍不一樣時
					if (!match)
						buylist.add(CartVO);
				}
			}else if (action.equals("ADD2")) {
				boolean match = false;
				// 取得後來新增的書籍
				CartService CartSvc = new CartService();
				// 這邊測試用stock配合前網頁參數,實際參數是quantity
				Integer ITEMNO = Integer.parseInt(req.getParameter("ITEMNO"));
				Integer STOCK = Integer.parseInt(req.getParameter("STOCK"));

				if (STOCK == 0) {
					errorMsgs.add("商品數量不可為0");
				}
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/listAll.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}
				System.out.println("findshopbypro開始");
				CartVO CartVO = CartSvc.findshopbypro(ITEMNO, STOCK);
				// CartVO CartVO = getCartVO(req);
				// 新增第一本書籍至購物車時
				if (buylist == null) {
					buylist = new Vector<CartVO>();
					buylist.add(CartVO);
				}  else {
					for (int i = 0; i < buylist.size(); i++) {
						CartVO cartVO = buylist.get(i);

						// 假若新增的書籍和購物車的書籍一樣時
						if (cartVO.getNAME().equals(CartVO.getNAME())) {
							cartVO.setQUANTITY(cartVO.getQUANTITY() + CartVO.getQUANTITY());
							buylist.setElementAt(cartVO, i);
							System.out.println("新增到重複的商品名稱 :" + cartVO.getNAME());
							match = true;
							System.out.println("期標已被更改");
						} // end of if name matches
						// System.out.println("選擇的商品名稱"+cartVO.getNAME());
						// System.out.println("選擇的商品數量"+cartVO.getQuantity());
						// System.out.println("選擇的商品描述"+cartVO.getDES());
						// System.out.println("選擇的商品編號"+cartVO.getITEMNO());
						// System.out.println("選擇的商品價格"+cartVO.getPRICE());
					} // end of for

					// 假若新增的書籍和購物車的書籍不一樣時
					if (!match)
						buylist.add(CartVO);
				}
				float total = 0;
				for (int i = 0; i < buylist.size(); i++) {
					CartVO order = buylist.get(i);
					float price = order.getPRICE();
					int quantity = order.getQUANTITY();
					total += (price * quantity);
				}
			
				String amount = String.valueOf(total);
				session.setAttribute("amount", amount);
				req.setAttribute("amount", amount);
			}
			
			float total = 0;
			for (int i = 0; i < buylist.size(); i++) {
				CartVO order = buylist.get(i);
				float price = order.getPRICE();
				int quantity = order.getQUANTITY();
				total += (price * quantity);
			}
			String amount = String.valueOf(total);
			session.setAttribute("amount", amount);
			req.setAttribute("amount", amount);
			
			//每個CARTVO帶過去的參數有NAME,PRICE,DES,QUANTITY,ITEMNO
			session.setAttribute("shoppingcart", buylist);
			System.out.println("forward到/Shop/listAll.jsp");
			String url = "/MasterOrder/Cart.jsp";
			RequestDispatcher rd = req.getRequestDispatcher(url);
			rd.forward(req, res);
		}

		// 結帳，計算購物車書籍價錢總數
		else if (action.equals("CHECKOUT")) {
			
			float total = 0;
			for (int i = 0; i < buylist.size(); i++) {
				CartVO order = buylist.get(i);
				float price = order.getPRICE();
				int quantity = order.getQUANTITY();
				total += (price * quantity);
			}

			String amount = String.valueOf(total);
			req.setAttribute("amount", amount);
			session.setAttribute("amount", amount);
			String url = "/MasterOrder/Checkout.jsp";
			RequestDispatcher rd = req.getRequestDispatcher(url);
			rd.forward(req, res);
			
		}
		
	}

	private CartVO getCartVO(HttpServletRequest req) {

		Integer STOCK = Integer.parseInt(req.getParameter("STOCK"));
		Integer ITEMNO = Integer.parseInt(req.getParameter("ITEMNO"));
		Integer CLASSNO = Integer.parseInt(req.getParameter("CLASSNO"));
		Integer PRICE = Integer.parseInt(req.getParameter("PRICE"));
		String STATE = req.getParameter("STATE");
		String DES = req.getParameter("DES");
		String NAME = req.getParameter("NAME");
		// 值入自治購物車專用bean
		CartVO CartVO = new CartVO();
		CartVO.setNAME(NAME);
		CartVO.setITEMNO(ITEMNO);
		CartVO.setQUANTITY(STOCK);
		CartVO.setDES(DES);
		CartVO.setPRICE(PRICE);

		return CartVO;
	}
}
