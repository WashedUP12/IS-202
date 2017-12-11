<%@page language="java" import="java.util.*" %>
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
</head>
<body>

<div class="container">

<header>
   <h1>SLIT</h1>
   <p1>Student</p1>
</header>
  
<%
String type = (String) request.getAttribute("type");    
%>

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
<% String student = (String) request.getAttribute("student"); %>
<center><h2><%= student %></h2></center> 
<table>
    <tr>
      <th>Module Number</th>
      <th>Module Status</th>
    </tr>
<% Iterator itr;%>
<% List data=(List)request.getAttribute("data");
for(itr=data.iterator(); itr.hasNext(); ){
%>
  
    <tr>
      <td><%=itr.next()%></td>
      <td><%=itr.next()%></td>
    </tr>
<%}%>  
</table>

<footer></footer>

</div>

</body>
</html>