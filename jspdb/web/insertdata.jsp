<%-- 
    Document   : insertdata
    Created on : 06.okt.2017, 16:01:22
    Author     : eriky
--%>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String pass = request.getParameter("password");
            
            
            
            
        try{
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jspdb", "root", "vrdZY1688");
        Statement st = con.createStatement();
        
        st.executeUpdate("insert into register(name,email,password)values('"+name+"','"+email+"','"+pass+"')");
        
        out.println("data is inserted");
        
        
        
        } catch(Exception e){
        
            out.println(e);
        }
        
        
        
        
        
        
        
        
        
        
        %>
    </body>
</html>
