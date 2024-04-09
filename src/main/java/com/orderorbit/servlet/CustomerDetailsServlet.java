package com.orderorbit.servlet;

import java.io.IOException;
import java.util.List;

import com.orderorbit.dao.EmployeeDao;
import com.orderorbit.model.Customer;
import com.orderorbit.util.DbConnection;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/AllCustomerDetails")
public class CustomerDetailsServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	DbConnection dbConnection = DbConnection.getDbConnnection();
	EmployeeDao employeeDao = new EmployeeDao(dbConnection);

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		List<Customer> allCustomers = employeeDao.getAllCustomers();
		request.setAttribute("all_customers", allCustomers);
		RequestDispatcher rdDispatcher = request.getRequestDispatcher("/AllCustomerDetails.jsp");
		rdDispatcher.include(request, response);
	}

}
