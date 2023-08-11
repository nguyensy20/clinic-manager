<%-- 
    Document   : login
    Created on : Oct 17, 2022, 10:00:33 AM
    Author     : sonnt
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <style><%@include file="../../css/bootstrap.min.css"%></style> 
         <style><%@include file="css/login-style.css"%></style> 
    </head>
    <body>
        <div class="login">
            <form action="login" method="POST" class="form">
                <table>
                    <tr>
                        <td>
                            Username: 
                        </td>
                        <td>
                            <input class= "input" type="text" name="username"/> 
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Password: 
                        </td>
                        <td>
                            <input class="input" type="password" name="password"/> 
                        </td>
                    </tr>

                </table>
                <input class="submit" type="submit" value="Login" /> 
        </div>
        </form>    
    </body>
</html>
