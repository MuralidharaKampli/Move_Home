<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.io.*, javax.servlet.http.HttpSession" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Order Status</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            align-items: center; 
            justify-content: center; 
            height: 100vh; 
        }

        h1 {
            color: #4CAF50;
        }

        form {
            background-color: white;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            max-width: 400px;
            text-align: center;
        }

        label {
            font-weight: bold;
        }

        select {
            width: 100%;
            padding: 10px;
            margin-top: 10px;
        }

        .update-button {
            font-size: 18px;
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 10px 20px;
            cursor: pointer;
            border-radius: 5px;
            margin-top: 20px;
        }

        .update-button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
<%
    Connection con = null;
    ResultSet rs = null;
    
    try {
        String orderIdParam = request.getParameter("order_id");

        if (orderIdParam != null && !orderIdParam.isEmpty()) {
            int orderId = Integer.parseInt(orderIdParam);

            // Establish a connection to the database
            String URL = "jdbc:mysql://localhost:3306/movehome";
            con = DriverManager.getConnection(URL, "root", "root");

            // Fetch the current order status from the database
            PreparedStatement ps = con.prepareStatement("SELECT status FROM orders WHERE order_id = ?");
            ps.setInt(1, orderId);
            rs = ps.executeQuery();

            String currentStatus = "Pending"; // Default status
            if (rs.next()) {
                currentStatus = rs.getString("status");
            }

%>
            <h1 align="center" style='color:purple;'>Update Order Status</h1>
            <form action="update_process.jsp" method="post">
                <input type="hidden" name="order_id" value="<%= orderId %>">
                <label for="status">Status:</label>
                <select id="status" name="status">
                    <option value="Pending" <%= currentStatus.equals("Pending") ? "selected" : "" %>>Pending</option>
                    <option value="Under Processing" <%= currentStatus.equals("Under Processing") ? "selected" : "" %>>Under Processing</option>
                    <option value="Completed" <%= currentStatus.equals("Completed") ? "selected" : "" %>>Completed</option>
                </select>
                <input class="update-button" type="submit" value="Update Status">
            </form>
<%
        } else {
%>
            <p>Order ID is missing or invalid.</p>
<%
        }
    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
    } finally {
        if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
        if (con != null) try { con.close(); } catch (SQLException e) { e.printStackTrace(); }
    }
%>
</body>
</html>
