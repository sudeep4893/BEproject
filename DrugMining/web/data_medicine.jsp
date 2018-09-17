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
    String sql = "SELECT * from medicines where drug_id='"+data+"'";
    rs = st.executeQuery(sql);
    out.println("<center><br/><br/>Select Medicine Name : <select id='meds' name='medicine' onchange='loadRevs()'>");
    out.print("<option> </option>");
    while(rs.next())
    {
    out.print("<option value="+rs.getInt(1)+">"+rs.getString(3)+"</option>");
    }
    }
    catch(Exception e){
        System.out.println("Ex : "+e.toString());}
        out.print("</select></center>");
%>