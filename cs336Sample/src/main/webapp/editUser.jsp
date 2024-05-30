<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Manage User Accounts</title>
</head>
<body>

<h1>Manage User Accounts</h1>

<table border="1">
    <tr>
        <th>User ID</th>
        <th>Password</th>
        <th>Account Type</th>
        <th>Edit</th>
        <th>Delete</th>
    </tr>
    
    <%
    try {
        // Establish database connection
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/auctiondb", "root", "l3ftr1ghtl3ft");

        // Retrieve user accounts from login table
        Statement stmt = con.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT * FROM login");

        // Display user accounts
        while (rs.next()) {
            String userID = rs.getString("userID");
            String password = rs.getString("password");
            String accountType = rs.getString("accountType");
    %>
            <tr>
                <td><%= userID %></td>
                <td><%= password %></td>
                <td><%= accountType %></td>
                <td><a href="modifyUser.jsp?userID=<%= userID %>">Modify</a></td>
                <td><a href="deleteUser.jsp?userID=<%= userID %>">Delete</a></td>
            </tr>
    <%
        }
        // Close resources
        rs.close();
        stmt.close();
        con.close();
    } catch (Exception e) {
        out.println("An error occurred while retrieving user accounts.");
        e.printStackTrace();
    }
    %>
</table>

<a href="customerRepHome.jsp">Return to Custom Rep Home Page</a>

</body>
</html>