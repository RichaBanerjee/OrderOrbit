package com.orderorbit.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.orderorbit.dao.EmployeeDao;
import com.orderorbit.model.Customer;
import com.orderorbit.model.Orders;
import com.orderorbit.util.DbConnection;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/editorderstatus")
public class EditStatusFormServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	DbConnection dbConnection = DbConnection.getDbConnnection();
	EmployeeDao employeeDao = new EmployeeDao(dbConnection);

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int order_id = Integer.parseInt(request.getParameter("order_id"));
		try {

			Connection connection = dbConnection.getConnection();
			final String sqlQuery = "select * from orders where order_id=?";
			PreparedStatement preparedStatement = connection.prepareStatement(sqlQuery);
			preparedStatement.setInt(1, order_id);
			ResultSet resultSet = preparedStatement.executeQuery();
			Orders order= null;
			if (resultSet.next()) {
				Object object = resultSet.getObject("customer_id");
				int customer_id=Integer.parseInt(object.toString()) ;
				PreparedStatement ps = connection.prepareStatement("Select * from customer where customer_id=?");
				ps.setInt(1, customer_id);
				ResultSet rs = ps.executeQuery();
				Customer customer=null;
				if (rs.next()) { // Check if ResultSet has any rows
				  
					customer = new Customer(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5));
				}
				
				order = new Orders(order_id,customer, resultSet.getDate("order_date"), resultSet.getString("is_picked"),resultSet.getString("order_status"),resultSet.getDouble("total_amount"));
			}

			
			request.setAttribute("order_to_be_edited", order);
			response.setContentType("text/html");
			RequestDispatcher rdDispatcher = request.getRequestDispatcher("/EditStatusForm.jsp");
			rdDispatcher.include(request, response);

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
