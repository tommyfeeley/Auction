<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Delete User Account</title>
</head>
<body>

<h1>Delete User Account</h1>

<%
try {
    // Establish database connection
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/auctiondb", "root", "l3ftr1ghtl3ft");

    // Retrieve userID parameter from request
    String userID = request.getParameter("userID");

    // Delete user's account from the database
    PreparedStatement stmt = con.prepareStatement("DELETE FROM login WHERE userID = ?");
    stmt.setString(1, userID);
    int rowsDeleted = stmt.executeUpdate();

    // Check if deletion was successful
    if (rowsDeleted > 0) {
        out.println("User account deleted successfully.");
    } else {
        out.println("Failed to delete user account. User not found.");
    }

    // Close resources
    stmt.close();
    con.close();
} catch (Exception e) {
    out.println("An error occurred while deleting user account.");
    e.printStackTrace();
}
%>

<a href="editUser.jsp">Back to User Management</a>

</body>
</html>