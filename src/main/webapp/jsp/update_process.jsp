<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.io.*" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Order Status</title>
</head>
<body>
    <%
        Connection con = null;

        try {
            String orderIdParam = request.getParameter("order_id");
            String newStatus = request.getParameter("status");

            if (orderIdParam != null && !orderIdParam.isEmpty() && newStatus != null && !newStatus.isEmpty()) {
                int orderId = Integer.parseInt(orderIdParam);

                // Establish a database connection
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/movehome", "root", "root");

                // Prepare an SQL update statement
                String updateQuery = "UPDATE orders SET status = ? WHERE order_id = ?";
                PreparedStatement pstmt = con.prepareStatement(updateQuery);

                // Set the parameters for the update statement
                pstmt.setString(1, newStatus);
                pstmt.setInt(2, orderId);

                // Execute the update statement
                int rowsUpdated = pstmt.executeUpdate();

                // Close resources
                pstmt.close();
                con.close();

                if (rowsUpdated > 0) {
    %>
                    <script>
                        alert("Successfully Updated!");
                        window.location.href = "http://localhost:8081/Move_Home/jsp/admin.jsp"; // Redirect back to admin page
                    </script>
    <%
                } else {
    %>
                    <script>
                        alert("Error: Update failed. Please try again later.");
                        window.location.href = "http://localhost:8081/Move_Home/jsp/admin.jsp"; // Redirect back to admin page
                    </script>
    <%
                }
            } else {
    %>
                <script>
                    alert("Order ID or Status is missing or invalid.");
                    window.location.href = "http://localhost:8081/Move_Home/jsp/admin.jsp"; // Redirect back to admin page
                </script>
    <%
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp"); // Redirect to an error page
        } finally {
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    %>
</body>
</html>
