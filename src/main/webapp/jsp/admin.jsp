<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.io.*, javax.servlet.http.HttpSession" %>

<%
    // Prevent caching
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setHeader("Expires", "0");

    // Retrieve session, if exists
    HttpSession mysession = request.getSession(false);

    // If session does not exist, check login credentials
    if (mysession == null || mysession.getAttribute("email") == null) {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // Validate input
        if (email == null || password == null || email.isEmpty() || password.isEmpty()) {
            response.sendRedirect("admin.html"); // Redirect to login page if credentials are missing
            return;
        }

        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            // Database connection
            String URL = "jdbc:mysql://localhost:3306/movehome";
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(URL, "root", "root");

            // Check if the email and password exist in the database
            ps = con.prepareStatement("SELECT name FROM admin WHERE email=? AND password=?");
            ps.setString(1, email);
            ps.setString(2, password);
            rs = ps.executeQuery();

            if (rs.next()) {
                // Create session for admin
                mysession = request.getSession();
                mysession.setAttribute("email", email);
                mysession.setMaxInactiveInterval(30 * 60); // 30 minutes session
            } else {
                response.sendRedirect("admin.html?error=invalid"); // Redirect with error
                return;
            }
        } catch (Exception e) {
            out.println("<p class='error'>Error: " + e.getMessage() + "</p>");
            e.printStackTrace();
            return;
        } finally {
            if (rs != null) rs.close();
            if (ps != null) ps.close();
            if (con != null) con.close();
        }
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard</title>
    <style>
    /* General Styling */
    body {
        font-family: Arial, sans-serif;
        background-color: #f5f5f5;
        margin: 0;
        padding: 0;
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        min-height: 100vh;
    }

    h1, h2 {
        text-align: center;
    }

    h1 {
        color: purple;
        font-size: 26px;
        margin-bottom: 10px;
    }

    h2 {
        color: blue;
        font-size: 22px;
        margin-bottom: 20px;
    }

    /* Table Styling */
    table {
        width: 90%;
        max-width: 1000px;
        border-collapse: collapse;
        background-color: white;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        border-radius: 8px;
        overflow: hidden;
        margin-bottom: 30px;
    }

    th, td {
        padding: 12px 15px;
        text-align: left;
        border-bottom: 1px solid #ddd;
    }

    th {
        background-color: #4CAF50;
        color: white;
        font-weight: bold;
    }

    tr:nth-child(even) {
        background-color: #f2f2f2;
    }

    tr:hover {
        background-color: #e0e0e0;
        transition: 0.3s ease-in-out;
    }

    /* Button Styling */
    a.btn, .logout-button {
        text-decoration: none;
        color: white;
        background-color: #4CAF50;
        padding: 10px 20px;
        border-radius: 5px;
        margin-top: 20px;
        display: inline-block;
        transition: background-color 0.3s ease;
    }

    a.btn:hover, .logout-button:hover {
        background-color: #45a049;
    }

    /* Logout Button */
    .logout-button-container {
        display: flex;
        justify-content: center;
        margin-top: 20px;
    }

    .logout-button {
        font-size: 18px;
        border: none;
        padding: 10px 20px;
        cursor: pointer;
        border-radius: 5px;
    }

    /* Error Message */
    p.error {
        color: red;
        font-weight: bold;
        text-align: center;
        background-color: #ffe5e5;
        padding: 10px;
        border-radius: 5px;
        width: fit-content;
        margin: 10px auto;
    }

    /* Responsive Design */
    @media (max-width: 768px) {
        table {
            width: 100%;
        }

        th, td {
            font-size: 14px;
            padding: 10px;
        }

        .logout-button {
            font-size: 16px;
            padding: 8px 15px;
        }
    }
</style>

</head>
<body>

    <h1 align="center" style="color: purple;">You are Successfully Logged in</h1>
    <h2 align="center" style="color: blue;">Order Details:</h2>

    <table>
        <tr>
            <th>Order ID</th>
            <th>Customer Name</th>
            <th>Moving Date</th>
            <th>Pickup Address</th>
            <th>Delivery Address</th>
            <th>Distance (km)</th>
            <th>Total Amount</th>
            <th>Action</th>
        </tr>

        <%
        Connection con = null;
        PreparedStatement orderPs = null;
        ResultSet orderRs = null;

        try {
            String URL = "jdbc:mysql://localhost:3306/movehome";
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(URL, "root", "root");

            // Fetch order details
            String selectQuery = "SELECT order_id, customer_name, moving_date, pickup_address, delivery_address, distance, charges FROM orders";
            orderPs = con.prepareStatement(selectQuery);
            orderRs = orderPs.executeQuery();

            while (orderRs.next()) {
        %>
        <tr>
            <td><%= orderRs.getInt("order_id") %></td>
            <td><%= orderRs.getString("customer_name") %></td>
            <td><%= orderRs.getString("moving_date") %></td>
            <td><%= orderRs.getString("pickup_address") %></td>
            <td><%= orderRs.getString("delivery_address") %></td>
            <td><%= orderRs.getInt("distance") %></td>
            <td><%= orderRs.getInt("charges") %> Rs</td>
            <td><a href="update.jsp?order_id=<%= orderRs.getInt("order_id") %>">Update Status</a></td>
        </tr>
        <%
            }
        } catch (Exception e) {
        %>
        <p class="error">Error: <%= e.getMessage() %></p>
        <%
            e.printStackTrace();
        } finally {
            if (orderRs != null) orderRs.close();
            if (orderPs != null) orderPs.close();
            if (con != null) con.close();
        }
        %>
    </table>

    <!-- Logout Button -->
    <div class="logout-button-container">
        <a href="logout1.jsp" class="logout-button">Logout</a>
    </div>

</body>
</html>
