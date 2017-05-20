/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.action;

import com.util.DbConnector;
import com.util.TrippleDes;
import com.util.Utilities;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Sabari
 */
public class UploadData extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        Connection con = null;
        PreparedStatement pstm = null;
        
        
        try {
            String key = request.getParameter("secret");
            System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
            String encryption1 = new TrippleDes(key).encrypt(request.getParameter("block1"));
            String encryption2 = new TrippleDes().encrypt(encryption1);
            
            con = DbConnector.getConnection();
            String sql = "insert into upload(userid,data_,key_,date_,filename) values"
                    + "('" + request.getSession().getAttribute("userid") + "','" + encryption2
                    + "','" + key + "',now(),'" + request.getParameter("fileName") + "')";
            System.out.println("..." + sql);
            pstm = con.prepareStatement(sql);
            pstm.executeUpdate();
            response.sendRedirect("dataOwnerHome.jsp?msg=File Uploaded.....");
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
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
     * Handles the HTTP <code>POST</code> method.
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
