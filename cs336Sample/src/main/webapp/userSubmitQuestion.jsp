<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Question Submission Page</title>
</head>
<body>

<%
try {
    // Establish database connection
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/auctiondb", "root", "l3ftr1ghtl3ft");

    // Retrieve question from form submission
    String question = request.getParameter("question");

    // Validate input (optional)
    // Insert into database
    PreparedStatement ps = con.prepareStatement("INSERT INTO questions (question) VALUES (?)");
    ps.setString(1, question);
    int rowsInserted = ps.executeUpdate();

    if (rowsInserted > 0) {
        out.println("Your question has been submitted successfully.");
        response.sendRedirect("userQuestionHome.jsp");
    } else {
        out.println("Failed to submit your question. Please try again later.");
        response.sendRedirect("userQuestionHome.jsp");
    }

    // Close resources
    ps.close();
    con.close();
} catch (Exception e) {
    out.println("An error occurred while submitting your question.");
    e.printStackTrace();
}
%>


</body>
</html>