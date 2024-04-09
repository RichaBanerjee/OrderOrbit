package com.orderorbit.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;

import com.orderorbit.model.Category;
import com.orderorbit.util.DbConnection;

public class CategoryDao implements IDao<Category> {
	private DbConnection dbConnection;

	public CategoryDao() {
		super();
	}

	public CategoryDao(DbConnection dbConnection) {
		this.dbConnection = dbConnection;
	}

	@Override
	public Category findOne(int id) throws Exception {
		Connection conn = dbConnection.getConnection();
		String sqlQuery = "select * from category where category_id=?";
		PreparedStatement preparedStatement = conn.prepareStatement(sqlQuery);
		preparedStatement.setInt(1, id);

		ResultSet resultSet = preparedStatement.executeQuery();
		Category category = null;
		if (resultSet.next()) {
			category = new Category(resultSet.getInt(1), resultSet.getString(2), resultSet.getString(3));
			return category;
		}
		return null;
	}

	@Override
	public List<Category> findAll() throws Exception {

		return null;
	}

	@Override
	public Category create(Category t) throws Exception {

		return null;
	}

	@Override
	public boolean update(int id, Category t) throws Exception {

		return false;
	}

	@Override
	public boolean delete(int id) throws Exception {

		return false;
	}

}
