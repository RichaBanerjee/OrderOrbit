package com.orderorbit.servlet;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;

import com.orderorbit.dao.EmployeeDao;
import com.orderorbit.util.DbConnection;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

@WebServlet("/EditMenuItem")
@MultipartConfig
public class EditMenuItemServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	DbConnection dbConnection = DbConnection.getDbConnnection();
	EmployeeDao employeeDao = new EmployeeDao(dbConnection);

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {
			int item_id = Integer.parseInt(request.getParameter("item_id"));
			String itemName = request.getParameter("item_name");

			Double itemPrice = Double.parseDouble(request.getParameter("item_price"));
			int category_id = Integer.parseInt(request.getParameter("category_id"));
			String item_availability = request.getParameter("availability");

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

				final String sqlQuery = "update menuitem set item_name=?,category_id=?,item_price=?,availability=?,item_image=? where item_id=?";
				PreparedStatement preparedStatement = connection.prepareStatement(sqlQuery);
				preparedStatement.setString(1, itemName);
				preparedStatement.setInt(2, category_id);
				preparedStatement.setDouble(3, itemPrice);
				preparedStatement.setString(4, item_availability);
				preparedStatement.setString(5, imageFileName);
				preparedStatement.setInt(6, item_id);

				int result = preparedStatement.executeUpdate();
				if (result > 0) {
					System.out.println("Update success");
					RequestDispatcher rdDispatcher = request.getRequestDispatcher("/AllMenuItems");
					rdDispatcher.include(request, response);

				}

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
