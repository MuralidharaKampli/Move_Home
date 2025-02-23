
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            text-align: center;
            margin: 0;
            padding: 0;
        }

        a.btn {
            text-decoration: none;
            color: white;
            background-color: #4CAF50;
            padding: 10px 20px;
            border-radius: 5px;
            margin-top: 20px;
            display: inline-block;
        }

        a.btn:hover {
            background-color: #45a049;
        }

        h1 {
            color: #4CAF50;
        }

        table {
            border-collapse: collapse;
            width: 80%;
            margin: auto;
            background-color: white;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #4CAF50;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        tr:hover {
            background-color: #e0e0e0;
        }

        .logout-button {
            font-size: 20px;
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 10px 20px;
            cursor: pointer;
            border-radius: 5px;
            display: block;
            margin: 20px auto;
        }

        .logout-button:hover {
            background-color: #45a049;
        }

        p {
            color: red;
            font-weight: bold;
            font-size: 18px;
            margin-top: 10px;
            text-align: center;
        }
    </style>
</head>
<body>

<%
    Connection con = null;
    PreparedStatement ps = null;
    PreparedStatement moversPs = null;
    ResultSet rs = null;
    ResultSet moversRs = null;
    String message = "";

    try {
        // Get session or create a new one
        HttpSession mysession = request.getSession(true); // Ensure a session exists
        String email = (String) mysession.getAttribute("email");
        String password = (String) mysession.getAttribute("password");

        // If session does not have email/password, get from request parameters
        if (email == null || password == null) {
            email = request.getParameter("email");
            password = request.getParameter("password");

            // Store in session to persist across pages
            if (email != null && password != null) {
                mysession.setAttribute("email", email);
                mysession.setAttribute("password", password);
            }
        }

        if (email == null || password == null || email.trim().isEmpty() || password.trim().isEmpty()) {
            message = "⚠ Error: Email and Password cannot be empty!";
        } else {
            String URL = "jdbc:mysql://localhost:3306/movehome";
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(URL, "root", "root");

            String sql = "SELECT id, first_name FROM register WHERE email=? AND password=?";
            ps = con.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, password);
            rs = ps.executeQuery();

            if (rs.next()) {
                int customerId = rs.getInt("id");
                String firstName = rs.getString("first_name");

                // Store user details in session
                mysession.setAttribute("customer_id", customerId);
                mysession.setMaxInactiveInterval(-1); // Session never expires until logout

                out.println("<h1>Welcome, " + firstName + "!</h1>");
%>
                <h2>Movers Details:</h2>
                <table>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Charges</th>
                        <th>Phone Number</th>
                        <th>Order Now</th>
                    </tr>
<%
                moversPs = con.prepareStatement("SELECT * FROM movers");
                moversRs = moversPs.executeQuery();

                while (moversRs.next()) {
%>
                    <tr>
                        <td><%= moversRs.getInt("id") %></td>
                        <td><%= moversRs.getString("name") %></td>
                        <td><%= moversRs.getInt("charges") %> Rs per Km</td>
                        <td><%= moversRs.getString("phone") %></td>
                        <td>
                            <a href="order.jsp?charges=<%= moversRs.getInt("charges") %>&customerId=<%= customerId %>&email=<%= email %>">Order</a>
                        </td>
                    </tr>
<%
                }
%>
                </table>

                <!-- User Actions -->
                <div>
                    <a href='status.jsp?id=<%= customerId %>' class="btn">View Status</a>
                </div>
                <br>
                <div>
                    <a href='review.jsp' class="btn">Write a Review</a>
                </div>

                <!-- Logout Button -->
                <form action="logout.jsp" method="post">
                    <input class="logout-button" type="submit" value="Logout">
                </form>
<%
            } else {
                message = "❌ Invalid email or password!";
            }
        }
    } catch (Exception e) {
        e.printStackTrace();
        message = "⚠ Internal Server Error. Please try again later.";
    } finally {
        try {
            if (rs != null) rs.close();
            if (ps != null) ps.close();
            if (moversRs != null) moversRs.close();
            if (moversPs != null) moversPs.close();
            if (con != null) con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    if (!message.isEmpty()) {
%>
        <p><%= message %></p>
        <a href="login.jsp" class="btn">Try Again</a>
<%
    }
%>

</body>
</html>
