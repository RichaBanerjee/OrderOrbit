package com.orderorbit.servlet;

import java.io.IOException;
import java.util.List;

import com.orderorbit.dao.CustomerDao;
import com.orderorbit.dao.MenuItemDao;
import com.orderorbit.model.Customer;
import com.orderorbit.model.MenuItem;
import com.orderorbit.util.DbConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@WebServlet("/CustomerLoginServlet")
public class CustomerLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	DbConnection dbConnection = DbConnection.getDbConnnection();
    CustomerDao customerDao = new CustomerDao(dbConnection); 
    MenuItemDao menuItemDao=new MenuItemDao(dbConnection);
	public CustomerLoginServlet() {
		super();
	}


	@SuppressWarnings("unused")
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 	String customerMail = request.getParameter("customerEmail");
	        String customerPassword = request.getParameter("customerPassword");
	        Customer customer = customerDao.checkLoginInfo(customerMail,customerPassword);
	    
	       List<MenuItem > appetizerItemList=menuItemDao.findAppetizers();
	       List<MenuItem > mainCourseItemList=menuItemDao.findMainCourse();
	       List<MenuItem > dessertItemList=menuItemDao.findDesserts();
	        HttpSession session=request.getSession();
	        response.setContentType("text/html");
	        if(customer != null) 
	        {
	        	session.setAttribute("appetizerItemList", appetizerItemList);
	        	session.setAttribute("mainCourseItemList", mainCourseItemList);
	        	session.setAttribute("dessertItemList", dessertItemList);
	        	session.setAttribute("customer_name", customer.getCustomerName());
	        	session.setAttribute("customer_id", customer.getCustomerId());
	        	session.setAttribute("customerEmail",customerMail);
                request.getRequestDispatcher("Home.jsp").include(request, response);
	        }
	        else 
	        {
				session.setAttribute("error", "Enter Valid Username or Password");
				response.sendRedirect("CustomerLogin.jsp");
	        }
	        
	}
}
