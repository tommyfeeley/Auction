<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Create Auction</title>
</head>
<body>
    <h2>Create Auction</h2>
    <form action="CreateAuctionServlet" method="post">
        <!-- Auction End Datetime -->
        <label for="endTime">Auction End Datetime:</label>
        <input type="datetime-local" id="endTime" name="endTime" required><br><br>

        <!-- Initial Price -->
        <label for="initialPrice">Initial Price ($):</label>
        <input type="number" id="initialPrice" name="initialPrice" min="0.01" step="0.01" required><br><br>

        <!-- Secret Minimum Price -->
        <label for="secretMinPrice">Secret Minimum Price ($):</label>
        <input type="number" id="secretMinPrice" name="secretMinPrice" min="0.01" step="0.01" required><br><br>

        <!-- Clothing Category -->
        <label for="clothingCategory">Clothing Category:</label>
        <select id="clothingCategory" name="clothingCategory" required>
            <option value="hats">Hats</option>
            <option value="pants">Pants</option>
            <option value="shirts">Shirts</option>
        </select><br><br>

        <!-- Color -->
        <label for="color">Color:</label>
        <input type="text" id="color" name="color" required><br><br>

        <!-- Manufacturer -->
        <label for="manufacturer">Manufacturer:</label>
        <input type="text" id="manufacturer" name="manufacturer" required><br><br>

        <!-- Submit Button -->
        <input type="submit" value="Create Auction">
    </form>
</body>
</html>