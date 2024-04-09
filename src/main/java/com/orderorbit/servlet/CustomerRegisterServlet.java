package com.orderorbit.servlet;

import java.io.IOException;

import com.orderorbit.dao.CustomerDao;
import com.orderorbit.model.Customer;
import com.orderorbit.util.DbConnection;
import com.orderorbit.util.EmailSender;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/CustomerRegisterServlet")
public class CustomerRegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	DbConnection dbConnection = DbConnection.getDbConnnection();
	CustomerDao customerDao = new CustomerDao(dbConnection);

	public CustomerRegisterServlet() {
		
	}

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String customerName = request.getParameter("customerName");
		String customerPhone = request.getParameter("customerPhone");
		String customerMail = request.getParameter("customerEmail");
		String customerPassword = request.getParameter("customerPassword");
		HttpSession session = request.getSession();
		Customer customer = new Customer(customerName, customerPhone, customerMail, customerPassword);

		try {

			
			boolean is_user_registered = customerDao.checkUserExists(customerMail);
			if (is_user_registered) {
				session.setAttribute("error", "User Already Registered with the same Email");
				response.setContentType("text/html");
				response.sendRedirect("CustomerRegister.jsp");
			} else {
				Customer returnCustomer = customerDao.create(customer);

				if (returnCustomer != null) {
					response.setContentType("text/html");
					EmailSender gEmailSender = new EmailSender();
			        String to = customerMail;
			        String from = "orderorbit03@gmail.com";
			        String subject = "Welcome to OrderOrbit - Let's Savor the Journey!";
			        String text = "Dear "+customerName+",\r\n"
			        		+ "\r\n"
			        		+ "Welcome aboard to OrderOrbit – your culinary getaway for delicious delights delivered right to your doorstep!\r\n"
			        		+ "\r\n"
			        		+ "We're thrilled to have you join our flavorful community. Whether you're craving a comforting bowl of pasta, a sizzling stir-fry, or a sweet treat to satisfy your dessert desires, we've got you covered.\r\n"
			        		+ "\r\n"
			        		+ "As a valued member of our food-loving family, you'll enjoy the convenience of ordering from our mouthwatering menu, crafted with love and care by our talented chefs.\r\n"
			        		+ "Let's embark on a culinary adventure together, one delectable dish at a time!\r\n"
			        		+ "\r\n"
			        		+ "Bon appétit and welcome to OrderOrbit!\r\n"
			        		+ "\r\n"
			        		+ "Warm regards,\r\n"
			        		+ "\r\n"
			        		+ "OrderOrbit";
			        boolean b = gEmailSender.sendEmail(to, from, subject, text);
			        if (b) { 
			            System.out.println("Email is sent successfully");
			        } else {
			            System.out.println("There is problem in sending email");
			        }
					RequestDispatcher rdDispatcher = request.getRequestDispatcher("/CustomerLogin.jsp");
					rdDispatcher.include(request, response);
				} else {
					response.setContentType("text/html");
					session.setAttribute("error", "User Not Registered due to some error.Please Try Again");
					response.sendRedirect("CustomerRegister.jsp");
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
