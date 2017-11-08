<%@page language="java" import="java.util.*" %>
<html>
<head>
<style>
div.container {
    width: 80%;
    
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
    margin-left: 170px;
    border-left: 1px solid gray;
    padding: 1em;
    overflow: hidden;
}
article {
    margin-left: 170px;
    border-left: 1px solid gray;
    padding: 1em;
    overflow: hidden;
}
</style>
</head>
<body>

<div class="container">

<header>
   <h1>SLIT</h1>
   <p1>Studenter</p1>
</header>
  
<%
String type = (String) request.getAttribute("type");    
%>

<% if (type.equals("student")) { %>
    <nav>
      <ul>
        <li><a href="">My blog</a></li>
        <li><a href="modulelist">Modules</a></li>
        <li><a href="index.jsp">Log out</a></li>
      </ul>
    </nav>
<%} else {%>
    <nav>
      <ul>
        <li><a href="studentlist">Students</a></li>
        <li><a href="modulelist">Modules</a></li>
        <li><a href="index.jsp">Log out</a></li>
      </ul>
    </nav>
<%}%> 

<table>
  <tr>
    <th>Bruker ID</th>
    <th>Elev</th>
    <th>Rolle</th>
    <th>E-post</th>
    <th>Modul</th>
  </tr>
<% Iterator itr;%>
<% List data=(List)request.getAttribute("data");
String studentNumber;
for(itr=data.iterator(); itr.hasNext(); ){
%>
<% studentNumber = "" + itr.next();%>    
  <tr>
    <td><%= studentNumber %></td>
    <td><%=itr.next()%> &ensp;</td>
    <td>Student &ensp;</td>
    <td><%=itr.next()%></td>
    <td>
		<a href="studentstatus?studentID=<%= studentNumber %>">
			<div style="height:100%;width:100%">
				&#8680;
			</div>
		</a>
	</td>
  </tr>
<%}%>
</table>

<article>
    <h2><a href="registration.jsp"> Register new student</a></h2>
</article>


<footer></footer>

</div>

</body>
</html>