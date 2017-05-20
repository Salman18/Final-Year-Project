/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.action;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;
import java.awt.Component;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;
import java.util.StringTokenizer;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.sql.*;

/**
 *
 * @author jp
 */
public class Login_Action extends HttpServlet {

    private Component aComponent;
    private static String emailMsgTxt = "";
    private static String emailSubjectTxt = "";
    private static String emailFromAddress = "";

    private static String[] emailList = new String[10];
    private static final String SMTP_HOST_NAME = "smtp.gmail.com";
    private static final String SMTP_AUTH_USER = "testjpinfotech@gmail.com";
    private static final String SMTP_AUTH_PWD = "TESTJPINFO";

    private static class SMTPAuthenticator extends Authenticator {

        @Override
        public PasswordAuthentication getPasswordAuthentication() {
            String username = SMTP_AUTH_USER;
            String password = SMTP_AUTH_PWD;
            return new PasswordAuthentication(username, password);
        }
    }

    public void postMail(String recipients[], String subject, String message, String from) throws MessagingException {
        boolean debug = false;
        //Set the host smtp address                                                                                               
        Properties props = new Properties();
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", SMTP_HOST_NAME);
        props.put("mail.smtp.auth", "true");

        Authenticator auth = new SMTPAuthenticator();
        Session session = Session.getDefaultInstance(props, auth);

        session.setDebug(debug);

        // create a message                                                                                                            
        Message msg = new MimeMessage(session);

        // set the from and to address                                                                                            
        InternetAddress addressFrom = new InternetAddress(from);
        msg.setFrom(addressFrom);

        InternetAddress[] addressTo = new InternetAddress[recipients.length];
        for (int i = 0; i < recipients.length; i++) {
            addressTo[i] = new InternetAddress(recipients[i]);
        }
        msg.setRecipients(Message.RecipientType.TO, addressTo);
        // Setting the Subject and Content Type                                                                            
        msg.setSubject(subject);
        msg.setContent(message, "text/plain");
        Transport.send(msg);
    }

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
        PrintWriter out = response.getWriter();
        try {
            String to = request.getParameter("to");
            String sub = request.getParameter("subject");
            String msg = request.getParameter("message");

            emailMsgTxt = msg;
            emailSubjectTxt = sub;
            emailFromAddress = Login_Action.SMTP_AUTH_USER;
            // Add List of Email address to who email needs to be sent to
            StringBuilder sb = new StringBuilder(to);
            StringTokenizer st = new StringTokenizer(to);
            int i = 0;
            while (st.hasMoreTokens()) {
                emailList[i] = st.nextToken(",");
                System.err.println(emailList[i]);
                i++;
            }
            String emailReceipeint[] = new String[i];
            for (int j = 0; j < i; j++) {
                emailReceipeint[j] = emailList[j];
                System.out.println("Actually emails are " + j);
            }

            Login_Action smtpMailSender = new Login_Action();
            try {
                smtpMailSender.postMail(emailReceipeint, emailSubjectTxt, emailMsgTxt, emailFromAddress);
            } catch (MessagingException ex) {
                //Logger.getLogger(Home.class.getName()).log(Level.SEVERE, null, ex);
            }
            System.out.println("Sucessfully Sent mail to All Users");
            response.sendRedirect("mail.jsp?msg=mail sent successfully...!");

        } finally {
            out.close();
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
