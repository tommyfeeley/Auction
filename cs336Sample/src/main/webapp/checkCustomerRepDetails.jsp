<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import ="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% 
String repID = request.getParameter("username");
String pwd = request.getParameter("password");
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/auctiondb","root",
"l3ftr1ghtl3ft");
Statement st = con.createStatement();
ResultSet rs;
rs = st.executeQuery("select * from customerrepresentative where RepID='" + repID + "' and password='" + pwd
+ "'");
if (rs.next()) {
session.setAttribute("customer representative", repID);
out.println("welcome " + repID);
out.println("<a href='logout.jsp'>Log out</a>");
response.sendRedirect("customerRepHome.jsp");
} else {
out.println("Invalid password <a href='loginCustomerRep.jsp'>try again</a>");
}
%>
</body>
</html>