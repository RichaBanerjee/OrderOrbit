package com.orderorbit.servlet;

import java.io.IOException;

import com.orderorbit.dao.EmployeeDao;
import com.orderorbit.model.Employee;
import com.orderorbit.util.DbConnection;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/EmployeeRegister")
public class EmployeeRegisterServlet extends HttpServlet {


	private static final long serialVersionUID = 1L;
	DbConnection dbConnection = DbConnection.getDbConnnection();
	EmployeeDao employeeDao = new EmployeeDao(dbConnection);

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String employeeName = request.getParameter("empName");
		String employeeEmail = request.getParameter("empEmail");
		String employeePassword = request.getParameter("empPassword");
		String employeeRole = request.getParameter("empRole");

		HttpSession session = request.getSession();
		Employee employee = new Employee(employeeName, employeeEmail, employeePassword, employeeRole, 100);

		try {

			
			boolean is_user_registered = employeeDao.checkUserExists(employeeEmail);
			if (is_user_registered) {
				session.setAttribute("error", "Employee Already Registered with the same Email");
				response.setContentType("text/html");
				response.sendRedirect("EmployeeRegister.jsp");
			} else {
				Employee employeeResult = employeeDao.create(employee);

				if (employeeResult != null) {
					response.setContentType("text/html");
					RequestDispatcher rdDispatcher = request.getRequestDispatcher("/EmployeeLogin.jsp");
					rdDispatcher.include(request, response);
				} else {
					response.setContentType("text/html");
					session.setAttribute("error", "User Not Registered due to some error.Please Try Again");
					response.sendRedirect("EmployeeRegister.jsp");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		
	}

}
