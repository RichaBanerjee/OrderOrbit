package com.orderorbit.servlet;

import java.io.IOException;
import java.util.List;

import com.orderorbit.dao.EmployeeDao;
import com.orderorbit.model.Orders;
import com.orderorbit.util.DbConnection;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/PendingOrderDetails")
public class PendingOrderDetailsServlet extends HttpServlet {

	
	private static final long serialVersionUID = 1L;
	DbConnection dbConnection = DbConnection.getDbConnnection();
	EmployeeDao employeeDao=new EmployeeDao(dbConnection);
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		List<Orders> pendingOrders=employeeDao.getPendingOrders();
		HttpSession session=request.getSession();
		session.setAttribute("pending_orders", pendingOrders);
		RequestDispatcher rdDispatcher = request.getRequestDispatcher("PendingOrderDetails.jsp");
		rdDispatcher.include(request, response);
	}
}
