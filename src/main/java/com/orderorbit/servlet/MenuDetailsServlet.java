package com.orderorbit.servlet;

import java.io.IOException;
import java.util.List;

import com.orderorbit.dao.EmployeeDao;
import com.orderorbit.model.MenuItem;
import com.orderorbit.util.DbConnection;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/AllMenuItems")
public class MenuDetailsServlet extends HttpServlet {


	private static final long serialVersionUID = 1L;
	DbConnection dbConnection = DbConnection.getDbConnnection();
	EmployeeDao employeeDao=new EmployeeDao(dbConnection);
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		List<MenuItem> allItems=employeeDao.getAllMenuItems();
		HttpSession session=request.getSession();
		session.setAttribute("all_items", allItems);
		RequestDispatcher rdDispatcher = request.getRequestDispatcher("/AllMenuItems.jsp");
		rdDispatcher.include(request, response);
	}
}
