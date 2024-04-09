package com.orderorbit.servlet;

import java.io.IOException;

import com.orderorbit.dao.CustomerDao;
import com.orderorbit.model.Customer;
import com.orderorbit.util.DbConnection;
import com.orderorbit.util.EmailSender;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@WebServlet("/ForgotPasswordServlet")
public class ForgotPasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	DbConnection dbConnection = DbConnection.getDbConnnection();
    CustomerDao customerDao = new CustomerDao(dbConnection); 
 
	public ForgotPasswordServlet() {
		super();
	}

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 	String customerMail = request.getParameter("customerEmail");
	        Customer customer=customerDao.findByEmail(customerMail);
	        HttpSession session=request.getSession();
	        response.setContentType("text/html");
	        if(customer!=null) 
	        {
	        	EmailSender gEmailSender = new EmailSender();
		        String to = customer.getCustomerEmail();
		        String from = "orderorbit03@gmail.com";
		        String subject = " Password Recovery Request";
		        String text = "Dear "+ customer.getCustomerName()+",\r\n"
		        		+ "\r\n"
		        		+ "We have received a request for password recovery associated with your account. As requested, here is your forgotten password:\r\n"
		        		+ "\r\n"
		        		+ ""+customer.getCustomerPassword()+"\r\n"
		        		+ "\r\n"
		        		+ "Please ensure that you keep this information secure and do not share it with anyone. If you did not request this password recovery or have any concerns, please contact our support team immediately.\r\n"
		        		+ "\r\n"
		        		+ "Thank you for choosing our services.\r\n"
		        		+ "\r\n"
		        		+ "Best regards,\r\n"
		        		+ "OrderOrbit";
		        boolean b = gEmailSender.sendEmail(to, from, subject, text);
		        if (b) { 
		            System.out.println("Email is sent successfully");
		        } else {
		            System.out.println("There is problem in sending email");
		        }
				response.sendRedirect("MailSent.jsp");
	        }
	        else 
	        {
				session.setAttribute("error_email", "Entered Email ID does not exists");
				response.sendRedirect("ForgotPassword.jsp");
	        }
	        
	}
}
