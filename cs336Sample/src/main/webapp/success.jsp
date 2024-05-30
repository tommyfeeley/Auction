<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
if (session.getAttribute("user") == null) {
    response.sendRedirect("login.jsp"); // Redirect to login page if not logged in
} else {
    String username = (String) session.getAttribute("user");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login Success</title>
    <script type="text/javascript">
        // JavaScript function for delayed redirection
        // https://www.w3schools.com/howto/howto_js_redirect_webpage.asp
        function redirect() {
            setTimeout(function() {
                window.location.href = "home.jsp";
            }, 5000); // Redirect after 5 seconds 
        }
        // Call the redirect function when the page loads 
        window.onload = redirect;
    </script>
</head>
<body>
    <h1>Welcome <%= username %></h1>
    <p>You have successfully logged in!</p>
    <a href="logout.jsp">Log out</a>
    
    <!-- Display a message to inform the user about the redirection -->
    <p>You will be redirected home in 5 seconds...</p>
</body>
</html>

<%
}
%>