<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.io.*, java.math.BigDecimal"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Status</title>
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f0f0f0;
	margin: 0;
	padding: 0;
}

.container {
	max-width: 800px;
	margin: 0 auto;
	padding: 20px;
	background-color: #fff;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

h1 {
	text-align: center;
	color: #333;
}

p {
	margin: 10px 0;
	color: #666;
}

a {
	text-decoration: none;
	color: #0077cc;
}

a:hover {
	text-decoration: underline;
}

button {
	background-color: #0077cc;
	color: white;
	border: none;
	padding: 10px 20px;
	font-size: 16px;
	cursor: pointer;
	border-radius: 5px;
	text-align: center;
	width: 100px;
}

button:hover {
	background-color: #005fa3;
}
</style>
</head>
<body>

	<%
	// Get the logged-in customer_id from session
	Integer customerId = (Integer) session.getAttribute("customer_id");
	if (customerId == null) {
	%>
		<script>
			alert("Please log in to view your order status.");
			window.location.href = "login.jsp"; // Redirect to login page
		</script>
	<%
		return;
	}

	// Initialize variables to hold order details
	String name = "N/A", date = "N/A", pickupadd = "N/A", deliveryadd = "N/A";
	String dist = "N/A", amt = "N/A", action = "N/A";

	try {
		// Database connection details
		String URL = "jdbc:mysql://localhost:3306/movehome";
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection(URL, "root", "root");

		// Query to fetch all orders for the logged-in customer
		PreparedStatement ps = con.prepareStatement("SELECT * FROM orders WHERE customer_id = ?");
		ps.setInt(1, customerId);

		ResultSet rs = ps.executeQuery();

		// Check if any orders exist
		boolean foundOrders = false;

		// Display the header only once before the loop
		if (rs.next()) {
			out.println("<div class='container'>");
			out.println("<h1>User Order Status</h1>");
			// Loop through all orders for the customer
			do {
				// If an order is found, retrieve its details
				name = rs.getString("customer_name");
				date = rs.getString("order_time");
				pickupadd = rs.getString("pickup_address");
				deliveryadd = rs.getString("delivery_address");
				dist = String.valueOf(rs.getInt("distance"));
				amt = String.valueOf(rs.getInt("charges"));
				action = rs.getString("status");

				// Print order details
				out.println("<div>");
				out.println("<p>Order Number: " + rs.getInt("order_id") + "</p>");
				out.println("<p>Customer Name: " + name + "</p>");
				out.println("<p>Order Date: " + date + "</p>");
				out.println("<p>Pickup Address: " + pickupadd + "</p>");
				out.println("<p>Delivery Address: " + deliveryadd + "</p>");
				out.println("<p>Distance Traveled: " + dist + " km</p>");
				out.println("<p>Total Amount: RS " + amt + "</p>");
				out.println("<p>Status: " + action + "</p>");
				out.println("<br>");
				out.println("</div>");

				foundOrders = true;

			} while (rs.next()); // Continue looping for all orders

			out.println("</div>");
		}

		if (!foundOrders) {
			out.println("<p>No orders found for this customer.</p>");
		}

		// Close resources
		rs.close();
		ps.close();
		con.close();
	} catch (Exception e) {
		e.printStackTrace();
	%>
		<p>Error: Could not fetch order details. Please try again later.</p>
	<%
	}
	%>

	<!-- Back Button -->
	<div style="text-align: center;">
		<a href="login.jsp">
			<button>Back</button>
		</a>
	</div>

</body>
</html>
