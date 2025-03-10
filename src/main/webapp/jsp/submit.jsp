<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Form Submission</title>
    
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 0;
        }

        h1 {
            color: #4CAF50;
            text-align: center;
        }

        p {
            color: green;
            font-weight: bold;
            font-size: 24px;
            text-align: center;
        }

        a {
            color: #4CAF50;
            text-decoration: none;
            display: block;
            text-align: center;
            margin-top: 20px;
            font-size: 18px;
        }

        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <%
        String firstName = request.getParameter("first_name");
        String lastName = request.getParameter("last_name");
        String email = request.getParameter("email");
        String password = request.getParameter("password"); 
        String phoneNumber = request.getParameter("phone_number");
        String city = request.getParameter("city");
        String state = request.getParameter("state");
        String pincode = request.getParameter("pincode");
        String address = request.getParameter("address"); 

        // Database connection details
        String url = "jdbc:mysql://localhost:3306/movehome"; 
        String user = "root"; 
        String dbPassword = "root";  // Updated password to "root"

        Connection conn = null;
        PreparedStatement pstmt = null;
        String sql = "INSERT INTO register (first_name, last_name, email, password, phone_number, city, state, pincode, address) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try {
            // Database connection
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(url, user, dbPassword);

            // Prepare and execute SQL statement
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, firstName);
            pstmt.setString(2, lastName);
            pstmt.setString(3, email);
            pstmt.setString(4, password);
            pstmt.setString(5, phoneNumber);
            pstmt.setString(6, city);
            pstmt.setString(7, state);
            pstmt.setString(8, pincode);
            pstmt.setString(9, address);
            pstmt.executeUpdate();

            out.println("<p>Registration of your data is successfully submitted!</p>");
            out.println("<a href=\"login.html\">Go to Login Page</a>");
            out.println("<a href=\"http://localhost:8081/Move_Home/index.jsp\">Go to Home Page</a>");

        } 
        catch (Exception e) 
        {
            e.printStackTrace();
            out.println("<p style='color: red; font-weight: bold;'>Error: " + e.getMessage() + "</p>");
        } 
        finally {
            try {
                if (pstmt != null) {
                    pstmt.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } 
            catch (SQLException e) {
                e.printStackTrace();
            }
        }
    %>
</body>
</html>
