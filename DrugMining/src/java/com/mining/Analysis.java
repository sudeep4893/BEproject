package com.mining;

import com.db.DbConn;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Analysis extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            Statement st = DbConn.connect();
            ResultSet rs = st.executeQuery("select review from reviews");
            
            int datano=1;
            
            int stopcount=0;
            String[] stopwordsList = new String[10000];
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
            
            
            while(rs.next())
            {
                String rev = rs.getString(1);
                String data[] = rev.split(" ");
                
                String dataRev[] = new String[500];
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
                
                out.println("data of "+datano+"is : <br/>");
                double poscnt=0;
                double negcnt=0;
                for(int e = 0;e<revl;e++)
                {
                    Stemmer stemmer = new Stemmer();
                    dataRev[e] = stemmer.stripAffixes(dataRev[e]);
                    out.print("->"+dataRev[e]);
                    Statement stpos = DbConn.connect();
                    ResultSet rspos = stpos.executeQuery("select key_weight from train_data where class = 'positive' and keyword = '"+dataRev[e]+"'");
                    if(rspos.next())
                    {
                        out.print(" pos -"+rspos.getDouble(1)+" ");
                        poscnt = poscnt+rspos.getDouble(1);
                    }
                    Statement ngpos = DbConn.connect();
                    ResultSet rsneg = ngpos.executeQuery("select key_weight from train_data where class = 'negative' and keyword = '"+dataRev[e]+"'");
                    if(rsneg.next())
                    {
                        out.print(" neg -"+rsneg.getDouble(1)+" ");
                        negcnt = negcnt+rsneg.getDouble(1);
                    }
                }
                out.println("<br/>Total Pos : "+poscnt);
                out.println("<br/>Total Neg : "+negcnt);
                
                if(poscnt > negcnt){
                    out.print("<br/><b>This post is positive </b><br/>");
                }
                else{
                    out.print("<br/><b>This post is Negitive </b><br/>");
                }
                
                datano++;
                out.print("<br/>");
            }
            
        } catch(Exception e) {
            System.out.println(e.toString());
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}