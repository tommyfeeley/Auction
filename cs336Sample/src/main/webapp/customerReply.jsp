<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Customer Replies</title>
</head>
<body>
    <h3>Questions from Users</h3>
    <a href="customerRepHome.jsp">Click to Return to Customer Rep Home Page</a>
    <%
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/auctiondb", "root", "l3ftr1ghtl3ft");

        // Update database if we submit reply form
        if (request.getMethod().equalsIgnoreCase("post")) {
            String questionID = request.getParameter("questionID");
            String reply = request.getParameter("reply");

            PreparedStatement ps = con.prepareStatement("UPDATE questions SET answer = ? WHERE questionID = ?");
            ps.setString(1, reply);
            ps.setString(2, questionID);
            int rowsUpdated = ps.executeUpdate();

            if (rowsUpdated > 0) {
                out.println("Reply added successfully.");
                out.println("<br><a href='customerReply.jsp'>Go back</a>");
            } else {
                out.println("Failed to add reply. No rows were updated.");
            }
        }

        // Retrieve user questions
        Statement stmt = con.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT * FROM questions");

        // Display questions and reply form for unanswered
        while (rs.next()) {
            int questionID = rs.getInt("questionID");
            String question = rs.getString("question");
            String answer = rs.getString("answer");
    %>
            <div>
                <p><b>Question:</b> <%= question %></p>
                <p><b>Answer:</b> <%= (answer != null && !answer.isEmpty()) ? answer : "Not answered yet" %></p>
                <!-- reply form only displayed if question answer is blank -->
                <% if (answer == null || answer.isEmpty()) { %>
                    <form action="customerReply.jsp" method="post">
                        <input type="hidden" name="questionID" value="<%= questionID %>">
                        <textarea name="reply" rows="4" cols="50"></textarea><br>
                        <input type="submit" value="Submit Reply">
                    </form>
                <% } %>
            </div>
    <%
        }
        // Close resources
        rs.close();
        stmt.close();
        con.close();
    } catch (Exception e) {
        out.println("An error occurred. Please try again later.");
        e.printStackTrace();
    }
    %>
</body>
</html>