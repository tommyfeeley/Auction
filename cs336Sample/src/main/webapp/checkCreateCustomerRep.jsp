<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Verify Customer Representative Creation</title>
</head>
<body>
<%

String userid = request.getParameter("username");
String pwd = request.getParameter("password");
String accountType = request.getParameter("accountType");

try {
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/auctiondb", "root", "l3ftr1ghtl3ft");
    
    // Check if username already exists
    Statement stCheck = con.createStatement();
    ResultSet rs = stCheck.executeQuery("SELECT * FROM login WHERE userID='" + userid + "'");
    if (rs.next()) {
        out.println("Username already exists. Please try another ");
        out.println("<br><a href='createCustomerRep.jsp'>Go back to create customer representative homepage</a>");
    } else {
        // Insert into login table
        PreparedStatement ps = con.prepareStatement("INSERT INTO login (userID, password, accountType) VALUES (?, ?, ?)");
        ps.setString(1, userid);
        ps.setString(2, pwd);
        ps.setString(3, accountType);
        int x = ps.executeUpdate();

        // Insert into customerrepresentative table
        PreparedStatement psRep = con.prepareStatement("INSERT INTO customerrepresentative (RepID, password) VALUES (?, ?)");
        psRep.setString(1, userid);
        psRep.setString(2, pwd);
        int y = psRep.executeUpdate();

        session.setAttribute("accountType", accountType);
        out.println("Customer Representative account created successfully.");
        out.println("<br><a href='adminManagement.jsp'>Go back to homepage</a>");
    }

    con.close();
} catch (Exception e) {
    out.println("An error occurred. Please try again later.");
    e.printStackTrace();
}
%>

</body>
</html>