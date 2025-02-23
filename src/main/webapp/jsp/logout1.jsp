<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession" %>

<%
    HttpSession session1 = request.getSession(false);
    if (session1 != null) {
        session1.invalidate(); // Destroy the session
    }

    // Prevent caching of this page
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); 
    response.setHeader("Pragma", "no-cache"); 
    response.setHeader("Expires", "0");

    // Redirect to login page
    response.sendRedirect("http://localhost:8081/Move_Home/jsp/admin.html");
%>
