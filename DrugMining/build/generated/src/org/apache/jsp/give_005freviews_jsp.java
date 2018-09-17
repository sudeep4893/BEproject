package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import com.db.DbConn;
import java.sql.ResultSet;
import java.sql.Statement;
import java.lang.String;
import java.util.HashMap;

public final class give_005freviews_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList<String>(5);
    _jspx_dependants.add("/header.jsp");
    _jspx_dependants.add("/navigation.jsp");
    _jspx_dependants.add("/manage_nav.jsp");
    _jspx_dependants.add("/flash.jsp");
    _jspx_dependants.add("/footer.jsp");
  }

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Drug Mining</title>\n");
      out.write("        <link href=\"css/bootstrap.css\" rel=\"stylesheet\">\n");
      out.write("        <link href=\"css/font-awesome.css\" rel=\"stylesheet\">\n");
      out.write("        <link href=\"css/validationEngine.css\" rel=\"stylesheet\">\n");
      out.write("        <link href=\"css/stye.css\" rel=\"stylesheet\">\n");
      out.write("        <script src=\"js/jquery-1.7.1.min.js\"></script>\n");
      out.write("        <script src=\"js/bootstrap.min.js\"></script>\n");
      out.write("        <script src=\"js/jquery.validationEngine-en.js\"></script>\n");
      out.write("        <script src=\"js/jquery.validationEngine.js\"></script>\n");
      out.write("        <script src=\"js/script.js\"></script>\n");
      out.write("    </head>\n");
      out.write("    <body>");
      out.write('\n');
      out.write("<div class=\"navbar navbar-inverse navbar-fixed-top\">\n");
      out.write("    <div class=\"navbar-inner\">\n");
      out.write("        <div class=\"container\">\n");
      out.write("            <!-- Responsive Navbar Part 1: Button for triggering responsive navbar (not covered in tutorial). Include responsive CSS to utilize. -->\n");
      out.write("            <button type=\"button\" class=\"btn btn-navbar\" data-toggle=\"collapse\" data-target=\".nav-collapse\">\n");
      out.write("                <span class=\"icon-bar\"></span>\n");
      out.write("                <span class=\"icon-bar\"></span>\n");
      out.write("                <span class=\"icon-bar\"></span>\n");
      out.write("            </button>\n");
      out.write("            ");

        String userTypex = (String) session.getAttribute("UserType");
        if (userTypex == null) {
    
      out.write("\n");
      out.write("            <a class=\"brand\" href=\"index.jsp\">Drug Mining</a>\n");
      out.write("            ");
}
        else
{
      out.write("\n");
      out.write("<a class=\"brand\" href=\"welcome.jsp\">Drug Mining</a>\n");
}
      out.write("\n");
      out.write("            <!-- Responsive Navbar Part 2: Place all navbar contents you want collapsed withing .navbar-collapse.collapse. -->\n");
      out.write("            <div class=\"nav-collapse collapse\">\n");
      out.write("                \n");
      out.write("                ");
      out.write("\n");
      out.write("\n");
      out.write("<ul class=\"pull-right nav\">\n");
      out.write("    ");

        String userType = (String) session.getAttribute("UserType");
        System.out.println("userType: " + userType);
        if (userType == null) {
    
      out.write("\n");
      out.write("    <li><a href=\"login.jsp\">Login</a></li>\n");
      out.write("    <li><a href=\"register.jsp\">Register</a></li>\n");
      out.write("    ");
 } else {
        if (userType.equals("admin")) { 
      out.write("\n");
      out.write("    <li><a href=\"register.jsp\">Add a Doctor</a></li>\n");
      out.write("    <li><a href=\"register_pharmacist.jsp\">Add a Pharmaceutical Company</a></li>\n");
      out.write("    <li><a href=\"add_Drug.jsp\">Drug Category</a></li>\n");
      out.write("    <li><a href=\"StopwordRemovalServlet\">Train</a></li>\n");
      out.write("    <li><a href=\"table_view.jsp\">View</a></li>\n");
      out.write("    <li><a href=\"view_drugs.jsp\">Drugs</a></li>\n");
      out.write("    <li><a href=\"view_users.jsp\">Users</a></li>\n");
      out.write("    <li><a href=\"view_doctors.jsp\">Doctor</a></li>\n");
      out.write("    <li><a href=\"view_pharmacist.jsp\">Pharmacist</a></li>\n");
      out.write("    <li><a href=\"logout.jsp\">Logout [");
      out.print( session.getAttribute("username1") );
      out.write("]</a></li>\n");
      out.write("    ");
} else if(userType.equals("user")) {
      out.write("\n");
      out.write("    <li><a href=\"give_reviews.jsp\">Give Review</a></li>\n");
      out.write("    <li><a href=\"view_reviews.jsp\">View Reviews</a></li>\n");
      out.write("    <li><a href=\"view_drugs.jsp\">View Drugs</a></li>\n");
      out.write("    <li><a href=\"logout.jsp\">Logout User - [");
      out.print( session.getAttribute("username") );
      out.write("]</a></li>\n");
      out.write("    ");
 } else if(userType.equals("doctor")) { 
      out.write("\n");
      out.write("    <li><a href=\"give_reviews.jsp\">Give Review</a></li>\n");
      out.write("    <li><a href=\"Add_Meds.jsp\">Add Medicine</a></li>\n");
      out.write("    <li><a href=\"view_drugs.jsp\">View Drugs</a></li>\n");
      out.write("    <li><a href=\"logout.jsp\">Logout Doctor - [");
      out.print( session.getAttribute("username") );
      out.write("]</a></li>\n");
      out.write("    ");
} else{
      out.write("\n");
      out.write("    <!--<li><a href=\"Add_Meds.jsp\">Add Medicine</a></li>-->\n");
      out.write("    <li><a href=\"view_drugs.jsp\">View Drugs</a></li>\n");
      out.write("    <li><a href=\"view_reviews.jsp\">View Reviews</a></li>\n");
      out.write("    <li><a href=\"logout.jsp\">Logout Pharma - [");
      out.print( session.getAttribute("username") );
      out.write("]</a></li>\n");
      out.write("    ");
}}
      out.write("\n");
      out.write("</ul>");
      out.write("\n");
      out.write("            </div><!--/.nav-collapse -->\n");
      out.write("        </div><!-- /.navbar-inner -->\n");
      out.write("    </div><!-- /.navbar -->\n");
      out.write("\n");
      out.write("</div> <!-- /.container -->\n");
      out.write("\n");
      out.write("\n");
      out.write('\n');

    //checking if flash message is set
    String flash_message = (String) session.getAttribute("flash_message");
    if (flash_message != null) {
        String flash_type = (String) session.getAttribute("flash_type");
        if (flash_type == null) {
            flash_type = "success";
        }
        session.removeAttribute("flash_message");
        session.removeAttribute("flash_type");

      out.write("\n");
      out.write("<div class=\"container\">\n");
      out.write("    <div class=\"alert alert-");
      out.print(flash_type);
      out.write("\">\n");
      out.write("        <button class=\"close\" data-dismiss=\"alert\"></button>\n");
      out.write("        <strong>");
      out.print(flash_type);
      out.write("!</strong> ");
      out.print(flash_message);
      out.write("\n");
      out.write("    </div>\n");
      out.write("</div>\n");

    }

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <script>\n");
      out.write("            function loadData()\n");
      out.write("            {\n");
      out.write("                var data = document.getElementById(\"meds\");\n");
      out.write("                \n");
      out.write("                var XmlHttpObject;\n");
      out.write("                if (window.XMLHttpRequest) {\n");
      out.write("                    XmlHttpObject = new XMLHttpRequest();\n");
      out.write("                }\n");
      out.write("                else if (window.ActiveXObject) {\n");
      out.write("                    XmlHttpObject = new ActiveXObject(\"Microsoft.XMLHTTP\");\n");
      out.write("                }\n");
      out.write("                if(data.options[data.selectedIndex].value>0)\n");
      out.write("                {\n");
      out.write("                    XmlHttpObject.open('get', 'data_medicine.jsp?data=' + data.options[data.selectedIndex].value , true);\n");
      out.write("                    XmlHttpObject.onreadystatechange=function(){\n");
      out.write("                        if (XmlHttpObject.readyState==4 && XmlHttpObject.status==200){\n");
      out.write("                            document.getElementById(\"medicine\").innerHTML=XmlHttpObject.responseText;\n");
      out.write("                        }\n");
      out.write("                    }\n");
      out.write("                    XmlHttpObject.send();\n");
      out.write("                }\n");
      out.write("                else{\n");
      out.write("                    alert(\"Select the Drug Type\");\n");
      out.write("                }\n");
      out.write("            }\n");
      out.write("        </script>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <form class=\"form-signin\" action=\"Add_Review\" method=\"post\">\n");
      out.write("            <h2 class=\"form-signin-heading\">Reviews</h2>\n");
      out.write("            <div id=\"drug\">\n");
      out.write("                <center><br/><br/>Select Drug Category : <select id=\"meds\" name=\"drug\" onchange=\"loadData()\">\n");
      out.write("                        <option value=\"0\"></option>\n");
      out.write("                        ");

                            Statement st = DbConn.connect();
                            String sql = "select * from drugs";
                            ResultSet rs = st.executeQuery(sql);
                                while (rs.next()) {
      out.write("\n");
      out.write("                        <option value=");
      out.print(rs.getInt(1));
      out.write('>');
      out.print( rs.getString(2));
      out.write("</option>\n");
      out.write("                        ");
}
      out.write("\n");
      out.write("                    </select></center>\n");
      out.write("            </div>\n");
      out.write("            <div id=\"medicine\" name=\"medicine\">\n");
      out.write("            </div>\n");
      out.write("            <br/><br/>\n");
      out.write("            <input type=\"text\" class=\"input-block-level validate[required,minSize[3]]\" placeholder=\"Enter Review Here\" name=\"review\" >\n");
      out.write("            <button class=\"btn btn-large btn-primary\" type=\"submit\">Submit</button>\n");
      out.write("        </form>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
      out.write("\n");
      out.write("<hr class=\"featurette-divider\">\n");
      out.write("<footer>\n");
      out.write("    <div class=\"container\">\n");
      out.write("        <div class=\"muted credit\">\n");
      out.write("            <p class=\"pull-right\"><a href=\"#\">Back to top</a></p>\n");
      out.write("            <p>&copy; 2015 Company, Inc. &middot; <a href=\"#\">Privacy</a> &middot; <a href=\"#\">Terms</a></p>\n");
      out.write("        </div>\n");
      out.write("    </div>\n");
      out.write("</footer>\n");
      out.write("</body>\n");
      out.write("</html>");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
