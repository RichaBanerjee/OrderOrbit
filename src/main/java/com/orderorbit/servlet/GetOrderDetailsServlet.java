package com.orderorbit.servlet;

import java.io.IOException;
import java.util.List;

import com.orderorbit.dao.OrderDetailsDao;
import com.orderorbit.model.OrderDetails;
import com.orderorbit.util.DbConnection;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@WebServlet("/getOrderDetails")
public class GetOrderDetailsServlet extends HttpServlet {

	
	private static final long serialVersionUID = 1L;

	 private DbConnection dbConnection = DbConnection.getDbConnnection();
	    private OrderDetailsDao orderDetailsDao = new OrderDetailsDao(dbConnection);

	    protected void service(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
	        int orderId = Integer.parseInt(request.getParameter("orderId"));
	        List<OrderDetails> orderDetailsList = null;
			try {
				orderDetailsList = orderDetailsDao.getAllDetailsById(orderId);
			} catch (ClassNotFoundException e) {
				
				e.printStackTrace();
			}

	        HttpSession session = request.getSession();
	        session.setAttribute("orderDetailsList", orderDetailsList);

	       
	        RequestDispatcher dispatcher = request.getRequestDispatcher("OrderDetails.jsp");
	        dispatcher.forward(request, response);
	    }
}
