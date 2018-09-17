<%@page import="java.awt.Checkbox"%>
<%@page import="com.db.DbConn"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.db.DbConn"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String data = request.getParameter("data");
    try {
        System.out.println("Data medicine : " + data);
        Statement st = null;
        ResultSet rs = null;
        st = DbConn.connect();
        String sql = "SELECT * from medicines where med_name='" + data + "'";
        rs = st.executeQuery(sql);
        if (rs.next()) {
            System.out.println("Data gained : " + rs.getString("med_name"));
            out.println("<center><br/><br/><h5> Enter review for <h3>" + rs.getString("med_name") + "</h3></h52>");
            out.println("<input type='hidden' name='medicine1' value='" + rs.getString("id") + "#" + rs.getString("drug_id") + "' >");
            out.println("</center>");
        } else {
            out.println("<input type='hidden' name='medicine1' value='No DATA#No DATA' >");
            out.println("<center><br/><h3>No Medicine found</h3>");
            out.println("</center>");
        }
    } catch (Exception e) {
        System.out.println("Ex : " + e.toString());
    }
%>