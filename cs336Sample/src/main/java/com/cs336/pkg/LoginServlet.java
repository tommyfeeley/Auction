package com.cs336.pkg;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public LoginServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	try {
    	    PrintWriter out = response.getWriter();
    	    // Establish database connection
    	    try {
				Class.forName("com.mysql.cj.jdbc.Driver");
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
    	    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/auctiondb", "root", "l3ftr1ghtl3ft");
    	    String n = request.getParameter("txtName");
    	    String p = request.getParameter("txtPassword");
    	    PreparedStatement ps = con.prepareStatement("select UserID from login where userID=? and password=?");
    	    ps.setString(1, n);
    	    ps.setString(2, p);
    	    ResultSet rs = ps.executeQuery(); 
    	    if (rs.next()) {
    	        // Successful login
    	        RequestDispatcher rd = request.getRequestDispatcher("/welcome.jsp");
    	        rd.forward(request, response);
    	    } else {
    	        // Failed login
    	        out.println("<font color = red size=18> Login Failed!!<br>");
    	        out.println("<a href='failure.jsp'>Failed to login!</a>");
    	        out.println("<a href='login.jsp'>Try again!</a>");
    	    }
    	    
    	    rs.close();
    	    ps.close();
    	    con.close();
    	} catch (SQLException e) {
    	    // Database error
    	    e.printStackTrace(); // Consider logging the error instead
    	    response.sendRedirect("error.jsp"); // Redirect to an error page
    	}
    }
}