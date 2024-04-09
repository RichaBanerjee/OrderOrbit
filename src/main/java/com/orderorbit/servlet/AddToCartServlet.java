package com.orderorbit.servlet;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import com.orderorbit.dao.CustomerDao;
import com.orderorbit.model.Cart;
import com.orderorbit.model.MenuItem;
import com.orderorbit.util.DbConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/addToCart")
public class AddToCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	DbConnection dbConnection = DbConnection.getDbConnnection();
	CustomerDao customerDao = new CustomerDao(dbConnection);

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {
			HttpSession session = request.getSession();
			int itemId = Integer.parseInt(request.getParameter("itemId"));
			String itemName = request.getParameter("itemName");
			int quantity = Integer.parseInt(request.getParameter("quantity"));
			double itemPrice = Double.parseDouble(request.getParameter("itemPrice"));
			MenuItem item = new MenuItem(); 
			item.setItemId(itemId);
			item.setItemName(itemName);
			item.setItemPrice(itemPrice);

			@SuppressWarnings("unchecked")
			Map<Integer, Cart> cart = (Map<Integer, Cart>) session.getAttribute("cart");
			if (cart == null) {
				cart = new HashMap<>();
			}

			if (cart.containsKey(itemId)) {
				Cart cartItem = cart.get(itemId);
				cartItem.setQuantity(quantity);
			} else {
				cart.put(itemId, new Cart(item, quantity));
			}

			session.setAttribute("cart", cart);

			response.sendRedirect("UserDashboard.jsp");
		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("Error.jsp");
		}
	}
}