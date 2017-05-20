<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.util.DbConnector"%>
<%@page import="java.sql.Connection"%>
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
                        <p class="first current_page_item"><a href="cloudHome.jsp">Cloud Server</a></p>
                        <p><a href="partialdecrypt.jsp">Partial Decrypt</a></p>
                        <p><a href="index.jsp">Log Out</a></p>
                        <br class="clearfix" />
                    </ul>
                </div>
            </div>
            <div style="margin-left: 50px;margin-top: 20px;border: solid 2px;border-radius: 6px;border-color: white;height: 450px;">
                <br><h2><p style="text-align: center;color: darkblue">Cloud Server Partial Decryption</p></h2>

                    <table  style=" margin-left: 110px;width:70%;position:absolute;margin-top: -30px">
                        <tr align="center" style="background-color: white;border-radius: 3px;color:green;font-family:verdana;font-size:12px;font-weight: bold">

                            <td height="36">Username</td>
                            <td height="36">Filename</td>
                            <td height="36">Encrypted Content</td>
                            <td height="36">Partial Decrypt</td>

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
                                String query1 = "select * from upload where status =  'No' ";//+"'";//'"+session.getAttribute("uID").toString() +"'";// "+" AND email = '"+mail+"' ";
                                ResultSet rs = st.executeQuery(query1);
                                //  System.out.println("hello");
                                while (rs.next()) {
                                    //  System.out.println("java");
                                    user = rs.getString("userid");
                                    filename = rs.getString("filename");
                                    key = rs.getString("key_");
                                    blood = rs.getString("data_");

                        %>
                        <tr align="center" style="font-family:verdana;font-size:14px;"> 
                            <td style="color: green" height="36"> <font><%=user%></font> </td>
                            <td style="color: green"> <font><%=filename%></font> </td>
                            <td style="color: green;"> <textarea style="height: 50px;width: 300px"><%=blood%></textarea></td>
                            <td> <font color="#FF0000"><a href="decryptaction.jsp?<%=blood%>,<%=filename%>">Cloud DeCrypt</a></font> </td>
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
    </body>
</html>