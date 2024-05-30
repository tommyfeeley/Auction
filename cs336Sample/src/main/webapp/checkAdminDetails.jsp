<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import ="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Login Details Verification Page</title>
</head>
<body>
<% 
String adminID = request.getParameter("username");
String pwd = request.getParameter("password");
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/auctiondb","root",
"l3ftr1ghtl3ft");
Statement st = con.createStatement();
ResultSet rs;
rs = st.executeQuery("select * from adminstaff where AdminID='" + adminID + "' and adminPassword='" + pwd
+ "'");
if (rs.next()) {
session.setAttribute("admin", adminID);
out.println("welcome " + adminID);
out.println("<a href='logout.jsp'>Log out</a>");
response.sendRedirect("adminManagement.jsp");
} else {
out.println("Invalid password <a href='loginAdmin.jsp'>try again</a>");
}
%>
</body>
</html>