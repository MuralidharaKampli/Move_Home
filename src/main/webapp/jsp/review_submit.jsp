<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Processing Rating</title>
</head>
<body>
    <%
    // Database connection details
    String jdbcURL = "jdbc:mysql://localhost:3306/movehome";
    String dbUser = "root";
    String dbPassword = "root";

    // Validate session attributes
    if (session.getAttribute("customer_id") == null || session.getAttribute("email") == null) {
    %>
        <script>
            alert("Error: You must be logged in to submit a review!");
            window.location.href = "login.jsp";  // Redirect to login.jsp if session is invalid
        </script>
    <%
        return;
    }

    // Retrieve session attributes
    Integer customerId = (Integer) session.getAttribute("customer_id");
    String sessionEmail = (String) session.getAttribute("email");

    // Retrieve form data
    String ratingParam = request.getParameter("rating");
    String message = request.getParameter("message");

    // Validate input fields
    if (ratingParam == null || ratingParam.isEmpty() || message == null || message.trim().isEmpty()) {
    %>
        <script>
            alert("Error: Rating and message cannot be empty!");
            window.location.href = "review.jsp";  // Redirect back to review.jsp if fields are empty
        </script>
    <%
        return;
    }

    // Convert rating to integer safely
    int rating = 0;
    try {
        rating = Integer.parseInt(ratingParam);
        if (rating < 1 || rating > 5) {
    %>
        <script>
            alert("Error: Rating must be between 1 and 5 stars.");
            window.location.href = "review.jsp";  // Redirect back to review.jsp if rating is invalid
        </script>
    <%
            return;
        }
    } catch (NumberFormatException e) {
    %>
        <script>
            alert("Error: Invalid rating value.");
            window.location.href = "review.jsp";  // Redirect back to review.jsp if rating is invalid
        </script>
    <%
        return;
    }

    try {
        // Load MySQL driver and establish database connection
        Class.forName("com.mysql.cj.jdbc.Driver");

        try (Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
             PreparedStatement preparedStatement = connection.prepareStatement(
                 "INSERT INTO reviews (customer_id, rating, message) VALUES (?, ?, ?)")) {

            // Set parameters
            preparedStatement.setInt(1, customerId);
            preparedStatement.setInt(2, rating);
            preparedStatement.setString(3, message);

            // Execute SQL statement
            int rowsAffected = preparedStatement.executeUpdate();

            if (rowsAffected > 0) {
                // Do not invalidate session yet, keep it until after redirection
    %>
        <script>
            alert("Thank you for your feedback!\nYou will now be redirected.");
            window.location.href = "review.jsp";  // Redirect back to review.jsp after submission
        </script>
    <%
            } else {
    %>
        <script>
            alert("Error: Review submission failed. Please try again.");
            window.location.href = "review.jsp";  // Redirect back to review.jsp if submission fails
        </script>
    <%
            }
        }
    } catch (Exception e) {
        e.printStackTrace(); // Log the error (do not expose it to the user)
    %>
        <script>
            alert("Error: Something went wrong. Please try again later.");
            window.location.href = "review.jsp";  // Redirect back to review.jsp if something goes wrong
        </script>
    <%
    }
    %>
</body>
</html>
