package com.orderorbit.servlet;

import java.io.IOException;
import java.util.List;

import com.orderorbit.dao.EmployeeDao;
import com.orderorbit.model.Employee;
import com.orderorbit.model.Orders;
import com.orderorbit.util.DbConnection;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/EmployeeLogin")
public class EmployeeLoginServlet extends HttpServlet{
	
	private static final long serialVersionUID = 1L;
	DbConnection dbConnection = DbConnection.getDbConnnection();
	EmployeeDao employeeDao=new EmployeeDao(dbConnection);
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String employeeEmail = request.getParameter("empEmail");
		String employeePassword = request.getParameter("empPassword");
		String employeeRole = request.getParameter("empRole");
		
		
		Employee employee = employeeDao.checkLoginInfo(employeeEmail, employeePassword, employeeRole);
		
		HttpSession session=request.getSession();
		
		response.setContentType("text/html");
		if(employee!=null) {
			String employee_name = employee.getEmployeeName();
			int orderCount=employeeDao.getOrderCount();
			int customerCount=employeeDao.getCustomercount();
			int averageOrderValue=employeeDao.getAvgCount();
			List<Orders> orderList=employeeDao.getLatestOrders();
			session.setAttribute("employee_name", employee_name);
			session.setAttribute("avg_order_value", averageOrderValue);
			session.setAttribute("orderCount", orderCount);
			session.setAttribute("customerCount", customerCount);
			session.setAttribute("latest_orders", orderList);
			if(employee.getEmployeeRole().equals("Manager")) {	
				RequestDispatcher rdDispatcher = request.getRequestDispatcher("/ManagerDashboard.jsp");
				rdDispatcher.include(request, response);
			}else {
				RequestDispatcher rdDispatcher = request.getRequestDispatcher("/StaffDashboard.jsp");
				rdDispatcher.include(request, response);
			}
			
			
		}else {
			session.setAttribute("error", "Enter Valid Username/Password or Role");
			response.setContentType("text/html");
			response.sendRedirect("EmployeeLogin.jsp");

		}
		
	}
}
