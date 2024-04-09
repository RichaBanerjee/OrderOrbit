package com.orderorbit.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DbConnection {

	private static DbConnection dbConnnection;
	private final String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private final String username = "order_orbit_user";
	private final String password = "root";
	private Connection connection;

	private DbConnection() {
		super();
	}

	public static DbConnection getDbConnnection() {
		if (dbConnnection == null) {
			synchronized (DbConnection.class) {
				if (dbConnnection == null) {
					dbConnnection = new DbConnection();
				}
			}

		}

		return dbConnnection;
	}

	public Connection getConnection() throws SQLException, ClassNotFoundException {
		synchronized (Connection.class) {
			if (connection == null) {
				Class.forName("oracle.jdbc.driver.OracleDriver");
				connection = DriverManager.getConnection(url, username, password);
				if (!connection.isClosed()) {
					System.out.println("Connected");
					return connection;
				}
			}
			return connection;
		}
	}

	public boolean closeConnection() throws SQLException {
		if (connection != null) {
			connection.close();
		}
		return connection.isClosed();
	}
}
