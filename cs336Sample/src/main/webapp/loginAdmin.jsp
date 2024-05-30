<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Administrator Login Page</title>
<h3> Administrator Login Page</h3>
</head>

<body>
<form action="checkAdminDetails.jsp" method="POST">
		Username: <input type="text" name="username" /> <br /> Password:<input
			type="password" name="password" /> <br /> <input type="submit"
			value="Submit" />
	</form>
	<br>
<a href="home.jsp">Click to Return to Home Page</a>
</body>
</html>