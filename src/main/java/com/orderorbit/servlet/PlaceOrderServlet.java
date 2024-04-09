package com.orderorbit.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Date;
import java.util.Map;

import com.orderorbit.dao.CustomerDao;
import com.orderorbit.dao.OrderDao;
import com.orderorbit.dao.OrderDetailsDao;
import com.orderorbit.model.Cart;
import com.orderorbit.model.Customer;
import com.orderorbit.model.MenuItem;
import com.orderorbit.model.OrderDetails;
import com.orderorbit.model.Orders;
import com.orderorbit.util.DbConnection;
import com.orderorbit.util.EmailSender;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/placeOrder")
public class PlaceOrderServlet extends HttpServlet {
	

	private static final long serialVersionUID = 1L;
	DbConnection dbConnection = DbConnection.getDbConnnection();

	 OrderDao orderDao = new OrderDao(dbConnection);
	 OrderDetailsDao orderDetailsDao = new OrderDetailsDao(dbConnection);
	 CustomerDao customerDao=new CustomerDao(dbConnection);

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		Customer customer=null;
		Orders latestOrder=null;

		@SuppressWarnings("unchecked")
		Map<Integer, Cart> cart = (Map<Integer, Cart>) session.getAttribute("cart");

		if (cart == null || cart.isEmpty()) {
			response.sendRedirect("UserDashboard.jsp"); 
			return;
		}

		
		int customerId = (int) session.getAttribute("customer_id");

		
		Orders order = new Orders();
		order.setOrderDate(new java.sql.Date(new Date().getTime())); 
		order.setIsPicked("No"); 
		order.setOrderStatus("Order Placed");
		order.setTotalAmount((Double) session.getAttribute("totalAmount")); 

		
		int orderId = -1;
		try {
			orderId = orderDao.insertOrder(order, customerId);
			if (orderId != -1) {
				
				for (Map.Entry<Integer, Cart> entry : cart.entrySet()) {
					
					Cart cartItem = entry.getValue();
					
					MenuItem item = cartItem.getItem();
					
					customer=customerDao.findOne(customerId);
					
					
					
					latestOrder = orderDao.findOneByIdAndCustomer(orderId,customer);
					
					OrderDetails orderDetail = new OrderDetails();
					orderDetail.setOrderId(latestOrder);
					orderDetail.setItemId(item);
					orderDetail.setQuantity(cartItem.getQuantity());
					orderDetail.setSubTotal(cartItem.getQuantity() * item.getItemPrice());
					orderDetailsDao.insertOrderDetails(orderDetail);			

				}
				session.removeAttribute("cart");
				session.removeAttribute("totalAmount");
				EmailSender gEmailSender = new EmailSender();
		        String to = customer.getCustomerEmail();
		        String from = "orderorbit03@gmail.com";
		        String subject = "Your Order Confirmation from OrderOrbit";
		        String text = "Dear "+customer.getCustomerName()+",\r\n"
		        		+ "\r\n"
		        		+ "Thank you for choosing OrderOrbit to satisfy your cravings! We're excited to confirm that your order has been received and is now being prepared with the utmost care by our talented chefs.\r\n"
		        		+ "\r\n"
		        		+ "Order Details:\r\n"
		        		+ " Order Number:"+latestOrder.getOrderId()+"\r\n"
		        		+ " Order Date:"+latestOrder.getOrderDate()+"\r\n"
		        		+ "\r\n"
		        		+ "Thank you once again for choosing OrderOrbit. We hope you enjoy every mouthful of your meal!\r\n"
		        		+ "\r\n"
		        		+ "Bon appétit!\r\n"
		        		+ "\r\n"
		        		+"We will send you an mail when your order is ready for pickup.\r\n"
		        		+ "Warm regards,\r\n"
		        		+ "\r\n"
		        		+ "OrderOrbit";
		        boolean b = gEmailSender.sendEmail(to, from, subject, text);
		        if (b) { 
		            System.out.println("Email is sent successfully");
		        } else {
		            System.out.println("There is problem in sending email");
		        }
				response.sendRedirect("OrderPlaced.jsp");
			} else {
				response.sendRedirect("UserDashboard.jsp");
			}

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			
     	e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}

		

	}
}
