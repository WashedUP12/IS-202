<%-- 
    Document   : registration
    Created on : 08.okt.2017, 17:46:45
    Author     : eriky
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration</title>
    </head>
    
        <form action="Registration" method="post">
            <pre>
            <input type="varchar" name="user" required="required" placeholder="user name">
                
            <input type="varchar" name="password" required="required" placeholder="password">
            
            <input type="varchar" name="email" required="required" placeholder="email">
            
            <input type="submit" value="Register">
            </pre>
        </form>
    
</html>
