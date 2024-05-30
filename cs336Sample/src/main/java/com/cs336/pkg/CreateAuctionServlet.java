package com.cs336.pkg;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/CreateAuctionServlet")
public class CreateAuctionServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve form parameters
        String endTime = request.getParameter("endTime");
        double initialPrice = Double.parseDouble(request.getParameter("initialPrice"));
        double secretMinPrice = Double.parseDouble(request.getParameter("secretMinPrice"));
        String clothingCategory = request.getParameter("clothingCategory");
        String color = request.getParameter("color");
        String manufacturer = request.getParameter("manufacturer");

        // Get current logged-in user's username from session
//        HttpSession session = request.getSession(false); // Do not create a new session if one does not exist
//        if (session != null && session.getAttribute("username") != null) {
//            String sellerUsername = (String) session.getAttribute("username");

            try {
                // Establish connection to MySQL database
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/auctiondb", "root", "l3ftr1ghtl3ft");

                // Insert into auction table
                String insertAuctionSQL = "INSERT INTO auction (AuctionID, endTime, initialPrice, secretMinPrice) VALUES (?, ?, ?, ?)";
                PreparedStatement auctionStatement = conn.prepareStatement(insertAuctionSQL);
                auctionStatement.setInt(1, generateAuctionID());
                auctionStatement.setString(2, endTime);
                auctionStatement.setDouble(3, initialPrice);
                auctionStatement.setDouble(4, secretMinPrice);
                auctionStatement.executeUpdate();
                auctionStatement.close();

                // Insert into item table (assuming item details without direct AuctionID)
                String insertItemSQL = "INSERT INTO item (clothingCategory, color, manufacturer) VALUES (?, ?, ?)";
                PreparedStatement itemStatement = conn.prepareStatement(insertItemSQL);
                itemStatement.setString(1, clothingCategory);
                itemStatement.setString(2, color);
                itemStatement.setString(3, manufacturer);
                //itemStatement.setString(4, sellerUsername); // Set the seller (username). Currently seller and ? were removed
                itemStatement.executeUpdate();
                itemStatement.close();

                conn.close();

                // Redirect to success page after successful insertion
                response.sendRedirect("success.jsp");
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
                // Redirect to error page with specific message for ClassNotFoundException
                request.setAttribute("errorMessage", "Database driver not found.");
                request.getRequestDispatcher("error.jsp").forward(request, response);
            } catch (SQLException e) {
                e.printStackTrace();
                // Redirect to error page with specific message for SQLException
                request.setAttribute("errorMessage", "SQL error occurred: " + e.getMessage());
                request.getRequestDispatcher("error.jsp").forward(request, response);
            } catch (Exception e) {
                e.printStackTrace();
                // Redirect to error page with generic message for other exceptions
                request.setAttribute("errorMessage", "An error occurred: " + e.getMessage());
                request.getRequestDispatcher("error.jsp").forward(request, response);
            }
    }
//        } else {
//            // Handle case where user is not logged in or session does not contain username
//            request.setAttribute("errorMessage", "User not logged in.");
//            request.getRequestDispatcher("error.jsp").forward(request, response);
//        }
//    }

    private int generateAuctionID() {
        Random random = new Random();
        return 1000 + random.nextInt(9000); // Generates a random 4-digit number
    }
}