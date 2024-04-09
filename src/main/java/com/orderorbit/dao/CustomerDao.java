package com.orderorbit.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;

import com.orderorbit.model.Customer;
import com.orderorbit.util.DbConnection;

public class CustomerDao implements IDao<Customer> {

	private DbConnection dbConnection;

	public CustomerDao(DbConnection dbConnection) {
		this.dbConnection = dbConnection;
	}

	@Override
	public Customer create(Customer customer) throws Exception {

		String call = "{call add_customer(?,?,?,?)}";
		try {
			Connection connection = dbConnection.getConnection();
			CallableStatement callableStatement = connection.prepareCall(call);

			callableStatement.setString(1, customer.getCustomerName());
			callableStatement.setString(2, customer.getCustomerPhone());
			callableStatement.setString(3, customer.getCustomerEmail());
			callableStatement.setString(4, customer.getCustomerPassword());

			int rowsAffected = callableStatement.executeUpdate();
			if (rowsAffected > 0) {
				System.out.println("Customer Added Successfully");
			}

		} catch (Exception e) {

			System.out.println(e);

		}

		return customer;
	}

	@Override
	public Customer findOne(int id) throws Exception {

		Connection connection = dbConnection.getConnection();
		String sqlQuery = "SELECT * FROM customer where customer_id=?";
		PreparedStatement preparedStatement = connection.prepareStatement(sqlQuery);
		preparedStatement.setInt(1, id);
		ResultSet resultset = preparedStatement.executeQuery();
		Customer customer = null;
		if (resultset.next()) {
			customer = new Customer(resultset.getInt(1), resultset.getString(2), resultset.getString(3),
					resultset.getString(4), resultset.getString(5));
		}
		return customer;
	}

	public Customer checkLoginInfo(String email, String password) {
		try {

			Connection connection = dbConnection.getConnection();
			final String sqlQuery = "select * from customer where customer_email=? and customer_password=?";
			PreparedStatement preparedStatement = connection.prepareStatement(sqlQuery);
			preparedStatement.setString(1, email);
			preparedStatement.setString(2, password);

			ResultSet resultSet = preparedStatement.executeQuery();
			Customer customer = null;
			if (resultSet.next()) {
				customer = new Customer(resultSet.getInt(1), resultSet.getString(2), resultSet.getString(3),
						resultSet.getString(4), resultSet.getString(5));
				return customer;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}

	public boolean checkUserExists(String customerMail) {

		try {

			Connection connection = dbConnection.getConnection();
			final String sqlQuery = "select * from customer where customer_email=?";
			PreparedStatement preparedStatement = connection.prepareStatement(sqlQuery);
			preparedStatement.setString(1, customerMail);
			ResultSet resultSet = preparedStatement.executeQuery();
			if (resultSet.next()) {
				return true;

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return false;
	}

	public Customer findByEmail(String customerMail) {

		try {

			Connection connection = dbConnection.getConnection();
			final String sqlQuery = "select * from customer where customer_email=?";
			PreparedStatement preparedStatement = connection.prepareStatement(sqlQuery);
			preparedStatement.setString(1, customerMail);
			ResultSet resultSet = preparedStatement.executeQuery();
			Customer customer = null;
			if (resultSet.next()) {

				customer = new Customer(resultSet.getInt(1), resultSet.getString(2), resultSet.getString(3),
						resultSet.getString(4), resultSet.getString(5));
				return customer;

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}

	@Override
	public boolean update(int id, Customer t) throws Exception {

		return false;
	}

	@Override
	public boolean delete(int id) throws Exception {

		return false;
	}

	@Override
	public List<Customer> findAll() throws Exception {

		return null;
	}
}
