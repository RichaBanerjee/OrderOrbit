package com.orderorbit.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.orderorbit.dao.EmployeeDao;
import com.orderorbit.util.DbConnection;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/deleteitem")
public class DeleteMenuItemServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    DbConnection dbConnection = DbConnection.getDbConnnection();
    EmployeeDao employeeDao = new EmployeeDao(dbConnection);

    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int item_id = Integer.parseInt(request.getParameter("item_id"));
        
        PreparedStatement checkOrdersStatement = null;
        PreparedStatement preparedStatement = null;
        try {
        	Connection connection = dbConnection.getConnection();
            final String checkOrdersQuery = "SELECT COUNT(*) FROM order_details WHERE item_id = ?";
            checkOrdersStatement = connection.prepareStatement(checkOrdersQuery);
            checkOrdersStatement.setInt(1, item_id);
            int orderCount = 0;
            try (ResultSet resultSet = checkOrdersStatement.executeQuery()) {
                if (resultSet.next()) {
                    orderCount = resultSet.getInt(1);
                }
            }

            if (orderCount > 0) {
                // If there are orders associated with this item, display a message to the user
                response.setContentType("text/html");
                try (java.io.PrintWriter out = response.getWriter()) {
                	out.println("<!DOCTYPE html>");
                    out.println("<html>");
                    out.println("<head>");
                    out.println("<title>Item Deletion</title>");
                    out.println("<link href=\"https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css\" rel=\"stylesheet\">");
                    out.println("</head>");
                    out.println("<body>");

                    
                    out.println("<div class=\"modal fade\" id=\"deleteItemModal\" tabindex=\"-1\" role=\"dialog\" aria-labelledby=\"exampleModalLabel\" aria-hidden=\"true\">");
                    out.println("<div class=\"modal-dialog\" role=\"document\">");
                    out.println("<div class=\"modal-content\">");
                    out.println("<div class=\"modal-header\">");
                    out.println("<h5 class=\"modal-title\" id=\"exampleModalLabel\">Cannot Delete Item</h5>");
                    out.println("<button type=\"button\" class=\"close\" data-dismiss=\"modal\" aria-label=\"Close\">");
                    out.println("<span aria-hidden=\"true\">&times;</span>");
                    out.println("</button>");
                    out.println("</div>");
                    out.println("<div class=\"modal-body\">");
                    out.println("This item cannot be deleted as it is associated with orders.");
                    out.println("</div>");
                    out.println("<div class=\"modal-footer\">");
                    out.println("<button type=\"button\" class=\"btn btn-secondary\" data-dismiss=\"modal\">Close</button>");
                    out.println("</div>");
                    out.println("</div>");
                    out.println("</div>");
                    out.println("</div>");

                    out.println("<script src=\"https://code.jquery.com/jquery-3.5.1.slim.min.js\"></script>");
                    out.println("<script src=\"https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js\"></script>");
                    out.println("<script src=\"https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js\"></script>");
                    
                  
                    out.println("<script>");
                    out.println("$(document).ready(function(){");
                    out.println("$('#deleteItemModal').modal('show');");
                    out.println("$('#deleteItemModal').on('hidden.bs.modal', function () {");
                    out.println("window.location.href = '/orderorbit/AllMenuItems';");
                    out.println("});");
                    out.println("});");
                    out.println("</script>");

                    out.println("</body>");
                    out.println("</html>");
                }
            } else {
                final String deleteQuery = "DELETE FROM menuitem WHERE item_id=?";
                preparedStatement = connection.prepareStatement(deleteQuery);
                preparedStatement.setInt(1, item_id);
                int result = preparedStatement.executeUpdate();
                if (result > 0) {
                    RequestDispatcher rdDispatcher = request.getRequestDispatcher("/AllMenuItems");
                    rdDispatcher.include(request, response);
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
           
        } catch (ClassNotFoundException e) {
		
			e.printStackTrace();
		} finally {
            System.out.println("finally block");
        }
    }
}