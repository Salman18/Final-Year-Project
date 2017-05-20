<%@page import="com.util.DbConnector"%>
<%@page import="com.util.TrippleDes"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%
//    Connection conn = null;
//    Statement smt = null;
//    ResultSet rs = null;
    String []array = request.getQueryString().split(",");
    String msg= array[0];
    String fileName=array[1];
//    String receiver=array[2];
//    String fileName=array[3];
//    String user=array[4];
//    String role=array[5];
//    String partialKey = null;
//    try{
//        conn = DbConnector.getConnection(); 
//        smt = conn.createStatement();
//        rs = smt.executeQuery("select publickey from keysdetails where key_owner ='"+receiver+"' and requester ='"+sender+"'");
//        while(rs.next()){
//            partialKey = rs.getString("key_");
//            System.out.println("partial encr key is "+ partialKey);
//        }
//    }catch(Exception ex){
//        ex.printStackTrace();
//    }
    try{
        Connection con = DbConnector.getConnection();
        Statement smt1 = con.createStatement();
        int i = smt1.executeUpdate("update upload set data_ ='"+new TrippleDes().decrypt(msg)+"', status = 'YES' where filename ='"+fileName+"'and status ='NO'");
        if(i!=0){
          response.sendRedirect("partialdecrypt.jsp?'success'");
        }else{
          response.sendRedirect("partialdecrypt.jsp?'failed'");
        }
    }catch(Exception ex){
        ex.printStackTrace();
    }
%>