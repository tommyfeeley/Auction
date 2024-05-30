<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Page for Customer Representatives</title>
</head>
<body>
<h3> Customer Representative Login Page</h3>

<form action="checkCustomerRepDetails.jsp" method="POST">
		Username: <input type="text" name="username" /> <br /> Password:<input
			type="password" name="password" /> <br /> <input type="submit"
			value="Submit" />
	</form>
	<br>

</body>
</html>