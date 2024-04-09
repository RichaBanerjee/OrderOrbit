package com.orderorbit.servlet;

import java.io.IOException;

import com.orderorbit.dao.EmployeeDao;
import com.orderorbit.util.DbConnection;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/logout")
public class EmployeeLogoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	DbConnection dbConnection = DbConnection.getDbConnnection();
	EmployeeDao employeeDao = new EmployeeDao(dbConnection);

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		session.invalidate();
		response.setContentType("text/html");
		RequestDispatcher rdDispatcher = request.getRequestDispatcher("/EmployeeLogin.jsp");
		rdDispatcher.include(request, response);

	}
}
