<%@page import="java.util.logging.*"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page language="java" import="java.util.*" %>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

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
                margin: 1;
                padding: 1em;}

            nav ul {
                list-style-type: none;
                padding: 0;
            }

            nav ul a {
                text-decoration: none;
            }

        </style>
    </head>
    <body>

        <div class="container">

            <header>
                <h1>SLIT</h1>
                <p1>Modules</p1>
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
            
            <%-- Selve modulene --%> 
            <div class="container">
                <% String student = (String) request.getAttribute("student"); %>
                <h2><%= student %></h2> 
                <% if (type.equals("lærer")) { %>
                <h2><u><a href="moduleregistration.jsp"> Add New Module</a></u></h2>
                        <%}%>
                <div class="panel-group" id="accordion">

                    <%-- Iterer gjennom, og oppretter alle module fra DB --%> 
                    
                    <% ListIterator iter;%>      
                    <% List data=(List)request.getAttribute("data");
                    for(iter = data.listIterator(); iter.hasNext(); ){
                    %>
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            
                            <%-- Navn og link til collapse --%>
                            <h4 class="panel-title">                               
                                <a data-toggle="collapse" data-parent="#accordion" href="#<%=iter.nextIndex()%>">Modul <%=iter.next()%></a>
                            </h4>
                        </div>
                            
                        <%-- Kollapsfunksjonen i tabellene --%>    
                        <div id="<%=iter.previousIndex()%>"class="collapse">
                            <div class="panel-body">
                                <article>
                                    <div> <%=iter.next()%> 
                                        <h4> Date created: <%=iter.next()%> </h4>

                                    </div>
                                        
                                    <%-- Studentstatus Dropdown --%>    
                                    <div class="panel-heading">
                                        <h4 class="panel-title">
                                            <a data-toggle="collapse" href="#<%=iter.previousIndex()%>"><u><span style="color:#4286f4">Student Delivery Status</span></u></a>
                                        </h4>
                                    </div>
                                    <div id="<%=iter.previousIndex()%>"class="collapse">
                                        <div class="panel-body"> 

                                            <%-- Setter opp connection til databsen og utfører query --%>
                                            <sql:setDataSource var = "snapshot" driver = "${requestScope.driver}"
                                                               url = "${requestScope.con}"
                                                               user = "${requestScope.username}"  password = "${requestScope.password}"/>

                                            <sql:query dataSource = "${snapshot}" var = "result">
                                                select modulstatus.userID, modPoeng, modEval, name, modStatus from modulstatus left join register using (userID)where modul_ID=1

                                            </sql:query>
                                                
                                            <%-- Opretter tabell --%> 
                                            <table border = "1" width = "100%">
                                                <tr>
                                                    <th><center>Name</center></th>
                                                <th><center>Delivery Status</center></th>
                                                <th><center>Evaluation</center></th>
                                                <th><center>Points</center></th>
                                                <th><center>Review</center></th>
                                                </tr>
                                                
                                                <%-- Går gjennom resultat fra sql-spørring og legger de til i tabellen --%>     
                                                <c:forEach var = "row" items = "${result.rows}">
                                                    <tr>
                                                        <td> <c:out value = "${row.name}"/></td>
                                                        <td> <c:out value = "${row.modStatus}"/></td>
                                                        <td> <c:out value = "${row.modEval}"/></td>
                                                        <td> <c:out value = "${row.modPoeng}"/></td>
                                                        <td><center><a onclick="myFunction('${row.userID}');return false;">Review Assignment</a></center></td>
                                                    </tr>   
                                                </c:forEach>
                                            </table>

                                        </div>
                                    </div>
                            </div>
                        </div>
                        <%}%>
                    </div>
                </div>

                <footer></footer>

            </div>
            <script>
                <%-- Prompter 3 inputs for evaluering av modul, og
                     sender resultat i ett kall til "post" funksjonen
                --%> 
                function myFunction(myString) {
                    var x;
                    var eval = prompt("Enter your evaluation");
                    var status = prompt("godkjent/ikke Godkjent");
                    var poeng = prompt("Poengsum 1-100");
                    if (eval != null && status != null && poeng != null) {
                        x = "Evaluation is now set to: " + eval + ". Status: " + status + ". Score: "
                                + poeng;
                        alert(x);
                        post('evaluationHandler', {evaluation: eval, stat: status, points: poeng, userID: myString});
                    }
                }
                
                <%-- sender informasjon til servlet som form parametere --%>
                function post(path, params, method) {
                    method = method || "post"; // post metoden er default om ikke spesifisert

                    // Oppretter en form variabel og legger til paremetere
                    var form = document.createElement("form");
                    form.setAttribute("method", method);
                    form.setAttribute("action", path);

                    for (var key in params) {
                        if (params.hasOwnProperty(key)) {
                            var hiddenField = document.createElement("input");
                            hiddenField.setAttribute("type", "hidden");
                            hiddenField.setAttribute("name", key);
                            hiddenField.setAttribute("value", params[key]);

                            form.appendChild(hiddenField);
                        }
                    }

                    document.body.appendChild(form);
                    form.submit();
                }
            </script>
    </body>
</html>