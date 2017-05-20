<%@page import="java.sql.Statement"%>
<%@page import="com.util.TrippleDes"%>
<%@page import="com.util.Utilities"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.util.DbConnector"%>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="content-type" content="text/html; charset=utf-8" />
        <meta name="description" content="" />
        <meta name="keywords" content="" />
        <title>HIDDEN CIPHERTEXT POLICY ATTRIBUTE-BASED ENCRYPTION UNDER STANDARD ASSUMPTIONS</title>
        <!--		<link href="http://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet" type="text/css" />-->
        <link rel="stylesheet" type="text/css" href="style.css" />
    </head>
    <body>
        <div id="wrapper">
            <div id="header">
                <div id="logo">
                    <h3>HIDDEN CIPHERTEXT POLICY ATTRIBUTE-BASED ENCRYPTION UNDER STANDARD ASSUMPTIONS</h3>
                </div>
                <div id="menu">
                    <ul>
                        <p class="first current_page_item"><a href="consumerHome.jsp">Back</a></p>                       
                        <p><a href="index.jsp">LogOut</a></p>
                    </ul>
                    <br class="clearfix" />
                </div>
            </div>
            <div id="inner">
                <div id="splash">
                    <span style="font-size: 22px;"></span>
                    <%if (request.getParameter("msg") != null) {
                            out.println(request.getParameter("msg"));
                        }%>
                    <%
  //HttpSession user=request.getSession();
  //String uname=user.getAttribute("username").toString();   
  //String name=user.getAttribute("name").toString();  
      String encrKey =request.getParameter("secKey");
      String filename = request.getParameter("fid");
      
      Connection con=DbConnector.getConnection();
      Statement st=con.createStatement();
      System.out.println("file name is @@@@@:::-"+filename);
      
      ResultSet rs = st.executeQuery("select * from upload where filename='"+filename+"' and key_='"+encrKey+"' ");
      
      if(rs.next())
   {
      String contents = new TrippleDes(encrKey).decrypt(request.getParameter("scontent"));
      System.out.println("encrKey" + encrKey);
      System.out.println("contents" + contents);
  //    
      String fname =null;
      String firstKey = null;
    
                    %>
                    <form id="f1" method="post" action="save.jsp">
                        <input type="hidden" name="savedinK" id="savedinK" value="<%=firstKey%>"/><br/>
                        <h1>File Name: <font style="color: tomato"> <%=filename%></font></h1><br/><br/>
                        <input type="hidden" name="fid" value="<%=filename%>"/><br/>
                        <textarea name="scontent" style="margin-top: -70px;width: 400px;height: 200px;position: relative;left: 250px;"><%=contents%></textarea><br>
                            <input style="margin-left: 420px" type="submit" value="Download" id="but"/>
                    </form>
                        <%
   }
      else
      {
         %>
<script type="text/javascript" language="javascript">
    
    alert("enter correct Decrypted key");
    window.location = "content.jsp?<%=filename%>";
    
</script>
		
		<%
      }
      %>
    
                </div>
            </div>
        </div>
    </body>
</html>