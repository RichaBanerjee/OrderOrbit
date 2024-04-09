package com.orderorbit.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.orderorbit.dao.EmployeeDao;
import com.orderorbit.model.Category;
import com.orderorbit.model.MenuItem;
import com.orderorbit.util.DbConnection;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/edititem")
public class EditItemFormServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	DbConnection dbConnection = DbConnection.getDbConnnection();
	EmployeeDao employeeDao = new EmployeeDao(dbConnection);

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int item_id = Integer.parseInt(request.getParameter("item_id"));
		try {

			Connection connection = dbConnection.getConnection();
			final String sqlQuery = "select * from menuitem where item_id=?";
			PreparedStatement preparedStatement = connection.prepareStatement(sqlQuery);
			preparedStatement.setInt(1, item_id);
			ResultSet resultSet = preparedStatement.executeQuery();
			MenuItem menuitem= null;
			if (resultSet.next()) {
				Object object = resultSet.getObject("category_id");
				int category_id=Integer.parseInt(object.toString()) ;
				PreparedStatement ps = connection.prepareStatement("Select * from category where category_id=?");
				ps.setInt(1, category_id);
				ResultSet rs = ps.executeQuery();
				Category category=null;
				if (rs.next()) { // Check if ResultSet has any rows
				  
					category = new Category(rs.getInt(1), rs.getString(2), rs.getString(3));
				}
				
				menuitem = new MenuItem(item_id, resultSet.getString(2), category,resultSet.getDouble(4),resultSet.getString(5),resultSet.getString(6));
			}
			HttpSession session =request.getSession();
			session.setAttribute("item_to_be_edited", menuitem);
			response.setContentType("text/html");
			RequestDispatcher rdDispatcher = request.getRequestDispatcher("/EditItemForm.jsp");
			rdDispatcher.include(request, response);

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
