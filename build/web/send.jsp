<%@page import="pack.EmailFinder"%>
<%@page import="pack.mail_Send"%>
<%@page import="com.util.DbConnector"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
    
    
   String get = request.getQueryString();
   String[] full = get.split(",");
   String user = full[0];
   String file = full[1];
   
   EmailFinder e = new EmailFinder();
    String mail = e.getEmailId(user);
    System.out.println("mail:"+mail);
    String key1 = null;
    String filename = null;
    String key = null;
    Connection con = DbConnector.getConnection();
    Statement st1 = con.createStatement();
    Statement st = con.createStatement();
    st.execute("delete from request where user= '"+user+"' and filename='"+file+"'");
    
    ResultSet rs1 = st1.executeQuery("select * from upload where filename='" + file + "'");
    
    while(rs1.next()){
        key1 = rs1.getString("key_");
        filename = rs1.getString("filename");
        System.out.println("filename is:"+filename);
        
        key =  "File name:-"+filename+"\n\n\n cipher key:::: \n"+key1;
        
        System.out.println(key1);
        System.out.println(" Key is :" + key);
    }
        mail_Send m = new mail_Send();
        boolean b = m.sendMail(key, user, mail);
        
        if(b){
            
            response.sendRedirect("viewreq.jsp?key_send_sucess..!");
        }else{
            response.sendRedirect("viewreq.jsp?key_send_failed..!");
        }
        
    
  
//        System.out.println("Error found to sending mail..!");
//        response.sendRedirect("adminpage.jsp?mailf=public key send fails..!");
  



%>