package com.orderorbit.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.orderorbit.model.Category;
import com.orderorbit.model.MenuItem;
import com.orderorbit.util.DbConnection;

public class MenuItemDao implements IDao<MenuItem> {

	private DbConnection dbConnection;

	public MenuItemDao() {
		super();
	}

	public MenuItemDao(DbConnection dbConnection) {
		super();
		this.dbConnection = dbConnection;
	}

	@Override
	public MenuItem findOne(int id) throws Exception {
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
	public List<MenuItem> findAll() {

		Category c1 = new Category(1, "Appetizers", "Starters or appetizers to whet your appetite.");
		Category c2 = new Category(2, "Main Course", "Delicious main dishes to satisfy your hunger.");
		Category c3 = new Category(3, "Desserts", "Sweet treats to end your meal on a high note.");

		List<MenuItem> menuList = new ArrayList<>();

		try {

			Connection connection = dbConnection.getConnection();
			final String sqlQuery = "select * from menuitem";
			PreparedStatement preparedStatement = connection.prepareStatement(sqlQuery);
			ResultSet resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {

				switch (Integer.parseInt(resultSet.getObject(3).toString())) {
				case 1:
					MenuItem item1 = new MenuItem(resultSet.getInt(1), resultSet.getString(2), c1,
							resultSet.getDouble(4), resultSet.getString(5), resultSet.getString(6));
					menuList.add(item1);
					break;
				case 2:
					MenuItem item2 = new MenuItem(resultSet.getInt(1), resultSet.getString(2), c2,
							resultSet.getDouble(4), resultSet.getString(5), resultSet.getString(6));
					menuList.add(item2);
					break;
				case 3:
					MenuItem item3 = new MenuItem(resultSet.getInt(1), resultSet.getString(2), c3,
							resultSet.getDouble(4), resultSet.getString(5), resultSet.getString(6));
					menuList.add(item3);
					break;
				}

			}
		} catch (NumberFormatException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return menuList;
	}

	public List<MenuItem> findAppetizers() {

		Category c1 = new Category(1, "Appetizers", "Starters or appetizers to whet your appetite.");

		List<MenuItem> menuList = new ArrayList<>();
		try {
			Connection connection = dbConnection.getConnection();
			final String sqlQuery = "select * from menuitem where availability='Available'";
			PreparedStatement preparedStatement = connection.prepareStatement(sqlQuery);
			ResultSet resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {

				if (Integer.parseInt(resultSet.getObject(3).toString()) == 1) {
					MenuItem item1 = new MenuItem(resultSet.getInt(1), resultSet.getString(2), c1,
							resultSet.getDouble(4), resultSet.getString(5), resultSet.getString(6));
					menuList.add(item1);
				}
			}
		} catch (NumberFormatException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return menuList;

	}

	public List<MenuItem> findMainCourse() {

		Category c2 = new Category(2, "Main Course", "Delicious main dishes to satisfy your hunger.");

		List<MenuItem> menuList = new ArrayList<>();
		try {
			Connection connection = dbConnection.getConnection();
			final String sqlQuery = "select * from menuitem where availability='Available'";
			PreparedStatement preparedStatement = connection.prepareStatement(sqlQuery);
			ResultSet resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {

				if (Integer.parseInt(resultSet.getObject(3).toString()) == 2) {
					MenuItem item1 = new MenuItem(resultSet.getInt(1), resultSet.getString(2), c2,
							resultSet.getDouble(4), resultSet.getString(5), resultSet.getString(6));
					menuList.add(item1);
				}
			}
		} catch (NumberFormatException e) {

			e.printStackTrace();
		} catch (ClassNotFoundException e) {

			e.printStackTrace();
		} catch (SQLException e) {

			e.printStackTrace();
		}
		return menuList;

	}

	public List<MenuItem> findDesserts() {

		Category c3 = new Category(3, "Desserts", "Sweet treats to end your meal on a high note.");

		List<MenuItem> menuList = new ArrayList<>();
		try {
			Connection connection = dbConnection.getConnection();
			final String sqlQuery = "select * from menuitem where availability='Available'";
			PreparedStatement preparedStatement = connection.prepareStatement(sqlQuery);
			ResultSet resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {

				if (Integer.parseInt(resultSet.getObject(3).toString()) == 3) {
					MenuItem item1 = new MenuItem(resultSet.getInt(1), resultSet.getString(2), c3,
							resultSet.getDouble(4), resultSet.getString(5), resultSet.getString(6));
					menuList.add(item1);
				}
			}
		} catch (NumberFormatException e) {

			e.printStackTrace();
		} catch (ClassNotFoundException e) {

			e.printStackTrace();
		} catch (SQLException e) {

			e.printStackTrace();
		}
		return menuList;

	}

	public MenuItem createItem(MenuItem item) throws Exception {

		String call = "{call add_menu_item(?,?,?,?,?)}";
		try {
			Connection connection = dbConnection.getConnection();
			CallableStatement callableStatement = connection.prepareCall(call);
			callableStatement.setString(1, item.getItemName());
			callableStatement.setInt(2, item.getCategory().getCategoryId());
			callableStatement.setDouble(3, item.getItemPrice());
			callableStatement.setString(4, item.getItem_image());
			callableStatement.setString(5, item.getAvailability());

			int rowsAffected = callableStatement.executeUpdate();
			if (rowsAffected > 0) {
				System.out.println("Item Added Successfully");
			}

		} catch (Exception e) {
			System.out.println(e);

		}

		return item;
	}

	public MenuItem findItemByName(String itemName, Category category) {

		MenuItem menuItem = null;
		try {
			Connection connection = dbConnection.getConnection();
			final String sqlQuery = "SELECT * FROM menuitem WHERE item_name = ?";
			PreparedStatement preparedStatement = connection.prepareStatement(sqlQuery);
			preparedStatement.setString(1, itemName);
			ResultSet resultSet = preparedStatement.executeQuery();

			if (resultSet.next()) {
				menuItem = new MenuItem(resultSet.getInt(1), resultSet.getString(2), category, resultSet.getDouble(4),
						resultSet.getString(5), resultSet.getString(6));
			}
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
		return menuItem;
	}

	@Override
	public MenuItem create(MenuItem t) throws Exception {
		return null;
	}

	@Override
	public boolean update(int id, MenuItem t) throws Exception {
		return false;
	}

	@Override
	public boolean delete(int id) throws Exception {
		return false;
	}

}
