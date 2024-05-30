
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Welcome to The Clothing Auction!</title>
<head>
    <meta charset="UTF-8">
    <title>Welcome to The Clothing Auction!</title>
</head>
<body style="font-family: Green, sans-serif; color: #335; background-color: #f8f5f3 margin: 0; padding: 0;">

    <h3 style="color: #008bcg; text-align: center; margin-top: 20px;">Bid on all sorts of clothing at The Clothing Auction!</h3>
    
    <a href="login.jsp" style="display: inline-block; margin-right: 10px; color: #200; text-decoration: none; padding: 5px 10px; border: 1px solid #007bff; border-radius: 5px; transition: background-color 0.3s ease;">Logout</a>
    <a href="loginAdmin.jsp" style="display: inline-block; margin-right: 10px; color: #200; text-decoration: none; padding: 5px 10px; border: 1px solid #007bff; border-radius: 5px; transition: background-color 0.3s ease;">Administrator Login</a>
    <a href="loginCustomerRep.jsp" style="display: inline-block; margin-right: 10px; color: #200; text-decoration: none; padding: 5px 10px; border: 1px solid #007bff; border-radius: 5px; transition: background-color 0.3s ease;">Customer Rep Login</a>
    <a href="userQuestionHome.jsp" style="display: inline-block; margin-right: 10px; color: #200; text-decoration: none; padding: 5px 10px; border: 1px solid #007bff; border-radius: 5px; transition: background-color 0.3s ease;">Ask/View Questions</a>
    <a href="userQuestionKeyword.jsp" style="display: inline-block; margin-right: 10px; color: #200; text-decoration: none; padding: 5px 10px; border: 1px solid #007bff; border-radius: 5px; transition: background-color 0.3s ease;">Search Questions by Keyword</a>
    <a href="auctionCreation.jsp" style="display: inline-block; margin-right: 10px; color: #200; text-decoration: none; padding: 5px 10px; border: 1px solid #007bff; border-radius: 5px; transition: background-color 0.3s ease;">Create an auction</a>
    
    <hr style="border: 1px solid #ccc; margin-top: 20px;">
    <h4>Alert Messages</h4>
    <ul>
        <% 
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/auctiondb", "root", "l3ftr1ghtl3ft");
																										//Don't forget to change db password.
// Code below takes messages for the user and displays them. Useful for telling the user if they've won or lost an auction
                PreparedStatement stmt = conn.prepareStatement("SELECT ItemAlert FROM websiteinteraction");
                ResultSet rs = stmt.executeQuery();
                while (rs.next()) {
                    String message = rs.getString("ItemAlert");
        %>
                    <li><%= message %></li>
        <%
                }
                rs.close();
                stmt.close();
                conn.close();
            } catch (Exception e) {
                out.println("An error occurred: " + e.getMessage());
                e.printStackTrace();
            }
        %>
    </ul>
</body>
</html>