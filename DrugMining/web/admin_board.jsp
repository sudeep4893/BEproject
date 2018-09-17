<%@include file="header.jsp" %>
<%@include file="navigation.jsp" %>
<%@include file="flash.jsp" %>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <% String username = (String)session.getAttribute("username1");%>
        <div class="container">
        <div class="row">
            <div class="col-lg-12" style="margin-left: 5%">
                <h1 class="page-header">Administrator Section
<!--                    <small>Secondary Text</small>-->
                </h1>
            </div>
        </div>
            <br/><br/>
            <!-- Projects Row -->
        <div class="row">
            <div class="col-md-6 portfolio-item" style="width:40%;float:left;margin-right: 3%;margin-left: 2%">
                <a href="#">
                    <img class="img-responsive" src="img/img1.jpg" alt="">
                </a>
                <h3>
                    <a href="#">Part One</a>
                </h3>
                <p>Details of part one will be displayed here...</p>
            </div>
            <div class="col-md-6 portfolio-item" style="width:40%;float:left;margin-right: 3%;margin-left: 2%">
                <a href="#">
                    <img class="img-responsive" src="img/img2.jpg" alt="">
                </a>
                <h3>
                    <a href="#">Part Two</a>
                </h3>
                <p>Details of part two will be displayed here...</p>
            </div>
        </div>
        <!-- /.row -->
<br/><br/>
        <!-- Projects Row -->
        <div class="row">
            <div class="col-md-6 portfolio-item" style="width:40%;float:left;margin-right: 3%;margin-left: 2%">
                <a href="#">
                    <img class="img-responsive" src="img/img3.jpg" alt="">
                </a>
                <h3>
                    <a href="#">Part Three</a>
                </h3>
                <p>Details of part three will be displayed here...</p>
            </div>
            <div class="col-md-6 portfolio-item" style="width:40%;float:left;margin-right: 3%;margin-left: 2%">
                <a href="#">
                    <img class="img-responsive" src="img/img4.jpg" alt="">
                </a>
                <h3>
                    <a href="#">Part Four</a>
                </h3>
                <p>Details of part four will be displayed here...</p>
            </div>
        </div>
        <!-- /.row -->
        <br/><br/>
        </div>
</body>
</html>
<%@include file="footer.jsp" %>