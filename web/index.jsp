
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
                        <p class="first current_page_item"><a href="index.jsp">Home</a></p>
                            <p><a href="ownerLogin.jsp">Data Owner</a></p>
                            <p><a href="consumerLogin.jsp">Data Consumer</a></p>
                            <p><a href="domainLogin.jsp">Authority</a></p>
                            <p><a href="registration.jsp">Registration</a></p>
                            <p><a href="cloudLogin.jsp">Cloud</a></p>

                    </ul>
                    <br class="clearfix" />
                </div>
            </div>
            
            <div id="inner">
                <%if (request.getParameter("msg") != null) {
                        out.println(request.getParameter("msg"));
                    }%>
               

            </div>

        </div>

    </body>
</html>