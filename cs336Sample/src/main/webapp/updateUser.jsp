<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update User Account</title>
</head>
<body>

<h1>Update User Account</h1>

<%
try {
    // Establish database connection
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/auctiondb", "root", "l3ftr1ghtl3ft");

    // Retrieve form parameters
    String userID = request.getParameter("userID");
    String newPassword = request.getParameter("password");
    String newAccountType = request.getParameter("accountType");

    // Update user's information in the database
    PreparedStatement stmt = con.prepareStatement("UPDATE login SET password = ?, accountType = ? WHERE userID = ?");
    stmt.setString(1, newPassword);
    stmt.setString(2, newAccountType);
    stmt.setString(3, userID);
    int rowsUpdated = stmt.executeUpdate();

    // Check if update was successful
    if (rowsUpdated > 0) {
        out.println("User account updated successfully.");
    } else {
        out.println("Failed to update user account. User not found or no changes were made.");
    }

    // Close resources
    stmt.close();
    con.close();
} catch (Exception e) {
    out.println("An error occurred while updating user account.");
    e.printStackTrace();
}
%>

<a href="editUser.jsp">Back to User Management</a>

</body>
</html>