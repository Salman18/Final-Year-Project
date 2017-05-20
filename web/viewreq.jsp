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
                        <p class="first current_page_item"><a href="domAuthHome.jsp">Domain Home</a></p>     
                        <p class="first current_page_item"><a href="viewreq.jsp">key Request</a></p>
                        <p><a href="index.jsp">LogOut</a></p>
                    </ul>
                    <br class="clearfix" />
                </div>
            </div>
            <div id="inner">
                <div id="splash">
                    <span style="font-size: 22px;margin-left: 300px">Key Request Received</span>
                    <table  style=" margin-left: 110px;width:70%;position:absolute;">
                        <tr align="center" style="background-color: white;border-radius: 3px;color:green;font-family:verdana;font-size:12px;font-weight: bold">
                            <td height="36">Request ID</td>
                            <td height="36">Requested By</td>
                            <td height="36">Filename</td>
                            <td height="36">Send Key</td>
                        </tr>
                        <%
                            String user = null, filename = null, id = null, key = null, place = null, mob = null, sta = null, blood = null, dis = null, zip = null;
                            Connection con = null;
                            String names = request.getParameter("group");
                            String username = session.getAttribute("userid").toString();
                            System.out.println("get Group is " + names);
                            try {
                                con = DbConnector.getConnection();
                                Statement st = con.createStatement();
                                String query1 = "select * from request where status =  'No' ";//+"'";//'"+session.getAttribute("uID").toString() +"'";// "+" AND email = '"+mail+"' ";
                                ResultSet rs = st.executeQuery(query1);
                                //  System.out.println("hello");
                                while (rs.next()) {
                                    id = rs.getString("id");
                                    user = rs.getString("user");
                                    filename = rs.getString("filename");
                        %>
                        <tr align="center" style="font-family:verdana;font-size:14px;"> 
                            <td style="color: green" height="36"> <font><%=id%></font> </td>
                            <td style="color: green" height="36"> <font><%=user%></font> </td>
                            <td style="color: green"> <font><%=filename%></font> </td>
                            <td> <font color="#FF0000"><a href="send.jsp?<%=user%>,<%=filename%>">Send Key</a></font> </td>
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