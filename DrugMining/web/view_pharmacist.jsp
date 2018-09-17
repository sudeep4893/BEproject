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
            String userid = (String) session.getAttribute("id");
            System.out.println("userid=" + userid);
            try {
                st = DbConn.connect();
                String sql = "select * from users where user_type = 'pharma'";
                rs = st.executeQuery(sql);
        %>
        <div class="container">
            <div>
                <table class="table table-hover table-striped">
                    <thead>
                        <tr>
                            <th>Name</th>
                            <th>Address</th>
                            <th>Email</th>
                            <th>Contact No.</th>
                            <th>Registered on</th>
                            <th>Delete</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%while (rs.next()) {
                                String id = rs.getString(1);
                                String full_name = rs.getString(2);
                                String user_name = rs.getString(3);
                                String pass_word = rs.getString(4);
                                String address = rs.getString(5);
                                String email = rs.getString(6);
                                String contact_no = rs.getString(7);
                                String created_timestamp = rs.getString(9);
                        %>
                        <tr>
                            <td> 
                                <%= full_name%>
                            </td>
                            <td> 
                                <%= address%>
                            </td>
                            <td> 
                                <%= email%>
                            </td>
                            <td> 
                                <%= contact_no%>
                            </td>
                            <td> 
                                <%= created_timestamp%>
                            </td>
                    <td>
                    <a href="block_pharmacist.jsp?id=<%= id%>" class="btn btn-small btn-block btn-danger"></i>Delete</a>
                    </td>     
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