<%@include file="header.jsp" %>
<%@include file="navigation.jsp" %>
<%@include file="flash.jsp" %>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.db.DbConn"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <%
            Statement st = null;
            ResultSet rs = null;
            Statement st1 = null;
            ResultSet rs1 = null;
            try {
                st = DbConn.connect();
                String sql = "select * from medicines where drug_id = '"+request.getParameter("id") +"'";
                rs = st.executeQuery(sql);
                
                st1 = DbConn.connect();
                sql = "select drug_name from drugs where id = '"+request.getParameter("id") +"'";
                rs1 = st1.executeQuery(sql);
                rs1.next();
        %>
        <div class="container">
            <div>
                <h2>Medicines Prescribed under <%= rs1.getString(1) %> </h2>
                <table class="table table-hover table-striped">
                    <thead>
                        <tr>
                            <th>Medicine Name</th>
                            <th>Doctor Name</th>
                            <th>Description</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%while (rs.next()) {
                            int id = rs.getInt(1);
                            String name = rs.getString(3);
                            String doc_name = rs.getString(4);
                            String desc = rs.getString(5);%>
                        <tr>
                            <td> 
                                <%= name%>
                            </td>
                            <td> 
                                <%= doc_name%>
                            </td>
                            <td> 
                                <%= desc%>
                            </td>
                            <%
                            String userType1 = (String) session.getAttribute("UserType");
                            if(userType1.equals("admin"))
                            {
                            %>
                            <td>
                                <a href="block_med.jsp?id=<%= id%>" class="btn btn-small btn-block btn-danger"></i>Delete</a>
                            </td>
                            <%
                            }
                            %>
                        </tr>
                        <% }
            } catch (Exception e) {
                e.printStackTrace();
            }%>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>

<%@include file="footer.jsp" %>