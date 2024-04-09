package com.orderorbit.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.orderorbit.model.Customer;
import com.orderorbit.model.Employee;
import com.orderorbit.model.MenuItem;
import com.orderorbit.model.Orders;
import com.orderorbit.util.DbConnection;

public class EmployeeDao implements IDao<Employee> {

	private DbConnection dbConnection;

	public EmployeeDao(DbConnection dbConnection) {
		super();
		this.dbConnection = dbConnection;
	}

	public EmployeeDao() {
		super();
	}

	@Override
	public Employee create(Employee employee) throws Exception {

		String call = "{call add_employeee(?,?,?,?,?)}";
		try {
			Connection connection = dbConnection.getConnection();
			CallableStatement callableStatement = connection.prepareCall(call);
			callableStatement.setString(1, employee.getEmployeeName());
			callableStatement.setString(2, employee.getEmployeeEmail());
			callableStatement.setString(3, employee.getEmployeePassword());
			callableStatement.setString(4, employee.getEmployeeRole());
			callableStatement.setInt(5, employee.getReportsTo());

			int rowsAffected = callableStatement.executeUpdate();
			if (rowsAffected > 0) {
				System.out.println("Employee Added Successfully");
			}
		} catch (Exception e) {
			System.out.println(e);

		}

		return employee;
	}

	public Employee checkLoginInfo(String email, String password, String role) {

		try {

			Connection connection = dbConnection.getConnection();
			final String sqlQuery = "select * from employee where employee_email=? and employee_password=? and employee_role=?";
			PreparedStatement preparedStatement = connection.prepareStatement(sqlQuery);
			preparedStatement.setString(1, email);
			preparedStatement.setString(2, password);
			preparedStatement.setString(3, role);

			ResultSet resultSet = preparedStatement.executeQuery();
			Employee employee = null;
			if (resultSet.next()) {
				employee = new Employee(resultSet.getString(2), resultSet.getString(3), resultSet.getString(4),
						resultSet.getString(5), resultSet.getInt(6));
				return employee;

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}

	public int getOrderCount() {

		int orderCount = 0;
		try {
			Connection connection = dbConnection.getConnection();
			final String sqlQuery = "SELECT COUNT(*) AS orderCount FROM orders";
			Statement statement = connection.createStatement();
			ResultSet resultSet = statement.executeQuery(sqlQuery);

			if (resultSet.next()) {
				orderCount = resultSet.getInt("orderCount");
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return orderCount;
	}

	public int getCustomercount() {

		int customerCount = 0;
		try {
			Connection connection = dbConnection.getConnection();
			final String sqlQuery = "SELECT COUNT(*) AS customerCount FROM customer";
			Statement statement = connection.createStatement();
			ResultSet resultSet = statement.executeQuery(sqlQuery);

			if (resultSet.next()) {
				customerCount = resultSet.getInt("customerCount");
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return customerCount;
	}

	public List<Orders> getLatestOrders() {

		List<Orders> orderList = new ArrayList<>();
		try {
			Connection connection = dbConnection.getConnection();
			String sqlQuery = "SELECT * FROM orders order by order_id desc fetch next 5 rows only";
			Statement statement = connection.createStatement();
			ResultSet resultSet = statement.executeQuery(sqlQuery);

			while (resultSet.next()) {
				Orders orders = new Orders();
				orders.setOrderId(resultSet.getInt("order_id"));
				orders.setOrderDate(resultSet.getDate("order_date"));
				sqlQuery = "SELECT * FROM customer where customer_id=?";
				PreparedStatement preparedStatement = connection.prepareStatement(sqlQuery);
				preparedStatement.setInt(1, resultSet.getInt("customer_id"));
				ResultSet rs = preparedStatement.executeQuery();
				Customer customer = null;
				if (rs.next()) {
					customer = new Customer(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4),
							rs.getString(5));
				}
				orders.setCustomer(customer);
				orders.setIsPicked(resultSet.getString("is_picked"));
				orders.setOrderStatus(resultSet.getString("order_status"));
				orders.setTotalAmount(resultSet.getDouble("total_amount"));
				orderList.add(orders);
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return orderList;
	}

	public List<Orders> getAllOrders() {

		List<Orders> orderList = new ArrayList<>();
		try {
			Connection connection = dbConnection.getConnection();
			String sqlQuery = "SELECT * FROM orders order by order_id desc";
			Statement statement = connection.createStatement();
			ResultSet resultSet = statement.executeQuery(sqlQuery);

			while (resultSet.next()) {
				Orders orders = new Orders();
				orders.setOrderId(resultSet.getInt("order_id"));
				orders.setOrderDate(resultSet.getDate("order_date"));
				sqlQuery = "SELECT * FROM customer where customer_id=?";
				PreparedStatement preparedStatement = connection.prepareStatement(sqlQuery);
				preparedStatement.setInt(1, resultSet.getInt("customer_id"));
				ResultSet rs = preparedStatement.executeQuery();
				Customer customer = null;
				if (rs.next()) {
					customer = new Customer(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4),
							rs.getString(5));
				}
				orders.setCustomer(customer);
				orders.setIsPicked(resultSet.getString("is_picked"));
				orders.setOrderStatus(resultSet.getString("order_status"));
				orders.setTotalAmount(resultSet.getDouble("total_amount"));
				orderList.add(orders);
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return orderList;
	}

	public List<MenuItem> getAllMenuItems() {

		List<MenuItem> menuList = new ArrayList<>();
		try {
			Connection connection = dbConnection.getConnection();
			final String sqlQuery = "SELECT * FROM MENUITEM";
			Statement statement = connection.createStatement();
			ResultSet resultSet = statement.executeQuery(sqlQuery);

			while (resultSet.next()) {
				MenuItem items = new MenuItem();
				items.setItemId(resultSet.getInt("item_id"));
				items.setItemName(resultSet.getString("item_name"));
				items.setItemPrice(resultSet.getDouble("item_price"));
				items.setAvailability(resultSet.getString("availability"));
				menuList.add(items);
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return menuList;
	}

	public List<Orders> getPendingOrders() {

		List<Orders> orderList = new ArrayList<>();
		try {
			Connection connection = dbConnection.getConnection();
			final String sqlQuery = "SELECT * FROM orders where order_status='Order Placed' or is_picked='No' order by order_id desc";
			Statement statement = connection.createStatement();
			ResultSet resultSet = statement.executeQuery(sqlQuery);

			while (resultSet.next()) {
				Orders order = new Orders();
				order.setOrderId(resultSet.getInt("order_id"));
				Object object = resultSet.getObject("customer_id");
				int customer_id = Integer.parseInt(object.toString());
				PreparedStatement ps = connection.prepareStatement("Select * from customer where customer_id=?");
				ps.setInt(1, customer_id);
				ResultSet rs = ps.executeQuery();
				Customer customer = null;
				if (rs.next()) {
					customer = new Customer(rs.getInt("customer_id"), rs.getString("customer_name"),
							rs.getString("customer_phone"), rs.getString("customer_email"),
							rs.getString("customer_password"));
				}
				order.setCustomer(customer);
				order.setOrderDate(resultSet.getDate("order_date"));
				order.setIsPicked(resultSet.getString("is_picked"));
				order.setOrderStatus(resultSet.getString("order_status"));
				order.setTotalAmount(resultSet.getDouble("total_amount"));
				orderList.add(order);
			}

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return orderList;
	}

	public List<Customer> getAllCustomers() {

		List<Customer> customerList = new ArrayList<>();
		try {
			Connection connection = dbConnection.getConnection();
			final String sqlQuery = "SELECT * FROM customer order by customer_id desc";
			Statement statement = connection.createStatement();
			ResultSet resultSet = statement.executeQuery(sqlQuery);

			while (resultSet.next()) {
				Customer customers = new Customer();
				customers.setCustomerId(resultSet.getInt("customer_id"));
				customers.setCustomerName(resultSet.getString("customer_name"));
				customers.setCustomerEmail(resultSet.getString("customer_email"));
				customers.setCustomerPhone(resultSet.getString("customer_phone"));
				customerList.add(customers);
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return customerList;
	}

	public boolean checkUserExists(String employeeMail) {

		try {

			Connection connection = dbConnection.getConnection();
			final String sqlQuery = "select * from employee where employee_email=?";
			PreparedStatement preparedStatement = connection.prepareStatement(sqlQuery);
			preparedStatement.setString(1, employeeMail);
			ResultSet resultSet = preparedStatement.executeQuery();
			if (resultSet.next()) {
				return true;

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return false;
	}

	public int getAvgCount() {
		try {

			Connection connection = dbConnection.getConnection();
			final String sqlQuery = "SELECT AVG(TOTAL_AMOUNT) AS AverageOrderValue FROM Orders";
			PreparedStatement preparedStatement = connection.prepareStatement(sqlQuery);
			ResultSet resultSet = preparedStatement.executeQuery();
			if (resultSet.next()) {
				int avg = resultSet.getInt("AverageOrderValue");
				return avg;

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return 0;
	}

	@Override
	public boolean update(int id, Employee t) throws Exception {

		return false;
	}

	@Override
	public boolean delete(int id) throws Exception {

		return false;
	}

	@Override
	public Employee findOne(int id) throws Exception {

		return null;
	}

	@Override
	public List<Employee> findAll() throws Exception {

		return null;
	}

}
