package com.orderorbit.servlet;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.orderorbit.dao.MenuItemDao;
import com.orderorbit.model.Category;
import com.orderorbit.model.MenuItem;
import com.orderorbit.util.DbConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

@WebServlet("/AddMenuItemServlet")
@MultipartConfig
public class AddMenuItemServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {
			DbConnection dbConnection = DbConnection.getDbConnnection();
			MenuItemDao menuItemDao = new MenuItemDao(dbConnection);

			String itemName = request.getParameter("item_name");

			double itemPrice = Double.parseDouble(request.getParameter("item_price"));

			int categoryId = Integer.parseInt(request.getParameter("category_id"));

			String availability = request.getParameter("availability");

			Part filePart = request.getPart("item_image");
			String imageFileName = filePart.getSubmittedFileName();
			String path = "C:\\Users\\Richa Banerjee\\Desktop\\Mastek Internship\\JavaWS\\orderorbit\\src\\main\\webapp\\uploadImages\\" + imageFileName;

			try {
				Connection connection = dbConnection.getConnection();

				InputStream is = filePart.getInputStream();

				try (FileOutputStream fos = new FileOutputStream(path)) {

					byte[] buffer = new byte[1024];
					int bytesRead;
					while ((bytesRead = is.read(buffer)) != -1) {
						fos.write(buffer, 0, bytesRead);
					}
				}

				final String sqlQuery = "select category_name,category_description from category where category_id=?";
				PreparedStatement preparedStatement = connection.prepareStatement(sqlQuery);
				preparedStatement.setInt(1, categoryId);

				ResultSet resultSet = preparedStatement.executeQuery();
				Category category = null;
				if (resultSet.next()) {
					category = new Category(categoryId, resultSet.getString(1), resultSet.getString(2));
				}

				MenuItem menuItem = new MenuItem(itemName, category, itemPrice, imageFileName, availability);

				MenuItem item = menuItemDao.createItem(menuItem);

				if (item != null) {
					request.setAttribute("message", "Item added successfully");
				} else {
					request.setAttribute("message", "Failed to add item due to some issue");
				}

				request.getRequestDispatcher("/AddMenuItem.jsp").forward(request, response);

			} catch (Exception e) {
				e.printStackTrace();
				response.sendRedirect("Error.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("Error.jsp");
		}
	}

}