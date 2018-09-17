<%@include file="header.jsp" %>
<%@include file="navigation.jsp" %>
<%@include file="flash.jsp" %>
<%
String user = (String) session.getAttribute("UserType");
String s = null;
%>
<div class="container">
    <div class="row background space20">
        <div class="span12">
            <form class="form-signin" action="AddDrug" method="post">
                <h2 class="form-signin-heading">Add Drug Info</h2>
                <span class="label label-info">Enter Drug Category</span>
                <input type="text" class="input-block-level validate[required]" placeholder="Drug Category" name="drug"/>
                <span class="label label-info">Drug Description</span>
                <input type="text" class="input-block-level validate[required]" rows="3" placeholder="Description" name="desc"/>
                <button align="middle" class="btn btn-large btn-primary" type="submit" align="center" >Add</button>
            </form>
        </div>
    </div>
</div>
<%@include file="footer.jsp" %>