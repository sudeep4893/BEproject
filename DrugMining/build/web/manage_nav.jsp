<%@page import="java.lang.String"%>
<%@page import="java.util.HashMap"%>
<ul class="pull-right nav">
    <%
        String userType = (String) session.getAttribute("UserType");
        System.out.println("userType: " + userType);
        if (userType == null) {
    %>
    <li><a href="login.jsp">Login</a></li>
    <li><a href="register.jsp">Register</a></li>
    <% } else {
        if (userType.equals("admin")) { %>
    <li><a href="register.jsp">Add a Doctor</a></li>
    <li><a href="register_pharmacist.jsp">Add a Pharmaceutical Company</a></li>
    <li><a href="add_Drug.jsp">Drug Category</a></li>
    <li><a href="StopwordRemovalServlet">Train</a></li>
    <li><a href="table_view.jsp">View</a></li>
    <li><a href="view_drugs.jsp">Drugs</a></li>
    <li><a href="view_users.jsp">Users</a></li>
    <li><a href="view_doctors.jsp">Doctor</a></li>
    <li><a href="view_pharmacist.jsp">Pharmacist</a></li>
    <li><a href="logout.jsp">Logout [<%= session.getAttribute("username1") %>]</a></li>
    <%} else if(userType.equals("user")) {%>
    <li><a href="give_reviews.jsp">Give Review</a></li>
    <li><a href="view_reviews.jsp">View Reviews</a></li>
    <li><a href="view_drugs.jsp">View Drugs</a></li>
    <li><a href="logout.jsp">Logout User - [<%= session.getAttribute("username") %>]</a></li>
    <% } else if(userType.equals("doctor")) { %>
    <li><a href="give_reviews.jsp">Give Review</a></li>
    <li><a href="Add_Meds.jsp">Add Medicine</a></li>
    <li><a href="view_drugs.jsp">View Drugs</a></li>
    <li><a href="logout.jsp">Logout Doctor - [<%= session.getAttribute("username") %>]</a></li>
    <%} else{%>
    <!--<li><a href="Add_Meds.jsp">Add Medicine</a></li>-->
    <li><a href="view_drugs.jsp">View Drugs</a></li>
    <li><a href="view_reviews.jsp">View Reviews</a></li>
    <li><a href="logout.jsp">Logout Pharma - [<%= session.getAttribute("username") %>]</a></li>
    <%}}%>
</ul>