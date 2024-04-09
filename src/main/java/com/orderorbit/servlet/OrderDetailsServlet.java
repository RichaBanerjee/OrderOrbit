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

@WebServlet("/AllOrderDetails")
public class OrderDetailsServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	DbConnection dbConnection = DbConnection.getDbConnnection();
	EmployeeDao employeeDao=new EmployeeDao(dbConnection);
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		
		List<Orders> allOrders=employeeDao.getAllOrders();
		allOrders.forEach(n->System.out.println(n));
		request.setAttribute("all_orders", allOrders);
		RequestDispatcher rdDispatcher = request.getRequestDispatcher("/AllOrderDetails.jsp");
		rdDispatcher.include(request, response);
	}
}
