<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login JSP Sample Page</title>
</head>

<div align=center> <h1>Sample CS336 User Login Page</h1></div>
<form action=LoginServlet method=post> <table> 
<tr> <td> Enter Name: </td> <td> <input type = text name=txtName> </td> </tr> 
<tr> <td> Enter Password: </td> <td> <input type = Password name=txtPassword>  </td> </tr> 
<tr><td> <input type = submit value=login></td><td><input type = reset></td></tr>
</table>
</form>
<body>
</body>
</html>