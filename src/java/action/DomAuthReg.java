/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.action;

import com.util.DbConnector;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Sabari
 */
public class DomAuthReg extends HttpServlet {

    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
         PreparedStatement pst = null;
        Connection conn = null;
        try{
            conn=(Connection) DbConnector.getConnection();
            String name= request.getParameter("_name").trim();
            String password= request.getParameter("_password").trim();
            String age =request.getParameter("_age").trim();
            String emailid= request.getParameter("_emailid").trim();
            String phone= request.getParameter("_phone").trim();
            String sex= request.getParameter("add");
            String role= request.getParameter("role");
            if( name != null && name!="" && password != null && password!=""  && age != null && age!="" && emailid != null && emailid!="" && phone!="" && phone != null && sex!="" && sex != null){                
            String sql="insert into user values('"+name+"','"+password+"','"+sex+"','"+age+"','"+emailid+"',now(),'"+phone+"','domain')";           
                System.out.println(">>"+sql); 
            pst = (PreparedStatement) conn.prepareStatement(sql);
             int a=pst.executeUpdate();
           if(a >0){
              response.sendRedirect("domAuthReg.jsp?msg=Registration Done");
            } else {
                response.sendRedirect("domAuthReg.jsp?msg=UserId Already Exit");
            }             
            }else{
             response.sendRedirect("domAuthReg.jsp?msg=Fill All The Fileds"); 
            } }catch(Exception e){
            response.sendRedirect("domAuthReg.jsp?msg=UserId Already Exit");
            e.printStackTrace();
            
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
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
     * Handles the HTTP <code>POST</code> method.
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
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
