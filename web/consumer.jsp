<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="content-type" content="text/html; charset=utf-8" />
        <meta name="description" content="" />
        <meta name="keywords" content="" />
        <title>HIDDEN CIPHERTEXT POLICY ATTRIBUTE-BASED ENCRYPTION UNDER STANDARD ASSUMPTIONS</title>
        <!--		<link href="http://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet" type="text/css" />-->
        <link rel="stylesheet" type="text/css" href="style.css" />
         <script type="text/javascript">
     function myFunction() {
     
      var name=document.ownerreg._name.value;    
      var pwd=document.ownerreg._password.value;
      var add=document.ownerreg.add.value;
      var age=document.ownerreg._age.value;
      var mb=document.ownerreg._phone.value;
      var mail=document.ownerreg._emailid.value;        
 
        if(name=="")
        {
            alert('Please Enter user id');
           document.ownerreg._name.focus();          
           return false; 
        }      

         if(pwd=="")
        {
            alert('Please Enter password');
            document.ownerreg._password.focus();
           //document.getElementById("lname").focus();          
           return false; 
        }
        if(add=="")
        {
            alert('Please Enter address');
           document.ownerreg.add.focus();          
           return false; 
        }
        if(age=="")
        {
            alert('Please Enter age');
           document.ownerreg._age.focus();          
           return false; 
        }
        if(isNaN(age))
        {
            alert('Please Enter numbers only');
           document.ownerreg._age.focus();          
           return false; 
        }
        if(mb=="")
        {
            alert('Please Enter mobile');
           document.ownerreg._phone.focus();          
           return false; 
        }
        if(isNaN(mb))
        {
            alert('Please Enter numbers only');
           document.ownerreg._phone.focus();          
           return false; 
        }
        if((mb.length < 1) || (mb.length > 10))
        {
            alert(" Your Mobile Number must be 1 to 10 Integers");
            document.form._phone.focus();
            return false;
        }
        if(mail=="")
        {
            alert('Please Enter  email');
           document.ownerreg._emailid.focus();          
           return false; 
        }      
        
         }
 </script>
    </head>
    <body>
        <div id="wrapper">
            <div id="header">
                <div id="logo">
                    <h3>HIDDEN CIPHERTEXT POLICY ATTRIBUTE-BASED ENCRYPTION UNDER STANDARD ASSUMPTIONS</h3>
                </div>
                <div id="menu">
                    <ul>
                        <p><a href="index.jsp">Home</a></p>
                        <p class="first current_page_item"><a href="registration.jsp">Data Owner</a></p>                       
                        <p><a href="consumer.jsp">Data Consumer</a></p>
                        
                    </ul>
                    <br class="clearfix" />
                </div>
            </div>
            <div id="inner">
                <div id="splash">
                    <span style="font-size: 22px;">Data Consumer Registration:</span>
                        <%if (request.getParameter("msg") != null) {
                                out.println(request.getParameter("msg"));
                            }%>
                        <form method="post" action="Consumer" name="ownerreg" onsubmit="return myFunction()">
                            <table width="90%">
                            <tr style="height: 40px;"><td>User id:</td><td><input type="text" size="30" style="height: 25px;" id="_name" name="_name"/></td></tr>
                            <tr style="height: 40px;"><td>Password:</td><td><input type="password" size="30" style="height: 25px;" id="_password" name="_password"/></td></tr>
                                <tr style="height: 40px;"><td>Address:</td><td><input type="text" size="30" style="height: 25px;" id="add" name="add" />
                                       </td></tr>
                                <tr style="height: 40px;"><td>Age:</td><td><input type="text" size="30" style="height: 25px;" id="_age" name="_age"/></td></tr>
                                <tr style="height: 40px;"><td>Phone:</td><td><input type="text" size="30" style="height: 25px;" id="_phone" name="_phone"/></td></tr>
                                <tr style="height: 40px;"><td>Email-Id:</td><td><input type="text" size="30" style="height: 25px;" id="_emailid" name="_emailid"/></td></tr>                                
                                <tr style="height: 40px;"><td></td><td><input type="submit" value="Submit" style="height: 25px;width: 90px;"/></td></tr>
                            </table>
                        </form>	
                </div>
            </div>
        </div>
    </body>
</html>