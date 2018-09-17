<%@page import="com.db.DbConn"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.db.DbConn"%>
    
    <%
    String data = request.getParameter("data");
    System.out.println("Data gained : "+data);
    try{
    Statement st = null;
    ResultSet rs = null;
    st = DbConn.connect();
    String sql = "SELECT * from drugs where id='"+data+"'";
    rs = st.executeQuery(sql);
    rs.next();
    out.print("<form class='form-signin' action='AddMed' method='post'>");
    out.print("<input type='hidden' name='drugId' value='"+data+"'/>");
    out.print("<h3 class='form-signin-heading'>Add Medicine Details</h3>");
    out.print("<span class='label label-info'>Drug Type</span>");
    out.print("<input type='text' class='input-block-level validate[required]' placeholder='full name' name='drugType' value='"+rs.getString(2) +"' readonly=true />");
    out.print("<span class='label label-info'>Medicine Name</span>");
    out.print("<input type='text' class='input-block-level validate[required]' placeholder='Medicine Name' name='medName'/>");
    out.print("<span class='label label-info'>Doctor ID</span>");
    out.print("<input type='text' class='input-block-level validate[required]' name='docId' value='"+session.getAttribute("username") +"'readonly=true />");
    out.print("<span class='label label-info'>Description</span>");
    out.print("<input type='text' class='input-block-level validate[required]' placeholder='Medicine Description' name='medDesc'/>");
    out.print("<button align='middle' class='btn btn-large btn-primary' type='submit' align='center' >Add</button>");
    out.print("</form>");
    }
    catch(Exception e)
    {
        out.println("Error : "+e.toString());
    }
%>