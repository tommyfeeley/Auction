<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.time.LocalDateTime" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Auction Results</title>
</head>
<body>
    <h2>Auction Result</h2>
    <%
        try {
        	//Attempts to check each auctions end time, reserve amount, and max bid against each other to send a win or lose message to the appropriate buyers.
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/auctiondb", "root", "password");
            																					//Don't forget to change the db username and password.
            LocalDateTime currentTime = LocalDateTime.now();
            PreparedStatement stmt = conn.prepareStatement("SELECT auctionID FROM auction WHERE endTime < ?");
            stmt.setObject(1, currentTime);
            ResultSet rs = stmt.executeQuery();
			//Above checks auctions for if they have met their end time
            while (rs.next()) {
                int auctionID = rs.getInt("auctionID");
                PreparedStatement bidStmt = conn.prepareStatement("SELECT MAX(bidAmount) AS maxBid FROM bid WHERE auctionID = ?");
                bidStmt.setInt(1, auctionID);
                ResultSet bidRs = bidStmt.executeQuery();
				//Checks for highest bidder, but may be better to add a max bid column. Below checks it against the max bid and messages accordingly.
                if (bidRs.next()) {
                    double maxBid = bidRs.getDouble("maxBid");
                    PreparedStatement auctionStmt = conn.prepareStatement("SELECT secretMinPrice FROM auction WHERE auctionID = ?");
                    auctionStmt.setInt(1, auctionID);
                    ResultSet auctionRs = auctionStmt.executeQuery();
                    if (auctionRs.next()) {
                        double secretMinPrice = auctionRs.getDouble("secretMinPrice");
                        if (maxBid >= secretMinPrice) {
                            PreparedStatement updateStmt = conn.prepareStatement("UPDATE websiteinteraction SET ItemAlert = ? WHERE auctionID = ?");
                            updateStmt.setString(1, "You won an auction!");
                            updateStmt.setInt(2, auctionID);
                            updateStmt.executeUpdate();
                        } else {
                            PreparedStatement updateStmt = conn.prepareStatement("UPDATE websiteinteraction SET ItemAlert = ? WHERE auctionID = ?");
                            updateStmt.setString(1, "You lose the auction!");
                            updateStmt.setInt(2, auctionID);
                            updateStmt.executeUpdate();
                        }
                    }
                }
            }

            conn.close();
        } catch (Exception e) {
            out.println("An error occurred: " + e.getMessage());
            e.printStackTrace();
        }
    %>

    <p>Complete.</p>
</body>
</html>