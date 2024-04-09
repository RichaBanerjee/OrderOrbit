package com.orderorbit.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.orderorbit.model.Customer;
import com.orderorbit.model.Orders;
import com.orderorbit.util.DbConnection;

public class OrderDao implements IDao<Orders> {
	private DbConnection dbConnection;
	CustomerDao customerDao = new CustomerDao(dbConnection);

	public OrderDao(DbConnection dbConnection) {

		this.dbConnection = dbConnection;
	}

	public int insertOrder(Orders order, int customerId) throws ClassNotFoundException, SQLException {
		int orderId = -1;
		String query = "INSERT INTO Orders (CUSTOMER_ID, ORDER_DATE, TOTAL_AMOUNT, IS_PICKED, ORDER_STATUS) VALUES (?, ?, ?, ?, ?)";
		Connection conn = dbConnection.getConnection();
		PreparedStatement stmt = conn.prepareStatement(query);
		stmt.setInt(1, customerId);
		stmt.setDate(2, new java.sql.Date(order.getOrderDate().getTime()));
		stmt.setDouble(3, order.getTotalAmount());
		stmt.setString(4, order.getIsPicked());
		stmt.setString(5, order.getOrderStatus());
		int rowsInserted = stmt.executeUpdate();
		if (rowsInserted > 0) {
			orderId = getLastInsertedOrderId(conn);
		}

		return orderId;
	}

	private int getLastInsertedOrderId(Connection conn) throws SQLException, ClassNotFoundException {

		String query = "SELECT MAX(ORDER_ID) FROM Orders";
		PreparedStatement stmt = conn.prepareStatement(query);
		ResultSet rs = stmt.executeQuery();
		if (rs.next()) {
			return rs.getInt(1);

		}
		return -1;
	}

	public Orders findOneByIdAndCustomer(int id, Customer customer) throws Exception {
		Connection connection = dbConnection.getConnection();
		String sqlQuery = "SELECT * FROM orders where order_id=?";
		PreparedStatement preparedStatement = connection.prepareStatement(sqlQuery);
		preparedStatement.setInt(1, id);
		ResultSet rs = preparedStatement.executeQuery();

		Orders latestOrder = null;
		if (rs.next()) {
			latestOrder = new Orders(rs.getInt(1), customer, rs.getDate(3), rs.getString(4), rs.getString(5),
					rs.getDouble(6));
		}

		return latestOrder;
	}

	public List<Orders> getAllOrdersOfCustomer(int customer_id) {
		List<Orders> orderList = new ArrayList<>();
		try {

			Connection connection = dbConnection.getConnection();
			String sqlQuery = "SELECT * FROM orders where customer_id=? order by order_id desc";
			PreparedStatement preparedStatement = connection.prepareStatement(sqlQuery);
			preparedStatement.setInt(1, customer_id);
			ResultSet resultset = preparedStatement.executeQuery();
			Orders orders = null;

			Customer customer = findOneCustomer(customer_id, connection);

			while (resultset.next()) {
				orders = new Orders(resultset.getInt(1), customer, resultset.getDate(3), resultset.getString(4),
						resultset.getString(5), resultset.getDouble(6));
				orderList.add(orders);
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return orderList;
	}

	private Customer findOneCustomer(int customer_id, Connection connection) throws SQLException {

		String sqlQuery = "SELECT * FROM customer where customer_id=?";
		PreparedStatement preparedStatement = connection.prepareStatement(sqlQuery);
		preparedStatement.setInt(1, customer_id);
		ResultSet resultset = preparedStatement.executeQuery();
		Customer customer = null;
		if (resultset.next()) {
			customer = new Customer(resultset.getInt(1), resultset.getString(2), resultset.getString(3),
					resultset.getString(4), resultset.getString(5));
		}
		return customer;
	}

	@Override
	public Orders create(Orders t) throws Exception {

		return null;
	}

	@Override
	public boolean update(int id, Orders t) throws Exception {

		return false;
	}

	@Override
	public boolean delete(int id) throws Exception {

		return false;
	}

	@Override
	public Orders findOne(int id) throws Exception {
		return null;
	}

	@Override
	public List<Orders> findAll() throws Exception {

		return null;
	}

}
