package com.mining;

import com.db.DbConn;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Statement;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Mining extends HttpServlet {

    static int cntc;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        try {

            Statement st1 = DbConn.connect();
            st1.executeUpdate("delete from train_data");

            int stopcount = 0;
            String[] stopwordsList = new String[10000];
            int poscount = 0;
            String[] poswordsList = new String[10000];
            int negcount = 0;
            String[] negwordsList = new String[10000];
            int symcount = 0;
            String[] symwordsList = new String[10000];
            String[] extras = {"ing"};
            int posStemCount = 0;
            String[] stemPosWordsList = new String[10000];
            int negStemCount = 0;
            String[] stemNegWordsList = new String[10000];
            HashMap weigthPos = new HashMap();
            HashMap weigthNeg = new HashMap();
            HashMap weigthDataPos = new HashMap();
            HashMap weigthDataNeg = new HashMap();
            String basepath = request.getRealPath("/") + "files";

//          Calculate the symbols
            String symwordsPath = basepath + "\\symbols.txt";
            File symFile = new File(symwordsPath);
            BufferedReader brsymFile = new BufferedReader(new FileReader(symFile));
            String lineSymVal;
            while ((lineSymVal = brsymFile.readLine()) != null) {
                symwordsList[symcount] = lineSymVal;
                symcount++;
            }
            brsymFile.close();

//          Calculate the stopwords
            String stopwordsPath = basepath + "\\stopwards.txt";
            File stopFile = new File(stopwordsPath);
            BufferedReader brstopFile = new BufferedReader(new FileReader(stopFile));
            String lineStopVal;
            while ((lineStopVal = brstopFile.readLine()) != null) {
                stopwordsList[stopcount] = lineStopVal;
                stopcount++;
            }
            brstopFile.close();




//          Load positive file & calculate weigths of keywords.
            String posFilePath = basepath + "\\positive.txt";
            File posFile = new File(posFilePath);
            BufferedReader brposFile = new BufferedReader(new FileReader(posFile));
            String lineposVal;
            while ((lineposVal = brposFile.readLine()) != null) {
                String[] data = lineposVal.split(" ");
                for (int h = 0; h < data.length; h++) {
                    int flag = 1;
                    for (int lk = 0; lk < stopcount; lk++) {
                        if (data[h].equalsIgnoreCase(stopwordsList[lk])) {
                            flag = 0;
                            break;
                        }
                    }
                    if (flag != 0) {
                        int edflag = 0;
                        for (int d = 0; d < symcount; d++) {
                            data[h] = data[h].replace(symwordsList[d], "");
                            for (int g = 0; g < extras.length; g++) {
                                if (data[h].endsWith(extras[g])) {
                                    data[h] = data[h].replace(extras[g], "");
                                    edflag = 1;
                                    break;
                                }
                            }
                            if (edflag == 1) {
                                break;
                            }
                        }
                        poswordsList[poscount] = data[h].replaceAll("[0-9]", "");
                        poscount++;
                    }
                }
            }
            brposFile.close();

//          logic to stem and restore
            for (int g = 0; g < poscount; g++) {
                Stemmer stemmer = new Stemmer();
                stemPosWordsList[posStemCount] = stemmer.stripAffixes(poswordsList[g]).toLowerCase().replaceAll("'", "");
                if (stemPosWordsList[posStemCount].length() > 0) {
//                    out.println(stemPosWordsList[posStemCount]+"<br/>");
                    weigthPos.put(stemPosWordsList[posStemCount], posStemCount);
                    posStemCount++;
                }
            }
//            out.println("Pos. stem no : "+posStemCount+"<br/>");





//          Load Negative file & calculate weigths of keywords.
            String negFilePath = basepath + "\\negative.txt";
            File negFile = new File(negFilePath);
            BufferedReader brnegFile = new BufferedReader(new FileReader(negFile));
            String linenegVal;
            while ((linenegVal = brnegFile.readLine()) != null) {
                String[] data = linenegVal.split(" ");
                for (int h = 0; h < data.length; h++) {
                    int flag = 1;
                    for (int lk = 0; lk < stopcount; lk++) {
                        if (data[h].equalsIgnoreCase(stopwordsList[lk])) {
                            flag = 0;
                            break;
                        }
                    }
                    if (flag != 0) {
                        int edflag = 0;
                        for (int d = 0; d < symcount; d++) {
                            data[h] = data[h].replace(symwordsList[d], "");
                            for (int g = 0; g < extras.length; g++) {
                                if (data[h].endsWith(extras[g])) {
                                    data[h] = data[h].replace(extras[g], "");
                                    edflag = 1;
                                    break;
                                }
                            }
                            if (edflag == 1) {
                                break;
                            }
                        }
                        negwordsList[negcount] = data[h].replaceAll("[0-9]", "");
                        negcount++;
                    }
                }
            }
            brnegFile.close();

//          Logic to stem and restore
            for (int g = 0; g < negcount; g++) {
                Stemmer stemmer = new Stemmer();
                stemNegWordsList[negStemCount] = stemmer.stripAffixes(negwordsList[g]).toLowerCase().replaceAll("'", "");
                if (stemNegWordsList[negStemCount].length() > 0) {
//                    out.println(stemNegWordsList[negStemCount]+"<br/>");
                    weigthNeg.put(stemNegWordsList[negStemCount], negStemCount);
                    negStemCount++;
                }
            }
//            out.println("Neg. stem no : "+negStemCount+"<br/>");

























//          Logic to calculate occurance of the Words from the LinkList
//            out.print("<br/><br/>");
            Set set = weigthPos.entrySet();
            Iterator i = set.iterator();
            while (i.hasNext()) {
                Map.Entry me = (Map.Entry) i.next();
                cntc = 0;
                for (int re = 0; re < posStemCount; re++) {
                    if (me.getKey().equals(stemPosWordsList[re])) {
                        cntc++;
                    }
                }
                weigthDataPos.put(me.getKey(), cntc);
            }

//          Calculate weights of positive data retrieved from the text file
            set = weigthDataPos.entrySet();
            i = set.iterator();
            while (i.hasNext()) {
                Map.Entry me = (Map.Entry) i.next();
                double wt = Integer.parseInt(me.getValue().toString()) * 1.0 / posStemCount;
//                out.print(me.getKey()+" : "+ Integer.parseInt(me.getValue().toString()) +" weigth : "+ wt +"<br/>");
                Statement st = DbConn.connect();
                st.executeUpdate("insert into train_data values (null,'positive','" + me.getKey() + "','" + me.getValue() + "','" + posStemCount + "','" + wt + "')");
                st.close();
            }




//          Logic to calculate occurance of the Words from the LinkList
//            out.print("<br/><br/>");
            set = weigthNeg.entrySet();
            i = set.iterator();
            while (i.hasNext()) {
                Map.Entry me = (Map.Entry) i.next();
                cntc = 0;
                for (int re = 0; re < negStemCount; re++) {
                    if (me.getKey().equals(stemNegWordsList[re])) {
                        cntc++;
                    }
                }
                weigthDataNeg.put(me.getKey(), cntc);
            }

//          Calculate weights of positive data retrieved from the text file
            set = weigthDataNeg.entrySet();
            i = set.iterator();
            while (i.hasNext()) {
                Map.Entry me = (Map.Entry) i.next();
                double wt = Integer.parseInt(me.getValue().toString()) * 1.0 / negStemCount;
//                out.print(me.getKey()+" : "+ Integer.parseInt(me.getValue().toString()) +" weigth : "+ wt +"<br/>");
                Statement st = DbConn.connect();
                st.executeUpdate("insert into train_data values (null,'negative','" + me.getKey() + "','" + me.getValue() + "','" + negStemCount + "','" + wt + "')");
                st.close();
            }
            session.setAttribute("flash_message", " Data Train successfully !!!");
            session.setAttribute("flash_type", "success");
            response.sendRedirect("index.jsp");
        } catch (Exception e) {
            session.setAttribute("flash_message", "failed. try again");
            session.setAttribute("flash_type", "fail");
            response.sendRedirect("index.jsp");
            System.out.println("Ex : " + e.toString());
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