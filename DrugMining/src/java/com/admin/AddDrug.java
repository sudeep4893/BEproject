package com.admin;

import com.db.DbConn;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AddDrug extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        int flag=0;
        try {
            String drug = request.getParameter("drug");
            String desc = request.getParameter("desc");
            HttpSession session = request.getSession();
            
            Statement con = DbConn.connect();
            Statement connect = DbConn.connect();
            
            ResultSet rs = con.executeQuery("Select drug_name from drugs");
            while(rs.next())
            {
                if(rs.getString(1).equalsIgnoreCase(drug))
                {
                    flag = 1;
                    break;
                }
            }
            System.out.println("Flag : "+flag);
            if(flag==0)
            {
                connect.executeUpdate("Insert into drugs values (null,'"+drug+"','"+desc+"')");
                session.setAttribute("flash_message", "Drug Details Added successfully !!!");
                session.setAttribute("flash_type", "Success");
                response.sendRedirect("view_drugs.jsp");
            }
            else
            {
                session.setAttribute("flash_message", "This Drug is already Present");
                session.setAttribute("flash_type", "Fail");
                response.sendRedirect("add_Drug.jsp");
            }
        } catch(Exception e) {            
            System.out.println("Err. "+e.toString());
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
