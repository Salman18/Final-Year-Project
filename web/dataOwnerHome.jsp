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
                    <p class="first current_page_item"><a href="#">Welcome Data Owner</a></p>
                        <p><a href="index.jsp">Log Out</a></p>
                    <br class="clearfix" />
                    </ul>
                </div>
            </div>
            <div id="inner">
                <div id="splash">
                   
                        <span style="font-size: 22px;margin-left: 350px">File Upload</span><br><br>
                        <form action="uploadProcess.jsp" method="post" enctype="multipart/form-data">
                            <tr style="height: 40px;"><td>Choose File:</td><td> <input name="file" type="file" id="file"/></td></tr>
                               <tr style="height: 40px;"><td colspan="2"> <input type="submit" value="Upload"/> </td></tr>
                        <table>
                            
                        </table>
                        </form>
                                <br><br>
                                 <%if (request.getParameter("msg") != null) {
                                out.println(request.getParameter("msg"));
                            }%>
                </div>
            
            </div>

        </div>

    </body>
</html>