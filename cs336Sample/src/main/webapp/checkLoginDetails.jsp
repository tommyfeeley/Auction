<%@ page import ="java.sql.*" %>
<%
// IMPORTANT: Change root password to the password of your MySQL root login!
String userid = request.getParameter("username");
String pwd = request.getParameter("password");
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/auctiondb","root",
"l3ftr1ghtl3ft");
// ^ change password to your MySQL password
Statement st = con.createStatement();
ResultSet rs;
rs = st.executeQuery("select * from login where userID='" + userid + "' and password='" + pwd
+ "'");
if (rs.next()) {
	session.setAttribute("user", userid);
	out.println("welcome " + userid);
	out.println("<a href='logout.jsp'>Log out</a>");
	response.sendRedirect("success.jsp");
} else {
	out.println("Invalid password <a href='login.jsp'>try again</a>");
}
%>
