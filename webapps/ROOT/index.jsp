<%-- 
    Document   : login
    Created on : 12.sep.2017, 10:59:35
    Author     : eriky
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form method="post" action="LoginCheck">
            <table>
        <tr>
            <td>User Name</td>
            <td><input type="text" name="uname"></td>
        </tr>
        <tr>
            <td>Password</td>
            <td><input type="password" name="password"></td>
        </tr>
       <tr>
           <td></td>
           <td><input type="submit" value="login"></td>
       </tr>
            </table>
    </form>
    </body>
</html>
