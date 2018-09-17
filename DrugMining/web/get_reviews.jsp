<%@page import="com.mining.Stemmer"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.File"%>
<%@page import="com.db.DbConn"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>

<%
    Statement std = null;
    ResultSet rsd = null;
    Statement st1 = null;
    ResultSet rs1 = null;
    int recpos = 0;
    int recneg = 0;

    double overallpos = 0.0;
    double overallneg = 0.0;
    try {
        std = DbConn.connect();
        st1 = DbConn.connect();
        String sqld = "select distinct(user_type) from reviews where drug_id = '" + request.getParameter("data") + "' and med_id = '" + request.getParameter("datamed") + "'";
        rsd = std.executeQuery(sqld);

        recpos = 0;
        recneg = 0;
        while (rsd.next()) {%>
<h3> <%= rsd.getString(1)%>'s Review </h3>
<table class="table table-hover table-striped">
    <thead>
        <tr>
            <th>Drug Type</th>
            <th>Medicine Name</th>
            <th>Review</th>
            <th>User Name</th>
            <th>Review Type</th>
        </tr>
    </thead>
    <%sqld = "select * from reviews where user_type='" + rsd.getString(1) + "' and drug_id = '" + request.getParameter("data") + "' and med_id = '" + request.getParameter("datamed") + "'";
        rs1 = st1.executeQuery(sqld);
        while (rs1.next()) {%>
    <tbody>
        <tr><td>
                <%
                    String point = rs1.getString(7);
                    if (point.contains("positive")) {
                        recpos++;
                    } else {
                        if (point.contains("Negitive")) {
                            recneg++;
                        }
                    }
                    String s = rs1.getString(2);
                    String sqlx = "select drug_name from drugs where id = '" + s + "'";
                    Statement stx = DbConn.connect();
                    ResultSet rsx = stx.executeQuery(sqlx);
                    rsx.next();
                    out.print(rsx.getString(1));
                %>
            </td>
            <td>
                <%
                    s = rs1.getString(3);
                    sqlx = "select med_name from medicines where id = '" + s + "'";
                    stx = DbConn.connect();
                    rsx = stx.executeQuery(sqlx);
                    rsx.next();
                    out.print(rsx.getString(1));
                %>
            </td>
            <td>
                <%= rs1.getString(4)%>
            </td>
            <td>
                <%= rs1.getString(6)%>
            </td>
            <td>
                <%= point%>
            </td>
        </tr>
    </tbody>
    <%}%>
</table>
<%}

        session.setAttribute("pos", recpos);
        session.setAttribute("nos", recneg);
        if (recpos > recneg) {
            out.print("<center><br/><b> We Recommend you to use this drug, based on the reviews provided by the user </b><br/>Total Positive reviews : <b>" + recpos + "</b> & Negative Reveiws : <b>" + recneg + "</b></center>");
        } else if (recpos < recneg) {
            out.print("<center><br/><b>This Drug has a lot of bad reviews, we recommend you please do not use it. <b><br/>Positive reviews : <b>" + recpos + "</b> & Negative Reveiws : <b>" + recneg + "</b></center>");
        } else {
        }
    } catch (Exception e) {
        System.out.println("Ex : " + e.toString());
    }
%>
<center>
    <form id="temp">
        <br>
        <input type="hidden" id="positive" value="<%= recpos%>">
        <input type="hidden" id="negative" value="<%= recneg%>">
        <input type="button" class="btn-large" name="Submit" value="Show Graph" style="alignment-adjust: central" onclick="showpai();">
    </form>
</center>