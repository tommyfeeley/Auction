<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Modify User Account</title>
</head>
<body>

<h1>Modify User Account</h1>

<%
try {
    // Establish database connection
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/auctiondb", "root", "l3ftr1ghtl3ft");

    // Retrieve userID parameter from request
    String userID = request.getParameter("userID");

    // Retrieve user's current information from the database based on userID
    PreparedStatement stmt = con.prepareStatement("SELECT * FROM login WHERE userID = ?");
    stmt.setString(1, userID);
    ResultSet rs = stmt.executeQuery();

    // Display form to modify user's information
    if (rs.next()) {
        String password = rs.getString("password");
        String accountType = rs.getString("accountType");
%>
        <form action="updateUser.jsp" method="post">
            <input type="hidden" name="userID" value="<%= userID %>">
            <label for="password">Password:</label>
            <input type="text" id="password" name="password" value="<%= password %>"><br>
            <label for="accountType">Account Type:</label>
            <input type="text" id="accountType" name="accountType" value="<%= accountType %>"><br>
            <input type="submit" value="Submit">
        </form>
<%
    } else {
        out.println("User not found.");
    }

    // Close resources
    rs.close();
    stmt.close();
    con.close();
} catch (Exception e) {
    out.println("An error occurred while modifying user account.");
    e.printStackTrace();
}
%>

<a href="editUser.jsp">Back to User Management</a>

</body>
</html>