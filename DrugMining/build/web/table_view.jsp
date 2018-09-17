<%-- 
    Document   : veiwdtraindata
    Created on : Mar 25, 2015, 1:27:24 PM
    Author     : SACHIT
--%>
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
        <title>JSP Page</title>
    </head>

    <body>

        <div  class="space20"> 
            <div class="span5">
                <h3> Positive Trained Words</h3>
                <%
                    Statement st = null;
                    ResultSet rs = null;
                    try {
                        st = DbConn.connect();
                        String sql = "SELECT * FROM train_data where class = 'positive'";
                        rs = st.executeQuery(sql);
                %>
                <table class="table table-hover table-striped">
                    <thead>
                        <tr>
                             <th>Keywords</th>
                             <th>Frequency</th>
                             <th>Tot_keys</th>
                             <th>Key Weights</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%while (rs.next()) {
                         
                                String id = rs.getString(1);
                                String keyword = rs.getString(3);
                                String freq = rs.getString(4);
                                String tot_keys=rs.getString(5);
                                String key_weight = rs.getString(6);
                           
                        %>
                        <tr>

                            <td> 
                                <%= keyword%>
                            </td>
                            <td>
                                <%=freq%>
                            </td>
                            <td>
                                <%=tot_keys%>
                                </td>
                            <td> 
                                <%= key_weight%>
                            </td>


                            <%String userType1 = (String) session.getAttribute("UserType");%>
                        </tr>

                        <% }
                            } catch (Exception e) {
                                e.printStackTrace();
                            }
                        %>
                    </tbody>
                </table>

            </div>
            <div class="span5">
               <h3>Negative Trained Words</h3>
                <%
                    Statement st1 = null;
                    ResultSet rs1 = null;
                    try {
                        st1 = DbConn.connect();
                        String sql = "SELECT * FROM train_data where class = 'negative'";
                        rs1 = st1.executeQuery(sql);
                %>

                <table class="table table-hover table-striped">
                    <thead>
                        <tr>
                            <th>Keywords</th>
                            <th>Frequency</th>
                            <th>Tot_keys</th>
                            <th>Key Weights</th>
                        </tr>
                    </thead>
                    <tbody>
                      
                        <%while (rs1.next()) {
                             
                                String id = rs1.getString(1);
                                String keyword = rs1.getString(3);
                                String freq = rs1.getString(4);
                                String tot_keys=rs1.getString(5);
                                String key_weight = rs1.getString(6);
                             
                               
                        %>
                        <tr>

                            <td> 
                                <%= keyword%>
                            </td>
                            <td>
                                <%= freq%>
                            </td>
                            <td>
                                <%=tot_keys%>
                                </td>
                            <td> 
                                <%= key_weight%>
                            </td>
                            
                            
                           
                         
                            <%String userType1 = (String) session.getAttribute("UserType");%>
                            
                        </tr>

                        <% }
                            } catch (Exception e) {
                                e.printStackTrace();
                            }
                        %>
              
                        
                    </tbody>
                    
                    
                </table>
                    
                    </div>
          
                    
    </body>
</html>
