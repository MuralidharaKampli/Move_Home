<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%
    HttpSession mysession = request.getSession(false); // Do not create a new session if none exists
    if (mysession == null || mysession.getAttribute("customer_id") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    
    int customerId = (int) mysession.getAttribute("customer_id");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Moving Service Order</title>
    <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_API_KEY_HERE"></script>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 0;
        }
        h1 {
            text-align: center;
            color: #333;
        }
        form {
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        label {
            font-weight: bold;
            display: block;
            margin-bottom: 5px;
        }
        input, textarea, select {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 16px;
            box-sizing: border-box;
        }
        input[type="number"] {
            width: 100px;
        }
        input[type="submit"] {
            background-color: #333;
            color: #fff;
            border: none;
            padding: 10px 20px;
            font-size: 18px;
            border-radius: 4px;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #555;
        }
    </style>
    <script>
        function calculateCharges() {
            let distance = parseFloat(document.getElementById("distance").value) || 0;
            let baseRate = 10; // Base rate per km
            let totalCharges = distance * baseRate;

            let fridge = parseInt(document.getElementById("fridgeQuantity").value) * 200 || 0;
            let fan = parseInt(document.getElementById("fanQuantity").value) * 100 || 0;
            let tables = parseInt(document.getElementById("tablesQuantity").value) * 300 || 0;
            let sofa = parseInt(document.getElementById("sofaQuantity").value) * 750 || 0;
            let luggage = parseInt(document.getElementById("luggageQuantity").value) * 150 || 0;

            totalCharges += fridge + fan + tables + sofa + luggage;
            document.getElementById("charges").value = totalCharges.toFixed(2);
            document.getElementById("displayCharges").value = totalCharges.toFixed(2) + " Rs"; // Displaying total charges
        }

        window.onload = function() {
            document.getElementById("distance").addEventListener("input", calculateCharges);
            document.querySelectorAll("input[type='number']").forEach(input => {
                input.addEventListener("input", calculateCharges);
            });
        };
    </script>
</head>
<body>
    <h1>Moving Service Order</h1>
    <form action="process_order.jsp" method="post">
        <!-- Hidden fields for Customer ID and Charges -->
        <input type="hidden" name="customerId" value="<%= customerId %>">
        <input type="hidden" id="charges" name="charges" value="0">

        <label for="customerName">Customer Name:</label>
        <input type="text" id="customerName" name="customerName" required>

        <label for="contactNumber">Contact Number:</label>
        <input type="tel" id="contactNumber" name="contactNumber" required>

        <label for="movingDate">Moving Date:</label>
        <input type="date" id="movingDate" name="movingDate" required>

        <label for="pickupAddress">Pickup Address:</label>
        <textarea id="pickupAddress" name="pickupAddress" rows="3" required></textarea>

        <label for="deliveryAddress">Delivery Address:</label>
        <textarea id="deliveryAddress" name="deliveryAddress" rows="3" required></textarea>

        <label for="services">Select Services:</label>
        <select id="services" name="services" required>
            <option value="local">Local Moving</option>
            <option value="longDistance">Long Distance Moving</option>
        </select>

        <label for="distance">Total Distance (km):</label>
        <input type="number" id="distance" name="distance" min="1" required>

        <h2>Packers Service</h2>
        <label for="fridgeQuantity">Fridge (Rs. 200 each):</label>
        <input type="number" id="fridgeQuantity" name="fridgeQuantity" min="0" value="0">

        <label for="fanQuantity">Fan (Rs. 100 each):</label>
        <input type="number" id="fanQuantity" name="fanQuantity" min="0" value="0">

        <label for="tablesQuantity">Tables (Rs. 300 each):</label>
        <input type="number" id="tablesQuantity" name="tablesQuantity" min="0" value="0">

        <label for="sofaQuantity">Sofa (Rs. 750 each):</label>
        <input type="number" id="sofaQuantity" name="sofaQuantity" min="0" value="0">

        <label for="luggageQuantity">Luggage (Rs. 150 each):</label>
        <input type="number" id="luggageQuantity" name="luggageQuantity" min="0" value="0">

        <label>Total Charges (Rs.):</label>
        <input type="text" id="displayCharges" disabled>

        <div>
            <input type="submit" value="Submit Order">
        </div>
    </form>
</body>
</html>