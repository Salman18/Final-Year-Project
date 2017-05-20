<%@page import="java.sql.Statement"%>
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
                        <p class="first current_page_item"><a href="#">Welcome Consumer! </a></p>     
                        <p class="first current_page_item"><a href="keyrequest.jsp">key Request</a></p>
                        <p><a href="index.jsp">LogOut</a></p>
                    </ul>
                    <br class="clearfix" />
                </div>
            </div>
            <div id="inner">
                <div id="splash">
                    <span style="font-size: 22px;">Data Consumer</span>
                    <table  style=" margin-left: 110px;width:70%;position:absolute;">
                        <tr align="center" style="background-color: white;border-radius: 3px;color:green;font-family:verdana;font-size:12px;font-weight: bold">
                            <td height="36">Uploaded By</td>
                            <td height="36">Filename</td>
                            <td height="36">Uploaded on</td>
                            <td height="36">Decrypt & Download</td>
                        </tr>
                        <%
                            String user = null, filename = null, pass = null, key = null, place = null, mob = null, sta = null, blood = null, dis = null, zip = null;
                            Connection con = null;
                            String names = request.getParameter("group");
                            session.setAttribute("gid", names);
                            System.out.println("get Group is " + names);
                            try {
                                con = DbConnector.getConnection();
                                Statement st = con.createStatement();
                                String query1 = "select * from upload where status =  'Yes' ";//+"'";//'"+session.getAttribute("uID").toString() +"'";// "+" AND email = '"+mail+"' ";
                                ResultSet rs = st.executeQuery(query1);
                                //  System.out.println("hello");
                                while (rs.next()) {
                                    //  System.out.println("java");

                                    user = rs.getString("userid");
                                    filename = rs.getString("filename");
                                    key = rs.getString("key_");
                                    blood = rs.getString("date_");
                        %>
                        <tr align="center" style="font-family:verdana;font-size:14px;"> 
                            <td style="color: green" height="36"> <font><%=user%></font> </td>
                            <td style="color: green"> <font><%=filename%></font> </td>
                            <td style="color: green"> <font><%=blood%></font> </td>
                            <td> <font color="#FF0000"><a href="content.jsp?<%=filename%>">DeCrypt</a></font> </td>
                        </tr>
                        <tr>&nbsp;</tr>
                        <%
                                }
                            } catch (Exception e) {
                                e.printStackTrace();
                            }
                        %>
                    </table>
                                
                              
                                  
                                  

                </div>

            </div>

        </div>

    </body>
</html>