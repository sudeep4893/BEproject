<%@page import="com.db.DbConn"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@include file="header.jsp" %>
<%@include file="navigation.jsp" %>
<%@include file="flash.jsp" %>


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
                    XmlHttpObject.open('get', 'data_medicine.jsp?data=' + data.options[data.selectedIndex].value , true);
                    XmlHttpObject.onreadystatechange=function(){
                        if (XmlHttpObject.readyState==4 && XmlHttpObject.status==200){
                            document.getElementById("medicine").innerHTML=XmlHttpObject.responseText;
                        }
                    }
                    XmlHttpObject.send();
                }
                else{
                    alert("Select the Drug Type");
                }
            }
            
            function loadmedi(){
                var data = document.getElementById("forms").elements.namedItem("med").value;
            
                var XmlHttpObject;
                if (window.XMLHttpRequest) {
                    XmlHttpObject = new XMLHttpRequest();
                }
                else if (window.ActiveXObject) {
                    XmlHttpObject = new ActiveXObject("Microsoft.XMLHTTP");
                }
               
                XmlHttpObject.open('get', 'add_rev.jsp?data=' + data , true);
                XmlHttpObject.onreadystatechange=function(){
                    if (XmlHttpObject.readyState==4 && XmlHttpObject.status==200){
                        document.getElementById("medicine1").innerHTML=XmlHttpObject.responseText;
                    }
                }
                XmlHttpObject.send();
                    
            }
            
        </script>
    </head>
    <body>
        <div class="container">
            <%
                Statement st;
                String sql;
                ResultSet rs;
            %>
            <div class="span20">
                <table style="alignment-adjust: central">
                    <td>
                        <div class="span5">
                            <form class="form-signin" method="post" id="forms" action="Add_rev">
                                <!--<form class="form-signin" action="Add_Review" method="post">-->
                                <h2 class="form-signin-heading">Search Medicines </h2>
                                <div id="medicines">
                                    <input type="text" id="med" name="medi" class="input-block-level validate[required,minSize[3]]" placeholder="Enter Medicine Name">
                                    <button class="btn btn-large btn-primary" onclick="loadmedi()" type="submit">Search</button>
                                </div>
                                <div id="medicine1" name="medicine1">
                                </div>
                                <br/><br/>
                                <input type="text" class="input-block-level validate[required,minSize[3]]" placeholder="Enter Review Here" name="review" >
                                <button class="btn btn-large btn-primary" type="submit" >Submit</button>
                            </form>
                        </div>
                    </td>
                    <td>
                        <div class="span5"> <form class="form-signin" action="Add_Review" method="post">
                                <h2 class="form-signin-heading">Reviews</h2>
                                <div id="drug">
                                    <center><br/><br/>Select Drug Category : <select id="meds" name="drug" onchange="loadData()">
                                            <option value="0"></option>
                                            <%
                                                st = DbConn.connect();
                                                sql = "select * from drugs";
                                                rs = st.executeQuery(sql);
                                                while (rs.next()) {%>
                                            <option value=<%=rs.getInt(1)%>><%= rs.getString(2)%></option>
                                            <%}%>
                                        </select></center>
                                </div>
                                <div id="medicine" name="medicine">

                                </div>
                                <br/><br/>
                                <input type="text" class="input-block-level validate[required,minSize[3]]" placeholder="Enter Review Here" name="review" >
                                <button class="btn btn-large btn-primary" type="submit">Submit</button>
                            </form>
                        </div>
                    </td>
                </table>
            </div>
    </body>
</div>
</html>
<div> <%@include file="footer.jsp" %>
</div>