<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>User Question Search</title>
</head>
<body>

<h1>Search Questions</h1>

<form action="" method="get">
    <label for="keyword">Enter Keyword:</label><br>
    <input type="text" id="keyword" name="keyword">
    <input type="submit" value="Search">
</form>

<%
try {
    // Establish database connection
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/auctiondb", "root", "l3ftr1ghtl3ft");

    // Retrieve keywords from form submission
    String keyword = request.getParameter("keyword");

    // Construct SQL query to filter questions based on keywords
    String sql = "SELECT * FROM questions";
    if (keyword != null && !keyword.isEmpty()) {
        sql += " WHERE question LIKE '%" + keyword + "%'";
    }

    // Execute SQL query
    Statement stmt = con.createStatement();
    ResultSet rs = stmt.executeQuery(sql);

    // Display filtered questions
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
    // Close resources
    rs.close();
    stmt.close();
    con.close();
} catch (Exception e) {
    out.println("An error occurred while searching for questions.");
    e.printStackTrace();
}
%>

<a href="home.jsp">Click to Return to User Home Page</a>

</body>
</html>