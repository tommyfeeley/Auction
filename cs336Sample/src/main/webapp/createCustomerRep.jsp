<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Create Customer Representative Account</title>
</head>
<body>
<h2> Create Customer Representative Accounts Here!</h2>

<form action = "checkCreateCustomerRep.jsp" method="POST">
Enter UserID: <input type ="text" name ="username" /> 
				Enter Password: <input type="text" name="password" /> <br>
				Enter Account Type: <input type="text" name="accountType" /> <br>
				<input type="submit" value="submit" />
</form>
<a href="adminManagement.jsp">Click to Return to Admin Home Page</a>
</body>
</html>