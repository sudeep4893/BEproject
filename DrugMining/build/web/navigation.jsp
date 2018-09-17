<div class="navbar navbar-inverse navbar-fixed-top">
    <div class="navbar-inner">
        <div class="container">
            <!-- Responsive Navbar Part 1: Button for triggering responsive navbar (not covered in tutorial). Include responsive CSS to utilize. -->
            <button type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <%
        String userTypex = (String) session.getAttribute("UserType");
        if (userTypex == null) {
    %>
            <a class="brand" href="index.jsp">Drug Mining</a>
            <%}
        else
{%>
<a class="brand" href="index.jsp">Drug Mining</a>
<%}%>
            <!-- Responsive Navbar Part 2: Place all navbar contents you want collapsed withing .navbar-collapse.collapse. -->
            <div class="nav-collapse collapse">
                
                <%@include file="manage_nav.jsp" %>
            </div><!--/.nav-collapse -->
        </div><!-- /.navbar-inner -->
    </div><!-- /.navbar -->

</div> <!-- /.container -->


