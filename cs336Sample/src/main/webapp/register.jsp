<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Registration</title>
</head>
<body>
    <form action="RegistrationServlet" method="post">
        <table style="background-color: yellow; margin-left: 15px;">
        <!--Accesses the registration servlet to store the data, provide error handling, and ensure passwords match-->
            <tr>
                <td><h3 style="color: red;">Registration</h3></td>
            </tr>
            <tr>
                <td>Username:</td>
                <td><input type="text" name="username"></td>
            </tr>
            <tr>
                <td>Password:</td>
                <td><input type="password" name="password1"></td>
            </tr>
            <tr>
                <td>Re-type Password:</td>
                <td><input type="password" name="password2"></td>
            </tr>
            <tr>
                <td><input type="submit" name="submit" value="Register"></td>
                <td><a href="login.jsp">Login</a></td>
            </tr>
        </table>
    </form>
</body>
</html>