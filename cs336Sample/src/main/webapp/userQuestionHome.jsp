<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Question Page</title>
</head>
<body>
<h3> View Existing Questions or Ask Your Own!</h3>

<%
try {
    // Establish database connection
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/auctiondb", "root", "l3ftr1ghtl3ft");

    // Display existing questions and answers
    Statement stmt = con.createStatement();
    ResultSet rs = stmt.executeQuery("SELECT * FROM questions");

    while (rs.next()) {
        String question = rs.getString("question");
        String answer = rs.getString("answer");
%>

    <div>
        <p><b>Question:</b> <%= question %></p>
        <p><b>Answer:</b> <%= (answer != null && !answer.isEmpty()) ? answer : "Not answered yet" %></p>
    </div>

<%
    }
    rs.close();
    stmt.close();
} catch (Exception e) {
    out.println("An error occurred while retrieving questions and answers.");
    e.printStackTrace();
}
%>

<hr>

<h2>Ask a Question</h2>

<form action="userSubmitQuestion.jsp" method="post">
    <label for="question">Your Question:</label><br>
    <textarea id="question" name="question" rows="4" cols="50"></textarea>
    <br>
    <input type="submit" value="Submit">
</form>

<a href="home.jsp">Click to Return to User Home Page</a>

</body>
</html>