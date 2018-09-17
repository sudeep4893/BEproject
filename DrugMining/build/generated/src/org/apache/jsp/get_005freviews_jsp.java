package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import com.mining.Stemmer;
import java.io.FileReader;
import java.io.BufferedReader;
import java.io.File;
import com.db.DbConn;
import java.sql.ResultSet;
import java.sql.Statement;

public final class get_005freviews_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

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
      response.setContentType("text/html");
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
      out.write("\n");
      out.write("\n");
      out.write("\n");

        Statement std = null;
        ResultSet rsd = null;
        Statement st1 = null;
        ResultSet rs1 = null;
        try {
            std = DbConn.connect();
            st1 = DbConn.connect();
            String sqld = "select distinct(user_type) from reviews where med_id = '"+request.getParameter("data") +"'";
            rsd = std.executeQuery(sqld);
            double overallpos = 0.0;
            double overallneg = 0.0;
            int recpos = 0;
            int recneg =0;
            while(rsd.next())
            {
      out.write("\n");
      out.write("            <h3> ");
      out.print( rsd.getString(1) );
      out.write("'s Review </h3>\n");
      out.write("                <table class=\"table table-hover table-striped\">\n");
      out.write("                    <thead>\n");
      out.write("                        <tr>\n");
      out.write("                            <th>Drug Type</th>\n");
      out.write("                            <th>Medicine Name</th>\n");
      out.write("                            <th>Review</th>\n");
      out.write("                            <th>User Name</th>\n");
      out.write("                            <th>Review Type</th>\n");
      out.write("                        </tr>\n");
      out.write("                    </thead>\n");
      out.write("                ");
sqld = "select * from reviews where user_type='"+rsd.getString(1) +"'";
                rs1 = st1.executeQuery(sqld);
                while(rs1.next())
                {
      out.write("\n");
      out.write("                <tbody>\n");
      out.write("                    <tr>\n");
      out.write("                            <td>\n");
      out.write("                                ");

                                String s = rs1.getString(2);
                                String sqlx = "select drug_name from drugs where id = '"+s+"'";
                                Statement stx = DbConn.connect();
                                ResultSet rsx = stx.executeQuery(sqlx);
                                rsx.next();
                                out.print(rsx.getString(1));
                                
      out.write("\n");
      out.write("                            </td>\n");
      out.write("                            <td>\n");
      out.write("                                ");

                                s = rs1.getString(3);
                                sqlx = "select med_name from medicines where id = '"+s+"'";
                                stx = DbConn.connect();
                                rsx = stx.executeQuery(sqlx);
                                rsx.next();
                                out.print(rsx.getString(1));
                                
      out.write("\n");
      out.write("                            </td>\n");
      out.write("                            <td>\n");
      out.write("                                ");
      out.print( rs1.getString(4) );
      out.write("\n");
      out.write("                            </td>\n");
      out.write("                            <td>\n");
      out.write("                                ");
      out.print( rs1.getString(6) );
      out.write("\n");
      out.write("                            </td>\n");
      out.write("                            <td>\n");
      out.write("                                ");

                                try {
            
            int stopcount=0;
            String[] stopwordsList = new String[1000];
//          Calculate the stopwords
            String stopwordsPath = request.getRealPath("/")+"files"+"\\stopwards.txt";
            File stopFile = new File(stopwordsPath);
            BufferedReader brstopFile = new BufferedReader(new FileReader(stopFile));
            String lineStopVal;
            while ((lineStopVal = brstopFile.readLine()) != null) {
                stopwordsList[stopcount]=lineStopVal;
                stopcount++;
            }
            brstopFile.close();

                String rev =rs1.getString(4);
                String data[] = rev.split(" ");
                
                String dataRev[] = new String[50];
                int revl = 0;
                
                for(int h=0;h<data.length;h++)
                {
                    int flag=1;
                    for(int lk=0;lk<stopcount;lk++)
                    {
                        if(data[h].equalsIgnoreCase(stopwordsList[lk]))
                        {
                            flag=0;
                            break;
                        }
                    }
                    if(flag!=0)
                    {
                        dataRev[revl] = data[h];
                        revl++;
                    }
                }
                double poscnt=0;
                double negcnt=0;
                for(int e = 0;e<revl;e++)
                {
                    Stemmer stemmer = new Stemmer();
                    dataRev[e] = stemmer.stripAffixes(dataRev[e]);
                    Statement stpos = DbConn.connect();
                    ResultSet rspos = stpos.executeQuery("select key_weight from train_data where class = 'positive' and keyword = '"+dataRev[e]+"'");
                    if(rspos.next())
                    {
                        poscnt = poscnt+rspos.getDouble(1);
                        overallpos = overallpos+poscnt;
                    }
                    Statement ngpos = DbConn.connect();
                    ResultSet rsneg = ngpos.executeQuery("select key_weight from train_data where class = 'negative' and keyword = '"+dataRev[e]+"'");
                    if(rsneg.next())
                    {
                        negcnt = negcnt+rsneg.getDouble(1);
                        overallneg = overallneg + negcnt;
                    }
                }
            
            if(poscnt > negcnt){
                    out.print("This post is positive and it's weigth is : "+poscnt);
                    recpos++;
                }
                else{
                    out.print("This post is Negitive and it's weigth is : "+negcnt);
                    recneg++;
                }
 }
 catch(Exception e)
{
     System.out.println("ex : "+e.toString());
}

      out.write("\n");
      out.write("                            </td>\n");
      out.write("                    </tr>\n");
      out.write("                    </tbody>\n");
      out.write("                ");
}
      out.write("\n");
      out.write("              </table>\n");
      out.write("            ");
}
            System.out.println("ovea ll pos"+overallpos);
            System.out.println("ovea ll neg"+overallneg);
            if(overallpos > overallneg){
                out.print("<center><br/><b> We Recommend you to use this drug, based on the reviews provided by the user </b><br/>Total Positive reviews : <b>"+recpos+"</b> & Negative Reveiws : <b>"+recneg+"</b></center>");
            }
            else if(overallpos < overallneg){
                out.print("<center><br/><b>This Drug has a lot of bad reviews, we recommend you please do not use it. <b><br/>Positive reviews : <b>"+recpos+"</b> & Negative Reveiws : <b>"+recneg+"</b></center>");
            }
            else{
            }
        }catch(Exception e){
            System.out.println("Ex : "+e.toString());
        }
        
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
