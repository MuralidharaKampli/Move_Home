<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>

<%
    // Session Check - Ensure user is logged in
    HttpSession mysession = request.getSession(false);
    if (mysession == null || mysession.getAttribute("email") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    // Get user input
    String email = request.getParameter("email");
    String message = request.getParameter("message");

    // Input validation - prevent blank fields
    if (email == null || email.trim().isEmpty() || message == null || message.trim().isEmpty()) {
        out.println("<script>alert('Email and Message fields cannot be empty!'); history.back();</script>");
        return;
    }

    // Database credentials
    String url = "jdbc:mysql://localhost:3306/movehome";
    String user = "root";
    String password = "root";

    Connection conn = null;
    PreparedStatement pstmt = null;
    String sql = "INSERT INTO enquiry (email, message) VALUES (?, ?)";

    try {
        // Load MySQL driver
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(url, user, password);

        // Prepare and execute SQL statement
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, email);
        pstmt.setString(2, message);
        pstmt.executeUpdate();

        // Success Message & Redirect
        out.println("<script>");
        out.println("alert('Your Enquiry Form is successfully submitted!\\nWe will contact you later and help you out.');");
        out.println("window.location.href = 'http://localhost:8081/Move_Home/index.jsp';"); // Redirect to index.jsp
        out.println("</script>");

    } catch (Exception e) {
        e.printStackTrace();
        out.println("<script>alert('Error submitting enquiry: " + e.getMessage() + "'); history.back();</script>");
    } finally {
        try {
            if (pstmt != null) pstmt.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>
