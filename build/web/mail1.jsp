<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
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
        <title>ABEwithVOD</title>
        <!--		<link href="http://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet" type="text/css" />-->
        <link rel="stylesheet" type="text/css" href="style.css" />
    </head>
    <body>
        <div id="wrapper">
            <div id="header">
                <div id="logo1">
                </div>
                <div id="menu">
                    <ul>
                        <p class="first current_page_item"><a href="mail.jsp">Compose Mail</a></p> 
                          <p><a href="UserAcc.jsp">Accounts</a></p>
                        <p><a href="index.jsp">LogOut</a></p>                   
                        
                    </ul>
                    <br class="clearfix" />
                </div>
            </div>
            <div id="inner">
                <div id="splash">
                    <span style="font-size: 22px;">Mail Composing For Key</span>
                     <%if (request.getParameter("msg") != null) {
                                out.println(request.getParameter("msg"));
                            }%>
                          
                          
                  
                        
                    <form method="post" action="Login_Action1">
                        <table width="90%">
                          
                                   
                              
                            <tr style="height: 40px;"><td>To:</td><td><input type="text" name="to" size="50" /></td></tr>
                                
                            <tr style="height: 40px;"><td>Subject:</td><td> <input type="text"  name="subject" size="50"/></td> </tr>
                       
                            <tr style="height: 40px;"><td>Message:</td><td> <input type="text" name="message" size="50" /></td> </tr>
            
                            
                           
                                 
                                <tr><td></td><td><input type="submit" value="Send"/></td></tr>
                                   
                                   
                                    
                                    
                        </table>
                    </form>
                                  
                                  

                </div>

            </div>

        </div>

    </body>
</html>