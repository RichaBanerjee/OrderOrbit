package com.orderorbit.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.orderorbit.model.Category;
import com.orderorbit.model.MenuItem;
import com.orderorbit.model.OrderDetails;
import com.orderorbit.model.Orders;
import com.orderorbit.util.DbConnection;

public class OrderDetailsDao implements IDao<Orders> {
	private DbConnection dbConnection;
	CategoryDao categoryDao = new CategoryDao();
	MenuItemDao menuItemDao = new MenuItemDao();

	public OrderDetailsDao(DbConnection dbConnection) {
		this.dbConnection = dbConnection;
	}

	public void insertOrderDetails(OrderDetails orderDetails) throws ClassNotFoundException {
		String query = "INSERT INTO Order_Details (ORDER_ID, ITEM_ID, QUANTITY, SUBTOTAL) VALUES (?, ?, ?, ?)";
		try {
			Connection conn = dbConnection.getConnection();
			PreparedStatement stmt = conn.prepareStatement(query);
			stmt.setInt(1, orderDetails.getOrderId().getOrderId());
			stmt.setInt(2, orderDetails.getItemId().getItemId());
			stmt.setInt(3, orderDetails.getQuantity());
			stmt.setDouble(4, orderDetails.getSubTotal());
			stmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public List<OrderDetails> getAllDetailsById(int orderId) throws ClassNotFoundException {
		List<OrderDetails> orderDetailsList = new ArrayList<>();
		String sqlQuery = "SELECT * FROM Order_Details WHERE ORDER_ID=?";

		try {
			Connection conn = dbConnection.getConnection();
			PreparedStatement stmt = conn.prepareStatement(sqlQuery);

			stmt.setInt(1, orderId);

			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
				OrderDetails orderDetails = new OrderDetails();
				Orders order = new Orders();
				
				order.setOrderId(rs.getInt(1));

				MenuItem item = findItembyId(rs.getInt(2), conn);

				orderDetails.setOrderId(order);
				orderDetails.setItemId(item);
				orderDetails.setQuantity(rs.getInt("QUANTITY"));
				orderDetails.setSubTotal(rs.getDouble("SUBTOTAL"));

				orderDetailsList.add(orderDetails);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {

			e.printStackTrace();
		}

		return orderDetailsList;

	}

	private MenuItem findItembyId(int id, Connection conn) {
		Category c1 = new Category(1, "Appetizers", "Starters or appetizers to whet your appetite.");
		Category c2 = new Category(2, "Main Course", "Delicious main dishes to satisfy your hunger.");
		Category c3 = new Category(3, "Desserts", "Sweet treats to end your meal on a high note.");

		MenuItem item = null;
		
		try {

			Connection connection = dbConnection.getConnection();
			final String sqlQuery = "select * from menuitem where item_id=? ";
			PreparedStatement preparedStatement = connection.prepareStatement(sqlQuery);
			preparedStatement.setInt(1, id);
			ResultSet resultSet = preparedStatement.executeQuery();

			if (resultSet.next()) {

				switch (Integer.parseInt(resultSet.getObject(3).toString())) {
				case 1:
					item = new MenuItem(resultSet.getInt(1), resultSet.getString(2), c1, resultSet.getDouble(4),
							resultSet.getString(5), resultSet.getString(6));
					return item;

				case 2:
					item = new MenuItem(resultSet.getInt(1), resultSet.getString(2), c2, resultSet.getDouble(4),
							resultSet.getString(5), resultSet.getString(6));
					return item;

				case 3:
					item = new MenuItem(resultSet.getInt(1), resultSet.getString(2), c3, resultSet.getDouble(4),
							resultSet.getString(5), resultSet.getString(6));
					return item;

				}

			}
		} catch (NumberFormatException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return item;

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
