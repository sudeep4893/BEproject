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
        <script>
            function loadData()
            {
                var data = document.getElementById("meds");
                
                var XmlHttpObject;
                if (window.XMLHttpRequest) {
                    XmlHttpObject = new XMLHttpRequest();
                }
                else if (window.ActiveXObject) {
                    XmlHttpObject = new ActiveXObject("Microsoft.XMLHTTP");
                }
                if(data.options[data.selectedIndex].value>0)
                    {
                XmlHttpObject.open('get', 'data_med.jsp?data=' + data.options[data.selectedIndex].value , true);
                XmlHttpObject.onreadystatechange=function(){
                    if (XmlHttpObject.readyState==4 && XmlHttpObject.status==200){
                        document.getElementById("tbldata").innerHTML=XmlHttpObject.responseText;
                    }
                }
                XmlHttpObject.send();
                }
                else{
                    alert("Select the Drug Type");
                }
            }
        </script>
        <title></title>
    </head>
    <body>
        <div class="container">
            <center><br/><br/>Select Drug Category : <select id="meds" onchange="loadData()">
                    <option value="0"></option>
                <%
                Statement st = DbConn.connect();
                String sql = "select * from drugs";
                ResultSet rs = st.executeQuery(sql);
                while(rs.next())
                {
                %>
                <option value=<%=rs.getInt(1) %>><%= rs.getString(2) %></option>
                <%}%>
                </select></center>
            <br/><br/>
            <div id="tbldata">
                   
            </div>
        </div>
    </body>
</html>

<%@include file="footer.jsp" %>