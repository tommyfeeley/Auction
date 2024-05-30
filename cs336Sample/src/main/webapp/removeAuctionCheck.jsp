<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Delete Auction</title>
</head>
<body>

<h1>Delete Auction</h1>

<%
try {
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/auctiondb", "root", "l3ftr1ghtl3ft");

    // Retrieve auctionID parameter from request, parse 
    int auctionID = Integer.parseInt(request.getParameter("auctionID"));

    // Delete auction from the database
    PreparedStatement stmt = con.prepareStatement("DELETE FROM auction WHERE AuctionID = ?");
    stmt.setInt(1, auctionID);
    int rowsDeleted = stmt.executeUpdate();

    // Check auction removed from table
    if (rowsDeleted > 0) {
        out.println("Auction deleted successfully.");
    } else { // if removal fails
        out.println("Failed to delete auction. Auction not found.");
    }

    // Close connection and prepared statement
    stmt.close();
    con.close();
} catch (Exception e) {
    out.println("An error occurred while deleting auction.");
    e.printStackTrace();
}
%>

<a href="removeAuction.jsp">Back to Auction Management</a>

</body>
</html>