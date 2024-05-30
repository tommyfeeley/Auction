<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Manage Auctions</title>
</head>
<body>

<h1>Manage Auctions</h1>

<table border="1">
    <tr>
        <th>Auction ID</th>
        <th>Start Time</th>
        <th>Initial Price</th>
        <th>Actions</th>
    </tr>
    
    <%
    try {
        // Establish database connection
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/auctiondb", "root", "l3ftr1ghtl3ft");

        // Retrieve auctions from auction table
        Statement stmt = con.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT * FROM auction");

        // Display auctions
        while (rs.next()) {
            int auctionID = rs.getInt("AuctionID");
            Timestamp endTime = rs.getTimestamp("endTime");
            double initialPrice = rs.getDouble("initialPrice");
    %>
            <tr>
                <td><%= auctionID %></td>
                <td><%= endTime %></td>
                <td><%= initialPrice %></td>
                <td><a href="removeAuctionCheck.jsp?auctionID=<%= auctionID %>">Delete</a></td>
            </tr>
    <%
        }
        // Close resources
        rs.close();
        stmt.close();
        con.close();
    } catch (Exception e) {
        out.println("An error occurred while retrieving auctions.");
        e.printStackTrace();
    }
    %>
</table>

<a href="customerRepHome.jsp">Back to Customer Representative Home</a>

</body>
</html>