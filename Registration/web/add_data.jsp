<%@page language="java" import="java.util.*" %>
<%-- 
    Document   : add_data.jsp
    Created on : Nov 8, 2017, 8:44:35 PM
    Author     : Christoffers
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html><head>
        <script src="http://code.jquery.com/jquery-latest.js"></script>
        <script src="http://js.nicedit.com/nicEdit-latest.js" type="text/javascript"></script>
        <script type="text/javascript">bkLib.onDomLoaded(nicEditors.allTextAreas);</script>
        <title>Blog Entry</title>
        <style>

            header, footer {
                padding: 1em;
                color: white;
                background-color: brown;
                clear: left;
                text-align: center;
            }

            p {
                text-indent: 50px;
                text-align: justify;
                letter-spacing: 3px;
                margin-top: 10px;
                margin-bottom: 10px;
                margin-right: 300px;
                margin-left: 300px;
                text-align:center;
                font-size: 20px;
            }
            h3 {
                margin-top: 100px;
            }

            h2
            {
                margin: 50px;
                text-shadow:1px 1px 1px rgba(255,255,255,1);
                font-weight:normal;
                color:#F04646;
                letter-spacing:4pt;
                word-spacing:1pt;
                font-size:30px;
                text-align:center;
                font-family:trebuchet MS, sans-serif;line-height:1;
            }
            div.container {
                width: 80%;
                margin: auto;

            }


        </style>
    </head>
    <body bgcolor="white">
        <div class="container">
            <header>
                <h1>SLIT</h1>
                <p1>Student Blog</p1>
            </header>
            <%
            String type = (String) request.getAttribute("type");    
            %>

            <%-- Endrer menyen basert på brukertype --%>

            <% if (type.equals("student")) { %>
            <nav>
                <ul>
                    <li><a href="home">Home</a></li>
                    <li><a href="BlogListServlet">My blog</a></li>
                    <li><a href="modulelist">Modules</a></li>
                    <li><a href="index.jsp">Log out</a></li>
                </ul>
            </nav>
            <%} else {%>
            <nav>
                <ul>
                    <li><a href="home">Home</a></li>
                    <li><a href="studentlist">Students</a></li>
                    <li><a href="modulelist">Modules</a></li>
                    <li><a href="index.jsp">Log out</a></li>
                </ul>
            </nav>
            <%}%>

            <%-- Looper "data" listen og formaterer blogginnholdet --%>

            <% Iterator itr; 
String student = (String) request.getAttribute("student"); %>
            <h2><%=student%>'s Blog </h2>
            <% List data=(List)request.getAttribute("data");
            for(itr=data.iterator(); itr.hasNext(); ){
            %>
            <center><h3>Blog entry number: <%=itr.next()%></h3><center>
                    <p><%=itr.next()%></p>
                    <center>Created <i><%=itr.next()%></i> by user number: <i><%=itr.next()%></i></center>
                        <%}%> 

                    <%-- Bloggentry funksjon. Tar i bruk "niceEditor" sin textarea style --%>

                    <form action="writeBlog" method="post">
                        <pre>
                
            <textarea id="area1" type="varchar" name="beskrivelse" required="required" rows="8" cols="80"></textarea>
            
            <input type=submit name="submit" value="Send" onclick="nicEditors.findEditor('area1').saveContent();">
                        </pre>
                    </form>
                    <footer></footer>
                    <div>
                        </body></html>
