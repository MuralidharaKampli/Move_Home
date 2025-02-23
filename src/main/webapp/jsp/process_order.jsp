<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*, javax.servlet.http.*, javax.servlet.*" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Processing Order</title>
    <script>
        function showSuccessMessage() {
            alert("✅ Order placed successfully!");
            window.location.href = "order.jsp";
        }
    </script>
</head>
<body>
<%
    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    try {
        // Check session
        if (session == null || session.getAttribute("customer_id") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        // Get customer ID from session
        int customerId = (Integer) session.getAttribute("customer_id");

        // Retrieve form parameters
        String customerName = request.getParameter("customerName");
        String contactNumber = request.getParameter("contactNumber");
        String movingDate = request.getParameter("movingDate");
        String pickupAddress = request.getParameter("pickupAddress");
        String deliveryAddress = request.getParameter("deliveryAddress");
        String services = request.getParameter("services");
        
        // Safely parse integer fields (avoid crashes)
        int distance = request.getParameter("distance") != null ? Integer.parseInt(request.getParameter("distance")) : 0;
        int fridgeQuantity = request.getParameter("fridgeQuantity") != null ? Integer.parseInt(request.getParameter("fridgeQuantity")) : 0;
        int fanQuantity = request.getParameter("fanQuantity") != null ? Integer.parseInt(request.getParameter("fanQuantity")) : 0;
        int tablesQuantity = request.getParameter("tablesQuantity") != null ? Integer.parseInt(request.getParameter("tablesQuantity")) : 0;
        int sofaQuantity = request.getParameter("sofaQuantity") != null ? Integer.parseInt(request.getParameter("sofaQuantity")) : 0;
        int luggageQuantity = request.getParameter("luggageQuantity") != null ? Integer.parseInt(request.getParameter("luggageQuantity")) : 0;

        // Database connection
        String URL = "jdbc:mysql://localhost:3306/movehome";
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection(URL, "root", "root");

        // Fetch charge per km from `movers` table (if exists)
        int chargePerKm = 10; // Default charge
        String chargeQuery = "SELECT charges FROM movers LIMIT 1";
        ps = con.prepareStatement(chargeQuery);
        rs = ps.executeQuery();
        if (rs.next()) {
            chargePerKm = rs.getInt("charges");
        }
        rs.close();
        ps.close();

        // Calculate total charges
        int totalCharges = (distance * chargePerKm) +
                           (fridgeQuantity * 200) +
                           (fanQuantity * 100) +
                           (tablesQuantity * 300) +
                           (sofaQuantity * 750) +
                           (luggageQuantity * 150);

        // Insert order into `orders` table with `order_time` and `status`
        String sql = "INSERT INTO orders (customer_id, customer_name, contact_number, moving_date, pickup_address, delivery_address, services, distance, charges, order_time, status) " +
                     "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, NOW(), 'Pending')";
        ps = con.prepareStatement(sql);
        ps.setInt(1, customerId);
        ps.setString(2, customerName);
        ps.setString(3, contactNumber);
        ps.setString(4, movingDate);
        ps.setString(5, pickupAddress);
        ps.setString(6, deliveryAddress);
        ps.setString(7, services);
        ps.setInt(8, distance);
        ps.setInt(9, totalCharges);

        int rowsInserted = ps.executeUpdate();

        if (rowsInserted > 0) {
%>
            <script>
                showSuccessMessage();
            </script>
<%
        } else {
            out.println("<p style='color: red;'>⚠ Error: Order submission failed. Please try again.</p>");
        }
    } catch (NumberFormatException e) {
        out.println("<p style='color: red;'>⚠ Invalid input format. Please enter correct details.</p>");
        e.printStackTrace();
    } catch (Exception e) {
        out.println("<p style='color: red;'>⚠ Internal Server Error. Please try again later.</p>");
        e.printStackTrace();
    } finally {
        // Close resources safely
        try { if (rs != null) rs.close(); } catch (SQLException e) { e.printStackTrace(); }
        try { if (ps != null) ps.close(); } catch (SQLException e) { e.printStackTrace(); }
        try { if (con != null) con.close(); } catch (SQLException e) { e.printStackTrace(); }
    }
%>
</body>
</html>
