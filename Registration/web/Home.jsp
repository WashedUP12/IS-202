<%@page language="java" import="java.util.*" %>
<%@page import="java.util.logging.*"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<!DOCTYPE html>

<html>
    <head>
        <style>
            div.container {
                width: 80%;
                margin: auto;

            }

            header, footer {
                padding: 1em;
                color: white;
                background-color: brown;
                clear: left;
                text-align: center;
            }

            nav {
                float: left;
                max-width: 160px;
                margin: 0;
                padding: 1em;
            }

            nav ul {
                list-style-type: none;
                padding: 0;
            }

            nav ul a {
                text-decoration: none;
            }

            article {
                margin-left: 170px;
                border-left: 1px solid gray;
                padding: 1em;
                overflow: hidden;
            }

            .bordered {
                position: relative;
                left: 400px;
                width: 500px;
                height: 200px;
                padding: 20px;
                border: 10px inset #bfbfbf;
            }
            table {
                font-family: arial, sans-serif;
                border-collapse: collapse;
                width: 100%;
            }

            td, th {
                border: 1px solid #dddddd;
                text-align: left;
                padding: 8px;
            }

            tr:nth-child(even) {
                background-color: #dddddd;
            }
        </style>


    </style>
</head>
<body>

    <div class="container">

        <header>
            <h1>SLIT</h1>
            <p1>Homepage</p1>
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

        <article>
            <% String student = (String) request.getAttribute("student"); %>
            <h1> Welcome back, <%= student %></h1>
            Du er innlogget som <%= type %>

            <%-- Setter opp connection til databsen og utfører query --%>
            <div class="bordered">
                <sql:setDataSource var = "snapshot" driver = "${requestScope.driver}"
                                   url = "${requestScope.con}"
                                   user = "${requestScope.username}"  password = "${requestScope.password}"/>

                <sql:query dataSource = "${snapshot}" var = "result">
                    select type, name, tid, userID from varsel left join register using (userID)

                </sql:query>   

                <%-- Opretter en tabell --%>    
                <table>
                    <tr>
                        <th>Notification</th>
                        <th>Time of creation</th>
                        <th>Link</th>
                    </tr>
                    <%-- Går gjennom resultat fra sql-spørring og legger de til i tabellen --%> 
                    <c:forEach var = "row" items = "${result.rows}">
                        <c:set var="studType" value = "${row.type}"/>
                        <tr>
                            <td> <c:out value = "${row.name}"/> updated their status on a <u><span style="color:#4286f4"><c:out value = "${row.type}"/></span></u></td>
                            <td> <c:out value = "${row.tid}"/></td>
                            
                            <%-- JSTL IF/Else metode --%> 
                            <c:choose>
                                <c:when test="${row.type=='module'}">
                                    <td>
                                        <a href="modulelist">
                                            <div style="height:100%;width:100%">
                                                &#8680;
                                            </div>
                                        </a>
                                    </td>
                                </c:when>
                                <c:otherwise>
                                    <td>
                                        <a href="BlogListServlet?studentID=${row.userID}">
                                            <div style="height:100%;width:100%">
                                                &#8680;
                                            </div>
                                        </a>
                                    </td>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>  
                    </tr> 

                </table>
            </div>   
        </article>




        <footer></footer>

    </div>

</body>
</html>
