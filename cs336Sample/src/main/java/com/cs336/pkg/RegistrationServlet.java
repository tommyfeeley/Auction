package com.cs336.pkg;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/RegistrationServlet")
public class RegistrationServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password1 = request.getParameter("password1");
        String password2 = request.getParameter("password2");

        if (password1.equals(password2)) {
            try {
                // Establish connection to MySQL database
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/auctiondb", "root", "l3ftr1ghtl3ft");

                // Prepare SQL statement for inserting user
                String sql = "INSERT INTO login (UserID, password) VALUES (?, ?)";
                PreparedStatement statement = conn.prepareStatement(sql);
                statement.setString(1, username);
                statement.setString(2, password1);

                // Execute the insert statement
                int rowsInserted = statement.executeUpdate();
                statement.close();
                conn.close();

                if (rowsInserted > 0) {
                    // Redirect to success page if registration was successful
                    response.sendRedirect("success.jsp");
                } else {
                    // Redirect to error page with a specific message
                    request.setAttribute("errorMessage", "Failed to insert user into database.");
                    request.getRequestDispatcher("error.jsp").forward(request, response);
                }
            } catch (ClassNotFoundException | SQLException e) {
                // Redirect to error page with the specific exception message
                request.setAttribute("errorMessage", "Database error: " + e.getMessage());
                request.getRequestDispatcher("error.jsp").forward(request, response);
            }
        } else {
            // Redirect to error page if passwords don't match
            request.setAttribute("errorMessage", "Passwords do not match.");
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }
}