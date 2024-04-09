package com.orderorbit.servlet;

import java.io.IOException;
import java.util.List;

import com.orderorbit.dao.OrderDao;
import com.orderorbit.model.Orders;
import com.orderorbit.util.DbConnection;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/ViewPastOrder")
public class ViewPastOrdersServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	DbConnection dbConnection = DbConnection.getDbConnnection();
	OrderDao orderDao=new OrderDao(dbConnection);
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("Inside sevice");
		HttpSession session=request.getSession();
		int customer_id=(int)session.getAttribute("customer_id");
		List<Orders> PastOrders=orderDao.getAllOrdersOfCustomer(customer_id);
		PastOrders.forEach(n->System.out.println(n));
		session.setAttribute("past_orders", PastOrders);
		RequestDispatcher rdDispatcher = request.getRequestDispatcher("/ViewPastOrder.jsp");
		rdDispatcher.include(request, response);
	}
}

