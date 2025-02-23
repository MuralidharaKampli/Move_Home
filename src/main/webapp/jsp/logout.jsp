<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="javax.servlet.http.HttpSession" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Logout</title>
</head>
<body>
<%
    // Retrieve the current session if it exists (do not create a new session)
    HttpSession session1 = request.getSession(true);

    // Check if session exists, then invalidate it
    if (session1 != null) {
        session1.invalidate();  // Clear the session data (logout)
    }

    // Redirect to the login page after logout
    response.sendRedirect("http://localhost:8081/Move_Home/jsp/login.html");  // Change this to login.html if needed
%>
</body>
</html>
