<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.db.DbConn" %>
<%@page import="java.sql.Statement" %>
<%
    String id = request.getParameter("id");
    System.out.println("in fileremove originalFname " + id);
    try {
        Statement stmt=DbConn.connect();
        String sql="DELETE from users where id='"+id+"'";
        System.out.println("SQL: "+sql);
        stmt.executeUpdate(sql);
        System.out.println("DELETE query executed successfully");
        session.setAttribute("flash_message", id+" id removed from list successfully");
        response.sendRedirect("view_doctors.jsp");
    } catch (Exception e) {
        e.printStackTrace();
    }
%>