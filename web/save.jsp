<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.io.OutputStream"%>
<%
    String filenm = request.getParameter("fid");
    System.out.println("filenm"+filenm);
    try {
        String data = request.getParameter("scontent");
        byte a[] = data.getBytes();
        response.setContentType("text/plain");
        response.setHeader("Content-Disposition", "attachment; filename=\"" + filenm + "\"");
        OutputStream os = response.getOutputStream();
        os.write(a);
        os.close();
        a = null;
        if (a == null) {
        }
       
    } catch (Exception ex) {
        ex.printStackTrace();
    }
%>