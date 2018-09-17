<%
    session.setAttribute("User", null);
    session.setAttribute("UserType", null);
    session.setAttribute("flash_message", "logged out successfully !!!");
    session.setAttribute("flash_type", "info");
    session.invalidate();
    response.sendRedirect("index.jsp");
%>

