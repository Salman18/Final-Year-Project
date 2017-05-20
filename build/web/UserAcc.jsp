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
                                             
                      <p class="first current_page_item"><a href="domAuthHome.jsp">Back </a></p>                 
                       
                        
                    </ul>
                    <br class="clearfix" />
                </div>
            </div>
            <div id="inner">
                <div id="splash">
                    <span style="font-size: 22px;">User Revocation</span>
                  <%if (request.getParameter("msg") != null) {
                                out.println(request.getParameter("msg"));
                            }
                  if (request.getParameter("msg1") != null) {
                                out.println(request.getParameter("msg1"));
                            }
%>
                        
                    <form method="post" action="Acc_Delete">
                        <table width="90%">
                          
                                   
                              
                            <tr style="height: 40px;"><td>User Id:</td><td><input type="text" name="id" size="50"/></td></tr>
                                
                              
                                <tr><td></td><td><input type="submit" value="Delete Account"/></td></tr>
                                   
                                   
                                    
                                    
                        </table>
                    </form>
                                  
                                  

                </div>

            </div>

        </div>

    </body>
</html>