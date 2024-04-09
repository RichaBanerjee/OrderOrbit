package com.orderorbit.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.orderorbit.dao.EmployeeDao;
import com.orderorbit.util.DbConnection;
import com.orderorbit.util.EmailSender;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/EditOrderStatus")
public class EditOrderStatusServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
		DbConnection dbConnection = DbConnection.getDbConnnection();
		EmployeeDao employeeDao=new EmployeeDao(dbConnection);
		
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int order_id = Integer.parseInt(request.getParameter("order_id"));
		System.out.println(order_id);
		String is_picked = request.getParameter("is_picked");
		String order_status = request.getParameter("order_status");
			
		int customer_id =  Integer.parseInt(request.getParameter("customer_id"));
	
		try {
			
			Connection connection=dbConnection.getConnection();
		 String sqlQuery="update orders set is_picked=?,order_status=? where order_id=?";
			PreparedStatement preparedStatement=connection.prepareStatement(sqlQuery); 
			preparedStatement.setString(1, is_picked);
			preparedStatement.setString(2, order_status);
			preparedStatement.setInt(3, order_id);
			
			
			
			int result=preparedStatement.executeUpdate();
			sqlQuery="select customer_name,customer_email from customer where customer_id=?";
			PreparedStatement ps=connection.prepareStatement(sqlQuery); 
			ps.setInt(1, customer_id);
			ResultSet resultSet=ps.executeQuery();
			if(result>0 && resultSet.next()) {
				System.out.println("Update success");
				
				//Logic for sending Mail to customer.
				
			if(order_status.equals("Order Prepared")) 
			{
				EmailSender gEmailSender = new EmailSender();
		        String to = (String)resultSet.getString("customer_email");
		        String from = "orderorbit03@gmail.com";
		        String subject = "Your Order is Ready for Pickup!";
		        String text = "Dear "+resultSet.getString("customer_name")+" ,"+"\r\n"
		        		+ "\r\n"
		        		+ "We are pleased to inform you that your order is ready for pickup at our restaurant. You can now come and collect your delicious items at your convenience.\r\n"
		        		+ "\r\n"
		        		+ "Please remember to bring your order confirmation or any identification that we may require for pickup. Our staff will be happy to assist you with any queries or special instructions you may have.\r\n"
		        		+ "\r\n"
		        		+ "We look forward to serving you and hope you enjoy your meal!\r\n"
		        		+ "\r\n"
		        		+ "Best regards,\r\n"
		        		+ "\r\n"
		        		+ "OrderOrbit";
		        boolean b = gEmailSender.sendEmail(to, from, subject, text);
		        if (b) { 
		            System.out.println("Email is sent successfully");
		        } else {
		            System.out.println("There is problem in sending email");
		        }
			}
				RequestDispatcher rdDispatcher = request.getRequestDispatcher("/PendingOrderDetails");
				rdDispatcher.include(request, response);
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
