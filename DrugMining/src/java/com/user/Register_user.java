package com.user;

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

public class Register_user extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            HttpSession session = request.getSession();
            String name = request.getParameter("fullname");
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String address = request.getParameter("address");
            String email = request.getParameter("email");
            String contact = request.getParameter("contact");
            
            //db
            Statement con = DbConn.connect();
            Statement connect = DbConn.connect();
            
            ResultSet rs = con.executeQuery("Select count(*) from users where username = '"+username+"'");
            rs.next();
            System.out.println("User : "+rs.getInt(1));
            if(rs.getInt(1)==0)
            {
                connect.executeUpdate("Insert into users (id,fullname,username,password,address,email,contact_no,user_type) values(null,'"+name+"','"+username+"','"+password+"','"+address+"','"+email+"','"+contact+"','user')");
                session.setAttribute("flash_message", "Registered successfully !!!");
                session.setAttribute("flash_type", "success");
                response.sendRedirect("login.jsp");
            }
            else
            {
                session.setAttribute("flash_message", "User ID Is Already Alloted");
                session.setAttribute("flash_type", "Fail");
                response.sendRedirect("register.jsp");
            }
        } catch(Exception e) {            
            System.out.println("Ex : "+e.toString());
        }
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
