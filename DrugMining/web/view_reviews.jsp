<%@page import="org.json.JSONArray"%>
<%@page import="com.mining.Stemmer"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.File"%>
<%@page import="com.db.DbConn"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>

<%@include file="header.jsp" %>
<%@include file="navigation.jsp" %>
<%@include file="flash.jsp" %>
<%
    JSONArray weekend = new JSONArray();
    JSONArray other = new JSONArray();
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="http://code.highcharts.com/highcharts.js"></script>
        <script src="http://code.highcharts.com/modules/exporting.js"></script>

        <script>
            function loadData()
            {
                var data = document.getElementById("drug_meds");
                
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
            
            function loadRevs()
            {
                var data = document.getElementById("drug_meds");
                var datamed = document.getElementById("meds");
                
                var XmlHttpObject;
                if (window.XMLHttpRequest) {
                    XmlHttpObject = new XMLHttpRequest();
                }
                else if (window.ActiveXObject) {
                    XmlHttpObject = new ActiveXObject("Microsoft.XMLHTTP");
                }
                if(data.options[data.selectedIndex].value>0)
                {
                    XmlHttpObject.open('get', 'get_reviews.jsp?data='+data.options[data.selectedIndex].value+'&datamed=' + datamed.options[datamed.selectedIndex].value , true);
                    XmlHttpObject.onreadystatechange=function(){
                        if (XmlHttpObject.readyState==4 && XmlHttpObject.status==200){
                            document.getElementById("revws").innerHTML=XmlHttpObject.responseText;
                        }
                    }
                    XmlHttpObject.send();
                }
                else{
                    alert("Select the Medicine Type");
                }
            }
            function loadajax(){
                var data = document.getElementById("drug_meds");
                var datamed = document.getElementById("meds");
                $.post( 'get_reviews.jsp?data='+data.options[data.selectedIndex].value+'&datamed=' + datamed.options[datamed.selectedIndex].value, function( response ) {
                    $( "#revws" ).html( response );
                    console.log(response);
                    console.log(response.balance);
                },'json');
            }
            
            function showpai() {
                
                var positive = document.getElementById("temp").elements.namedItem("positive").value;
                var negative = document.getElementById("temp").elements.namedItem("negative").value;
                
                $('#container').highcharts({
                    chart: {
                        plotBackgroundColor: null,
                        plotBorderWidth: null,
                        plotShadow: true
                    },
                    title: {
                        text: 'Users and Doctors Reviews'
                    },
                    tooltip: {
                        pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
                    },
                    plotOptions: {
                        pie: {
                            allowPointSelect: true,
                            cursor: 'pointer',
                            dataLabels: {
                                enabled: true,
                                format: '<b>{point.name}</b>: {point.percentage:.1f} %',
                                style: {
                                    color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
                                }
                            }
                        }
                    },
                    series: [{
                            type: 'pie',
                            name: 'Reviews',
                            data: [
                                ['Positive',  parseInt(positive)],
                                ['Negative',  parseInt(negative)]
                            ]
                            
                        }]
                });
            }     
            
        </script>
    </head>
    <body>
        <div class="container">
            <div id="drug">
                <center><br/><br/>Select Drug Category : <select id="drug_meds" name="drug" onchange="loadData()">
                        <option value="0"></option>
                        <%
                            Statement st = DbConn.connect();
                            String sql = "select * from drugs";
                            ResultSet rs = st.executeQuery(sql);
                            while (rs.next()) {%>
                        <option value=<%=rs.getInt(1)%>><%= rs.getString(2)%></option>
                        <%}%>
                    </select></center>
            </div>
            <div id="medicine" name="medicine">
            </div>
            <div id="revws">
            </div>
            <div id="container" style="min-width: 310px; height: 400px; max-width: 600px; margin: 0 auto;"></div>
        </div>    
    </body>
</html>

<%@include file="footer.jsp" %>