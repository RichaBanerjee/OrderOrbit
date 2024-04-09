package com.orderorbit.servlet;

import java.io.IOException;
import java.util.Map;

import com.orderorbit.model.Cart;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/removeFromCart")
public class RemoveFromCartServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int itemId = Integer.parseInt(request.getParameter("itemId"));

		HttpSession session = request.getSession();
		@SuppressWarnings("unchecked")
		Map<Integer, Cart> cart = (Map<Integer, Cart>) session.getAttribute("cart");

		if (cart != null && cart.containsKey(itemId)) {
			cart.remove(itemId);
			session.setAttribute("cart", cart);
		}

		response.sendRedirect("Cart.jsp");
	}
}