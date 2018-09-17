package com.user;

import com.db.DbConn;
import com.mining.Stemmer;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Add_Review extends HttpServlet {

    String BasePath = "";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        try {
            String drugid = request.getParameter("drug");
            String med = request.getParameter("medicine");
            String review = request.getParameter("review");
            String type = session.getAttribute("UserType").toString();
            String nm = session.getAttribute("username").toString();

            BasePath = request.getRealPath("/") + "files";

            String result = is_Positive(review);
            String sql = "insert into reviews values(null,'" + drugid + "','" + med + "','" + review + "','" + type + "','" + nm + "','" + result + "')";
            Statement st = DbConn.connect();
            st.executeUpdate(sql);
            session.setAttribute("flash_message", " Review Insert successfully !!!");
            session.setAttribute("flash_type", "success");
            response.sendRedirect("give_reviews.jsp");

        } catch (Exception e) {
            session.setAttribute("flash_message", "failed. try again");
            session.setAttribute("flash_type", "fail");
            response.sendRedirect("index.jsp");
            System.out.println("WEx : " + e.toString());
        }
    }

    private String is_Positive(String review) {
        String result = "abc";
        try {
            int stopcount = 0;
            String[] stopwordsList = new String[10000];

            //          Calculate the stopwords
            File stopFile = new File(BasePath + "\\stopwards.txt");
            System.out.println("base path : " + BasePath);
            BufferedReader brstopFile = new BufferedReader(new FileReader(stopFile));
            String lineStopVal;
            while ((lineStopVal = brstopFile.readLine()) != null) {
                stopwordsList[stopcount] = lineStopVal;
                stopcount++;
            }
            brstopFile.close();

            String rev = review;
            String data[] = rev.split(" ");

            String dataRev[] = new String[500];
            int revl = 0;

            for (int h = 0; h < data.length; h++) {
                int flag = 1;
                for (int lk = 0; lk < stopcount; lk++) {
                    if (data[h].equalsIgnoreCase(stopwordsList[lk])) {
                        flag = 0;
                        break;
                    }
                }
                if (flag != 0) {
                    dataRev[revl] = data[h];
                    revl++;
                }
            }
            double poscnt = 0;
            double negcnt = 0;
            for (int e = 0; e < revl; e++) {
                Stemmer stemmer = new Stemmer();
                dataRev[e] = stemmer.stripAffixes(dataRev[e]);
                Statement stpos = DbConn.connect();
                ResultSet rspos = stpos.executeQuery("select key_weight from train_data where class = 'positive' and keyword = '" + dataRev[e] + "'");

                if (rspos.next()) {
                    poscnt = poscnt + rspos.getDouble(1);
                }
                Statement ngpos = DbConn.connect();
                ResultSet rsneg = ngpos.executeQuery("select key_weight from train_data where class = 'negative' and keyword = '" + dataRev[e] + "'");

                if (rsneg.next()) {
                    negcnt = negcnt + rsneg.getDouble(1);
                }
            }
            if (poscnt > negcnt) {
                //Load positive file & write data.
                String posFilePath = BasePath + "\\positive.txt";
                posFilePath = posFilePath.replace("\\build", "");
                FileWriter fw = new FileWriter(posFilePath, true); //the true will append the new data
                fw.append("\n" + review);//appends the string to the file
                fw.close();
                result = "This post is positive and its weigth is  " + poscnt;
                return result;
            } else {
                //Load negative file & write data.
                String posFilePath = BasePath + "\\negative.txt";
                posFilePath = posFilePath.replace("\\build", "");
                FileWriter fw = new FileWriter(posFilePath, true); //the true will append the new data
                fw.append("\n" + review);//appends the string to the file
                fw.close();
                result = "This post is Negitive and its weigth is : " + negcnt;
                return result;
            }
        } catch (Exception e) {
            System.out.println("ex : " + e.toString());
        }
        return result;
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
