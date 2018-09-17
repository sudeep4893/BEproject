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
            try {
                st = DbConn.connect();
                String sql = "select * from drugs";
                rs = st.executeQuery(sql);
        %>
        <div class="container">
            <div>
                <table class="table table-hover table-striped">
                    <thead>
                        <tr>
                            <th>Name</th>
                            <th>Description</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%while (rs.next()) {
                                String id = rs.getString(1);
                                String name = rs.getString(2);
                                String desc = rs.getString(3);
                        %>
                        <tr>
                            <td> 
                                <%= name%>
                            </td>
                            <td> 
                                <%= desc%>
                            </td>
                            <td>
                                <a href="View_meds.jsp?id=<%= id%>" class="btn btn-small btn-block btn-info"></i>View Medicines</a>
                            </td>
                            <%String userType1 = (String) session.getAttribute("UserType");
                            if(userType1.equals("admin"))
                            {%>
                            <td>
                                <a href="block_drug.jsp?id=<%= id%>" class="btn btn-small btn-block btn-danger"></i>Delete</a>
                            </td>
                            <%}%>
                        </tr>
                        <% }
                            } catch (Exception e) {
                                e.printStackTrace();
                            }
                        %>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>

<%@include file="footer.jsp" %>